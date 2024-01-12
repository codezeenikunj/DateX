<?php

namespace App\Http\Controllers;

use App\Models\Images;
use App\Models\Interest;
use App\Models\LiveApplications;
use App\Models\LiveHistory;
use App\Models\Myfunction;
use App\Models\RedeemRequest;
use App\Models\Report;
use App\Models\UserNotification;
use App\Models\Users;
use App\Models\User;
use App\Models\Like;
use App\Models\SwipeCount;
use App\Models\VerifyRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Crypt;
use DB;
use Carbon\Carbon;
use function PHPUnit\Framework\isEmpty;
use Laravel\Passport\Token;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Auth;
class UsersController extends Controller
{

    public function social_login(Request $request){
       $user=User::first();
       if(Auth::attempt(['email' => $user->email, 'password' => $user->identity])){ 
            $user = Auth::user(); 
            return $success['token'] =  $user->createToken('MyApp'); 
            $success['name'] =  $user->name;
        } 
        else{ 
             return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
    }
    public function profile_x(Request $request){
        return $request->user();
    }
    public function verify_email($token){
        $input=json_decode(Crypt::decryptString($token));
        $user=User::where('identity',$input->identity)->first();
        if(!$user){
            abort(404);
        }
        $user->email=$input->email;
        $user->save();
        return view('success');
    }
    function logOutUser(Request $request)
    {
        $rules = [
            'user_id' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);

        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        $user->device_token = null;
        $user->save();

        return response()->json(['status' => true, 'message' => 'User logged out successfully !']);
    }

    function fetchUsersByCordinates(Request $request)
    {
        $rules = [
            'lat' => 'required',
            'long' => 'required',
            'km' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $users = User::with('images')->where('is_block', 0)->where('is_fake', 0)->where('show_on_map', 1)->where('anonymous', 0)->get();

        $usersData = [];
        foreach ($users as $user) {

            $distance = Myfunction::point2point_distance($request->lat, $request->long, $user->lattitude, $user->longitude, "K", $request->km);
            $user['interests']  = Interest::whereIn('id', explode(",", $user['interests']))->get();
            if ($distance) {
                array_push($usersData, $user);
            }
        }
        return response()->json(['status' => true, 'message' => 'Data fetched successfully !', 'data' => $usersData]);
    }

    function addUserImage(Request $req)
    {
        $img = new Images();
        $imgfile = $req->file('image');
        if($req->file('image')){
            $imageName = time().'.'.$req->image->extension();  
            $req->image->move(public_path('uploads'), $imageName);
            $img->image ='uploads/'.$imageName;
        }
       // $img->image = $path;
        $img->user_id = $req->id;
        $img->save();

        return json_encode([
            'status' => true,
            'message' => 'Image Added successfully!',
        ]);
    }
    function deleteUserImage($imgId)
    {
        $img = Images::find($imgId);

        $imgCount = Images::where('user_id', $img->user_id)->count();
        if ($imgCount == 1) {
            return json_encode([
                'status' => false,
                'message' => 'Minimum one image is required !',
            ]);
        }

        unlink(public_path($img->image));
        $img->delete();
        return json_encode([
            'status' => true,
            'message' => 'Image Deleted successfully!',
        ]);
    }
    function deleteUser(Request $request)
    {
        $user_id=$request->user_id;
        $user=User::where('id',$user_id)->first();
        $user->delete();
        return json_encode([
            'status' => true,
            'message' => 'Deleted successfully!',
        ]);
    }
    function updateUser(Request $req)
    {
        $result = User::where('id', $req->id)->update([
            "first_name" => $req->first_name,
            "last_name" => $req->last_name,
            "email" => $req->email,
            "gender" => $req->gender,
            "birth_date" => $req->birth_date
        ]);

        return json_encode([
            'status' => true,
            'message' => 'data updates successfully!',
        ]);
    }
    function test(Request $req)
    {

        $user = User::with('liveApplications')->first();

        $intrestIds = Interest::inRandomOrder()->limit(4)->pluck('id');

        return json_encode(['data' => $intrestIds]);
    }

    function addFakeUserFromAdmin(Request $request)
    { 
        $input = $request->all();
        $validator = Validator::make($input, [
            'mobile_number' => 'required|unique:users,mobile_number',
            'first_name' => 'required|string|max:200',
            'birth_date' => 'required',
            'gender' => 'required|in:1,2,3'
        ]);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }
        $input['age'] = Carbon::parse($request->birth_date)->age;
        $input['identity'] = $request->identity?$request->identity:Str::random(12);
        $input['password'] = Hash::make($input['identity']);
        $result=User::create($input);
        if($result){
            if($request->has('image')){
                foreach($request->file('image') as $img){
                    $it = new Images();
                    $imageName = rand(10,100).time().'.'.$img->extension();  
                    $img->move(public_path('uploads'), $imageName);
                    $it->image = 'uploads/'.$imageName;
                    $it->user_id = $result->id;
                    $it->save();        
                }
            }
        }
        $user=User::whereId($result->id)->first();
        return response()->json(['status' => true, 'message' => "Fake user added successfully !"]);
    }

    function getExplorePageProfileList(Request $request)
    {
        $rules = [
            'user_id' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        $blocked_users = explode(',', $user->blocked_users);
        array_push($blocked_users, $user->id);
        $like=Like::where('user_id',$request->user_id)->pluck('rateable_id');
        $profiles =  User::with('images')->whereHas('images', function ( $query) {
                        $query->whereNotNull('id');
                    })->whereNotIn('id', $blocked_users)->where('id','!=',$request->user_id)->where('is_block', 0)->where('anonymous',0)->whereNotIn('id',$like)->inRandomOrder()->limit(15)->get();

        foreach ($profiles as $user) {
            $user['interests']  = Interest::whereIn('id', explode(",", $user['interests']))->get();
        }

        return json_encode([
            'status' => true,
            'message' => 'data found successfully!',
            'data' => $profiles,
        ]);
    }

    function getRandomProfile(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'gender' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }
        
        $blocked_users = explode(',', $user->blocked_users);
        array_push($blocked_users, $user->id);
        $like=Like::where('user_id',$request->user_id)->pluck('rateable_id');
        if ($request->gender == 3) {
            $randomUser =  User::with('images')->whereNotIn('id', $blocked_users)->where('is_block', 0)->where('id','!=',$request->user_id)->whereHas('images', function ( $query) {
                        $query->whereNotNull('id');
                    })->where('anonymous',0)->whereNotIn('id',$like)->inRandomOrder()->first();
        } else {
            $randomUser =  User::with('images')->whereNotIn('id', $blocked_users)->where('is_block', 0)->where('id','!=',$request->user_id)->whereHas('images', function ( $query) {
                        $query->whereNotNull('id');
                    })->where('anonymous',0)->where('gender', $request->gender)->whereNotIn('id',$like)->inRandomOrder()->first();
        }
        if($randomUser){
            $randomUser['interests']  = Interest::whereIn('id', explode(",", $user['interests']))->get();
            $randomUser['is_like']=Like::where('user_id',$request->user_id)->where('rateable_id',$randomUser->id)->where('like_type','Normal')->first()?true:false;
            $randomUser['is_super_like']=Like::where('user_id',$request->user_id)->where('rateable_id',$randomUser->id)->where('rateable_id',$randomUser->id)->where('like_type','Super')->first()?true:false;
        }
        return json_encode([
            'status' => true,
            'message' => 'data found successfully!',
            'data' => $randomUser,
        ]);
    }

    function updateUserBlockList(Request $request)
    {
        $rules = [
            'user_id' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::where('id', $request->user_id)->first();
        if ($user == null) {
            return response()->json(['status' => false, 'message' => "User doesn't exists !"]);
        }

        $user->blocked_users = $request->blocked_users;
        $user->save();

        $data = User::with('images')->where('id', $request->user_id)->first();

        $data['interests'] = Interest::whereIn('id', explode(",", $data['interests']))->get();

        return response()->json(['status' => true, 'message' => "Blocklist updated successfully !", 'data' => $data]);
    }

    function deleteMyAccount(Request $request)
    {
        $rules = [
            'user_id' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        // Images::where('user_id', $user->id)->delete();
        // UserNotification::where('user_id', $user->id)->delete();
        // LiveApplications::where('user_id', $user->id)->delete();
        // LiveHistory::where('user_id', $user->id)->delete();
        // RedeemRequest::where('user_id', $user->id)->delete();
        // VerifyRequest::where('user_id', $user->id)->delete();
        // Report::where('user_id', $user->id)->delete();
        // UserNotification::where('data_user_id', $user->id)->delete();
        $user->delete();

        return response()->json(['status' => true, 'message' => "Account Deleted Successfully !"]);
    }

    function rejectVerificationRequest($id)
    {
        $verifyRequest = VerifyRequest::find($id);
        $verifyRequest->user->is_verified = 0;
        $verifyRequest->user->save();
        $verifyRequest->delete();
        return response()->json(['status' => true]);
    }

    function approveVerificationRequest($id)
    {
        $verifyRequest = VerifyRequest::find($id);
        $verifyRequest->user->is_verified = 2;
        $verifyRequest->user->save();
        $verifyRequest->delete();
        // GlobalFunction::sendPushToUser(env("APP_NAME"), "Your Profile has been verified successfully!" ,$verifyRequest->user->device_token);
        return response()->json(['status' => true]);
    }

    function fetchverificationRequests(Request $request)
    {
        $totalData =  VerifyRequest::count();
        $rows = VerifyRequest::orderBy('id', 'DESC')->get();
        $result = $rows;

        $columns = array(
            0 => 'id',
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        $totalData = VerifyRequest::count();
        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $result = VerifyRequest::offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $result =  VerifyRequest::with('user')
                ->whereHas('user', function ($query) use ($search) {
                    $query->Where('fullname', 'LIKE', "%{$search}%")
                        ->orWhere('identity', 'LIKE', "%{$search}%");
                })
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = VerifyRequest::with('user')
                ->whereHas('user', function ($query) use ($search) {
                    $query->Where('fullname', 'LIKE', "%{$search}%")
                        ->orWhere('identity', 'LIKE', "%{$search}%");
                })
                ->count();
        }
        $data = array();
        foreach ($result as $item) {


            if ($item->user->images[0] != null) {
                $imgUrl = "public/" . $item->user->images[0]->image;
            } else {
                $imgUrl = "http://placehold.jp/150x150.png";
            }
            $image = '<img src="' . $imgUrl . '" width="50" height="50">';


            $selfieUrl = "public/" . $item->selfie;
            $selfie = '<img style="cursor: pointer;" class="img-preview" rel="' . $selfieUrl . '" src="' . $selfieUrl . '" width="50" height="50">';

            $docUrl = "public/" . ($item->document);
            $document = '<img style="cursor: pointer;" class="img-preview" rel="' . $docUrl . '" src="' . $docUrl . '" width="50" height="50">';


            $approve = '<a href=""class=" btn btn-success text-white approve ml-2" rel=' . $item->id . ' >' . __("Approve") . '</a>';
            $reject = '<a href=""class=" btn btn-danger text-white reject ml-2" rel=' . $item->id . ' >' . __("Reject") . '</a>';

            $action = $approve . $reject;

            $data[] = array(
                $image,
                $selfie,
                // $document,
                // $item->document_type,
                $item->fullname,
                $item->user->identity,
                $action

            );
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => $totalFiltered,
            "data"            => $data
        );
        echo json_encode($json_data);
        exit();
    }

    function verificationrequests()
    {
        return view('verificationrequests');
    }

    function applyForVerification(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'selfie' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        if ($user->is_verified == 1) {
            return json_encode([
                'status' => false,
                'message' => 'The request has been submitted already!',
            ]);
        }
        if ($user->is_verified == 2) {
            return json_encode([
                'status' => false,
                'message' => 'This user is already verified !',
            ]);
        }

        $verifyReq = new VerifyRequest();
        $verifyReq->user_id = $request->user_id;
        // $verifyReq->document_type = $request->document_type;
        $verifyReq->fullname = $user->fullname;
        $verifyReq->status = 0;
        // $verifyReq->document = $request->file('document')->store('uploads');
        // $verifyReq->selfie = $request->file('selfie')->store('uploads');
         if($request->file('selfie')){
            $imageName = time().'.'.$request->selfie->extension();  
            $request->selfie->move(public_path('uploads'), $imageName);
            $verifyReq->selfie ='uploads/'.$imageName;
        }
        $verifyReq->save();

        $user->is_verified = 1;
        $user->save();

        $user['images'] = Images::where('user_id', $request->user_id)->get();
        $user['interests'] = Interest::whereIn('id', explode(",", $user['interests']))->get();

        return json_encode(['status' => true, 'message' => "Verification request submitted successfully !", 'data' => $user]);
    }

    function updateLikedProfile(Request $request)
    {
        $rules = [
            'user_id' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);

        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        $user->likedprofile = $request->profiles;
        $user->save();

        $data = User::where('id', $request->user_id)->first();

        $data['images'] = Images::where('user_id', $request->user_id)->get();
        $data['interests'] = Interest::whereIn('id', explode(",", $data['interests']))->get();


        return json_encode(['status' => true, 'message' => __('app.Updatesuccessful'), 'data' => $data]);
    }

    function fetchSavedProfiles(Request $request)
    {

        $rules = [
            'user_id' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);

        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        $array = explode(',', $user->savedprofile);
        $data =  User::whereIn('id', $array)->with('images')->get();
        $data = $data->reverse()->values();


        return json_encode([
            'status' => true,
            'message' => 'profiles fetched successfully!',
            'data' => $data
        ]);
    }

    function allowLiveToUser($id)
    {

        User::where('id', $id)->update(['can_go_live' => 2]);
        return response()->json(['status' => true, 'message' => __('app.Updatesuccessful')]);
    }
    function restrictLiveToUser($id)
    {

        User::where('id', $id)->update(['can_go_live' => 0]);
        return response()->json(['status' => true, 'message' => __('app.Updatesuccessful')]);
        //

    }

    function increaseStreamCountOfUser(Request $request)
    {
        $rules = [
            'user_id' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);

        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        $user->total_streams += 1;
        $result = $user->save();

        if ($result) {
            return json_encode([
                'status' => true,
                'message' => 'Stream count increased successfully',
                'total_streams' => $user->total_streams
            ]);
        } else {
            return json_encode([
                'status' => false,
                'message' => 'something went wrong!',

            ]);
        }
    }

    function minusCoinsFromWallet(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'amount' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);

        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        if ($user->wallet < $request->amount) {
            return json_encode([
                'status' => false,
                'message' => 'No enough coins in the wallet!',
                'wallet' => $user->wallet,
            ]);
        }

        $user->wallet -= $request->amount;
        $result = $user->save();

        if ($result) {
            return json_encode([
                'status' => true,
                'message' => 'coins deducted from wallet successfully',
                'wallet' => $user->wallet,
                'total_collected' => $user->total_collected,
            ]);
        } else {
            return json_encode([
                'status' => false,
                'message' => 'something went wrong!',

            ]);
        }
    }

    function addCoinsToWallet(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'amount' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);

        if ($user == null) {
            return json_encode([
                'status' => false,
                'message' => 'user not found!',
            ]);
        }

        $user->wallet  += $request->amount;
        $user->total_collected += $request->amount;
        $result = $user->save();

        if ($result) {
            return json_encode([
                'status' => true,
                'message' => 'coins added to wallet successfully',
                'wallet' => $user->wallet,
                'total_collected' => $user->total_collected,
            ]);
        } else {
            return json_encode([
                'status' => false,
                'message' => 'something went wrong!',

            ]);
        }
    }


    function updateLiveStatus(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'state' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        $user->is_live_now = $request->state;
        $user->save();

        $data = User::with('images')->where('id', $request->user_id)->first();
        $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

        return json_encode([
            'status' => true,
            'message' => 'is_live_now state updated successfully',
            'data' => $data
        ]);
    }
    function onOffVideoCalls(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'state' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        $user->is_video_call = $request->state;
        $user->save();

        $data = User::with('images')->where('id', $request->user_id)->first();
        $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

        return json_encode([
            'status' => true,
            'message' => 'is_video_call state updated successfully',
            'data' => $data
        ]);
    }

    function onOffAnonymous(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'state' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        $user->anonymous = $request->state;
        $user->save();

        $data = User::with('images')->where('id', $request->user_id)->first();
        $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

        return json_encode([
            'status' => true,
            'message' => 'anonymous state updated successfully',
            'data' => $data
        ]);
    }

    function onOffShowMeOnMap(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'state' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        $user->show_on_map = $request->state;
        $user->save();

        $data = User::with('images')->where('id', $request->user_id)->first();
        $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

        return json_encode([
            'status' => true,
            'message' => 'show_on_map state updated successfully',
            'data' => $data
        ]);
    }


    function onOffNotification(Request $request)
    {
        $rules = [
            'user_id' => 'required',
            'state' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $user = User::find($request->user_id);
        $user->is_notification = $request->state;
        $user->save();

        $data = User::with('images')->where('id', $request->user_id)->first();
        $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

        return json_encode([
            'status' => true,
            'message' => 'notification state updated successfully',
            'data' => $data
        ]);
    }

    function fetchAllUsers(Request $request)
    {

        $totalData =  User::count();
        $rows = User::orderBy('id', 'DESC')->get();


        $result = $rows;

        $columns = array(
            0 => 'id',
            1 => 'first_name',
            2 => 'mobile_number'
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $result = User::offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $result =  User::Where('first_name', 'LIKE', "%{$search}%")
                ->orWhere('identity', 'LIKE', "%{$search}%")
                ->orWhere('mobile_number', 'LIKE', "%{$search}%")
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = User::where('identity', 'LIKE', "%{$search}%")
                ->orWhere('first_name', 'LIKE', "%{$search}%")
                ->orWhere('mobile_number', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($result as $item) {

            if ($item->is_block == 0) {
                $block  =  '<a class=" btn btn-danger text-white block" rel=' . $item->id . ' >' . __('block') . '</a>';
            } else {
                $block  =  '<a class=" btn btn-success  text-white unblock " rel=' . $item->id . ' >' . __('unblock') . '</a>';
            }

            if ($item->gender == 1) {
                $gender = ' <span  class="badge bg-dark text-white  ">' . __('male') . '</span>';
            }else if($item->gender == 1)
                $gender = '  <span  class="badge bg-dark text-white  ">' . __('female') . '</span>';   
             else {
                $gender = '  <span  class="badge bg-dark text-white  ">' . __('other') . '</span>';
            }

            if (count($item->images) > 0) {
                $image = '<img src="'.$item->images[0]->image . '" width="50" height="50">';
            } else {
                $image = '<img src="http://placehold.jp/150x150.png" width="50" height="50">';
            }

            $action = '<a href="' . route('viewUserDetails', $item->id) . '"class=" btn btn-primary text-white " rel=' . $item->id . ' ><i class="fas fa-eye"></i></a>';

            $data[] = array(


                $image,
                $item->identity,
                $item->first_name.$item->last_name,
                $item->country_code.$item->mobile_number,
                $item->age,
                $gender,
                $block,
                $action,

            );
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => $totalFiltered,
            "data"            => $data
        );
        echo json_encode($json_data);
        exit();
    }

    function fetchStreamerUsers(Request $request)
    {
        $totalData =  User::where('can_go_live', '=', 2)->count();
        $rows = User::where('can_go_live', '=', 2)->orderBy('id', 'DESC')->get();


        $result = $rows;

        $columns = array(
            0 => 'id',
            1 => 'fullname'
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $result = User::where('can_go_live', '=', 2)
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $result =  User::where(function ($query) use ($search) {
                $query->Where('fullname', 'LIKE', "%{$search}%")
                    ->orWhere('identity', 'LIKE', "%{$search}%");
            })
                ->where('can_go_live', '=', 2)
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = User::where(function ($query) use ($search) {
                $query->Where('fullname', 'LIKE', "%{$search}%")
                    ->orWhere('identity', 'LIKE', "%{$search}%");
            })
                ->where('can_go_live', '=', 2)
                ->orWhere('fullname', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($result as $item) {

            if ($item->is_block == 0) {
                $block  =  '<a class=" btn btn-danger text-white block" rel=' . $item->id . ' >' . __('block') . '</a>';
            } else {
                $block  =  '<a class=" btn btn-success  text-white unblock " rel=' . $item->id . ' >' . __('unblock') . '</a>';
            }

            if ($item->gender == 1) {
                $gender = ' <span  class="badge bg-dark text-white  ">' . __('male') . '</span>';
            } else {
                $gender = '  <span  class="badge bg-dark text-white  ">' . __('female') . '</span>';
            }

            if (count($item->images) > 0) {
                 $image = '<img src="'.env("image") . $item->images[0]->image . '" width="50" height="50">';
            } else {
                $image = '<img src="http://placehold.jp/150x150.png" width="50" height="50">';
            }

            if ($item->can_go_live == 2) {
                $liveEligible = ' <span class="badge bg-success text-white  ">' . __('yes') . '</span>';;
            } else {
                $liveEligible = ' <span class="badge bg-danger text-white  ">' . __('no') . '</span>';;
            }

            $action = '<a href="' . route('viewUserDetails', $item->id) . '"class=" btn btn-primary text-white " rel=' . $item->id . ' ><i class="fas fa-eye"></i></a>';

            $data[] = array(


                $image,
                $item->identity,
                $item->fullname,
                $liveEligible,
                $item->age,
                $gender,
                $block,
                $action,

            );
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => $totalFiltered,
            "data"            => $data
        );
        echo json_encode($json_data);
        exit();
    }
    function fetchFakeUsers(Request $request)
    {
        $totalData =  User::where('is_fake', '=', 1)->count();
        $rows = User::where('is_fake', '=', 1)->orderBy('id', 'DESC')->get();


        $result = $rows;

        $columns = array(
            0 => 'id',
            1 => 'fullname'
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $result = User::where('is_fake', '=', 1)
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $result =  User::where(function ($query) use ($search) {
                $query->Where('fullname', 'LIKE', "%{$search}%")
                    ->orWhere('identity', 'LIKE', "%{$search}%");
            })
                ->where('is_fake', '=', 1)
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = User::where(function ($query) use ($search) {
                $query->Where('fullname', 'LIKE', "%{$search}%")
                    ->orWhere('identity', 'LIKE', "%{$search}%");
            })
                ->where('is_fake', '=', 1)
                ->orWhere('fullname', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($result as $item) {

            if ($item->is_block == 0) {
                $block  =  '<a class=" btn btn-danger text-white block" rel=' . $item->id . ' >' . __('block') . '</a>';
            } else {
                $block  =  '<a class=" btn btn-success  text-white unblock " rel=' . $item->id . ' >' . __('unblock') . '</a>';
            }

            if ($item->gender == 1) {
                $gender = ' <span  class="badge bg-dark text-white  ">' . __('male') . '</span>';
            } else {
                $gender = '  <span  class="badge bg-dark text-white  ">' . __('female') . '</span>';
            }

            if (count($item->images) > 0) {
                $image = '<img src="'.env("image") . $item->images[0]->image . '" width="50" height="50">';
            } else {
                $image = '<img src="http://placehold.jp/150x150.png" width="50" height="50">';
            }

            $action = '<a href="' . route('viewUserDetails', $item->id) . '"class=" btn btn-primary text-white " rel=' . $item->id . ' ><i class="fas fa-eye"></i></a>';

            $data[] = array(
                $image,
                $item->fullname,
                $item->identity,
                $item->password,
                $item->age,
                $gender,
                $block,
                $action,

            );
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => $totalFiltered,
            "data"            => $data
        );
        echo json_encode($json_data);
        exit();
    }

    function addUserDetails(Request $req)
    {

        if ($req->has('password')) {
            $data = User::where('identity', $req->identity)->where('password', $req->password)->first();
            if ($data == null) {
                return json_encode(['status' => false, 'message' => "Incorrect Identity and Password combination"]);
            }
        }


        $data = User::withTrashed()->where('identity', $req->identity)->first();

        if ($data == null) {
            $user = new Users;
            $user->fullname = Myfunction::customReplace($req->fullname);
            $user->identity = $req->identity;
            $user->device_token = $req->device_token;
            $user->device_type = $req->device_type;
            $user->login_type = $req->login_type;
            if($req->referral_code){
                $ref_user=User::where('referral_code',$req->referral_code)->first();
                if(!$ref_user){
                    return json_encode([
                        'status' => true,
                        'message' => 'Invalid Referral Code',
                        'data' => $req->all()
                    ]);
                }
                //return User::where('reference_by',$ref_user->id)->count();
                if(User::where('reference_by',$ref_user->id)->count()==(DB::table('appdata')->where('id', 1)->value('first_friend')-1)){
                    $ref_user->wallet  +=  DB::table('appdata')->where('id', 1)->value('referral_diamond');
                    $ref_user->total_collected +=  DB::table('appdata')->where('id', 1)->value('referral_diamond');
                }
                $ref_user->save();
                $user->reference_by=$ref_user->id;
            }
            $user->save();
            $data =  User::with('images')->where('id', $user->id)->first();
            $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();


            return json_encode(['status' => true, 'message' => __('app.UserAddSuccessful'), 'data' => $data]);
        } else {
            User::withTrashed()->where('identity', $req->identity)->restore();
            User::where('identity', $req->identity)->update([
                'device_token' => $req->device_token,
                'device_type' => $req->device_type,
                'login_type' => $req->login_type,

            ]);

            $data = User::with('images')->where('id', $data['id'])->first();
            $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

            return json_encode(['status' => true, 'message' => __('app.UserAllReadyExists'), 'data' => $data]);
        }
    }

    function searchUsersForInterest(Request $req)
    {
   
        $rules = [
            'start' => 'required',
            'count' => 'required',
            'interest_id' => 'required',
        ];

        $validator = Validator::make($req->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $interestID = $req->interest_id;

        $result =  User::with('images')->whereHas('images', function ( $query) {
                $query->whereNotNull('id');
            })->Where('fullname', 'LIKE', "%{$req->keyword}%")
            ->whereRaw("find_in_set($interestID , interests)");
        if($req->user_id){    
            $result=$result->where('id','!=',$req->user_id);
        }
        $result=$result->offset($req->start)->limit($req->count)->get();
        foreach ($result as $user) {
            $user['interests']  = Interest::whereIn('id', explode(",", $user['interests']))->get();
        }

        if (isEmpty($result)) {
            return json_encode([
                'status' => true,
                'message' => 'No data found',
                'data' => $result
            ]);
        }

        return json_encode([
            'status' => true,
            'message' => 'data get successfully',
            'data' => $result
        ]);
    }

    function searchUsers(Request $req)
    {
      
        $rules = [
            'start' => 'required',
            'count' => 'required',
        ];

        $validator = Validator::make($req->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }

        $result =  User::with('images')->whereHas('images', function ( $query) {
                $query->whereNotNull('id');
            })->Where('fullname', 'LIKE', "%{$req->keyword}%");
        if($req->user_id){    
            $result=$result->where('id','!=',$req->user_id);
        }
        $result=$result->offset($req->start)->limit($req->count)->get();

        foreach ($result as $user) {
            $user['interests']  = Interest::whereIn('id', explode(",", $user['interests']))->get();
        }

        if (isEmpty($result)) {
            return json_encode([
                'status' => true,
                'message' => 'No data found',
                'data' => $result
            ]);
        }
        return json_encode([
            'status' => true,
            'message' => 'data get successfully',
            'data' => $result
        ]);
    }


    function updateProfile(Request $req)
    {


        $data = User::where('id', $req->user_id)->first();

        if ($data == null) {


            return json_encode(['status' => false, 'message' => __('app.UserNotFound')]);
        } else {


            if ($req->deleteimagestitle != null) {
                foreach ($req->deleteimagestitle as $oneImageData) {
                    unlink(public_path('uploads' . $oneImageData));
                }
            }


            if ($req->has("deleteimageids")) {
                Images::whereIn('id', $req->deleteimageids)->delete();
            }

            $user = User::find($req->user_id);
            if ($req->has("fullname")) {
                $user->fullname = Myfunction::customReplace($req->fullname);
            }
            if ($req->has("gender")) {
                $user->gender = $req->gender;
            }
            if ($req->has('youtube')) {
                $user->youtube = $req->youtube;
            }
            if ($req->has("instagram")) {
                $user->instagram = $req->instagram;
            }
            if ($req->has("facebook")) {
                $user->facebook = $req->facebook;
            }
            if ($req->has("live")) {
                $user->live =  Myfunction::customReplace($req->live);
            }
            if ($req->has("bio")) {
                $user->bio = Myfunction::customReplace($req->bio);
            }
            if ($req->has("about")) {
                $user->about = Myfunction::customReplace($req->about);
            }
            if ($req->has("lattitude")) {
                $user->lattitude = $req->lattitude;
            }
            if ($req->has("longitude")) {
                $user->longitude = $req->longitude;
            }
            if ($req->has("age")) {
                $user->age = $req->age;
            }
            if ($req->has("birth_date")) {
                $user->birth_date = $req->birth_date;
                $age=(date('Y') - date('Y',strtotime($req->birth_date)));
                if($age<18){
                     return json_encode(['status' => false, 'message' =>"you can't use this application your age under 18"]);
                }
                $user->age = $age;
            }
            if ($req->has("interests")) {
                $user->interests = $req->interests;
            }
            $result = $user->save();

             if ($req->file('image')) {
                foreach ($req->file('image') as $img) {
                    $it = new Images();
                    $imageName = rand(10,100).time().'.'.$img->extension();  
                    $img->move(public_path('uploads'), $imageName);
                    $it->image = 'uploads/'.$imageName;
                    $it->user_id = $req->user_id;
                    $it->save();
                }
            }

            $data = User::where('id', $req->user_id)->first();

            $data['images']  = Images::where('user_id', $req->user_id)->get();
            $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

            return json_encode(['status' => true, 'message' => __('app.Updatesuccessful'), 'data' => $data]);
        }
    }


    function blockUser($id)
    {
        User::where('id', $id)->update(['is_block' => 1]);
        Report::where('user_id', $id)->delete();
        Token::where('user_id', $id)->delete();
        return response()->json(['status' => true, 'message' => __('app.Updatesuccessful')]);
    }

    function unblockUser($id)
    {
        User::where('id', $id)->update(['is_block' => 0]);

        return response()->json(['status' => true, 'message' => __('app.Updatesuccessful')]);
    }


    function viewUserDetails($id)
    {

        $data =  User::where('id', $id)->with('images')->first();

        return view('viewuser', ['data' => $data]);
    }

    function getProfile(Request $req)
    {
        $data = User::where('id', $req->user_id)->withTrashed()->first();
        if($req->rateable_id){
            $data['is_like']=Like::where('rateable_id',$req->user_id)->where('user_id',$req->rateable_id)->where('like_type','Normal')->first()?true:false;
            $data['is_super_like']=Like::where('rateable_id',$req->user_id)->where('user_id',$req->rateable_id)->where('like_type','Super')->first()?true:false;
        }
        $data['is_deleted']=$data->deleted_at?true:false;
        $data['images']  = Images::where('user_id', $req->user_id)->get();
        $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();

        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);
    }

    public function updateSavedProfile(Request $req)
    {

        User::where('id', $req->user_id)->update(['savedprofile' => $req->profiles]);

        $data = User::where('id', $req->user_id)->first();

        $data['images']  = Images::where('user_id', $req->user_id)->select('image', 'id')->get();
        $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->select('image', 'title')->get();


        return json_encode(['status' => true, 'message' => __('app.Updatesuccessful'), 'data' => $data]);
    }


    function getUserDetails(Request $request)
    {

        $data =  User::where('identity', $request->email)->first();

        if ($data != null) {
            $data['image']  = Images::where('user_id', $data['id'])->first();
            // Interests added
            $data['interests']  = Interest::whereIn('id', explode(",", $data['interests']))->get();
        } else {
            return json_encode(['status' => false, 'message' => __('app.UserNotFound')]);
        }
        $data['password'] = '';
        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);
    }
    public function swipe_counts(Request $request){
        $swip_limit=DB::table('appdata')->where('id', 1)->value('per_day_swipe_limit');
        $swipe_user=SwipeCount::where('user_id',$request->user_id)->first();
        if(!$swipe_user){
            SwipeCount::create(['user_id'=>$request->user_id,'swipe_count'=>$swip_limit-1]);
            return json_encode(['status' => true, 'message' =>'successfully', 'data' =>['swipe_limit'=>$swip_limit-1]]);
        }
        if($swipe_user){
            $to = Carbon::createFromFormat('Y-m-d H:s:i', $swipe_user->created_at);
            $from = Carbon::createFromFormat('Y-m-d H:s:i', date('Y-m-d H:s:i'));
            if($to->diffInHours($from)>=24){
                SwipeCount::where('user_id',$request->user_id)->delete();
                SwipeCount::create(['user_id'=>$request->user_id,'swipe_count'=>$swip_limit-1]);
                return json_encode(['status' => true, 'message' =>'successfully', 'data' =>['swipe_limit'=>$swip_limit-1]]);
            }
            if($swipe_user->swipe_count==0){
                return json_encode(['status' => false, 'message' =>'Limit Exceeded ', 'data' =>['swipe_limit'=>$swipe_user->swipe_count]]);
            }
            $swipe_user->decrement('swipe_count');
            $swipe_user->save();
            return json_encode(['status' => true, 'message' =>'successfully', 'data' =>['swipe_limit'=>$swipe_user->swipe_count]]);
        }
        return json_encode(['status' => false, 'message' => __('app.UserNotFound')]);
    }
    public function increase_swipe_count(Request $request){
        $rules = [
            'user_id' => 'required',
            "diamond"=>'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }
        $diamond=DB::table('appdata')->where('id', 1)->value('per_like_diamond');
         $user =  User::where('id', $request->user_id)->first();
         if($user->wallet>=$request->diamond){
            $user->wallet=$user->wallet-$request->diamond;
            $user->save();
        }
        $like=$request->diamond/$diamond;
        $swipe_user=SwipeCount::where('user_id',$request->user_id)->first();
        $swipe_user->swipe_count=(int)$like;
        $swipe_user->save();
        return json_encode(['status' => true, 'message' =>'successfully', 'data' =>$request->all()]);
    }
    public function get_profile_image($id){
        $data=Images::where('user_id',$id)->first();
        if($data){
            return response()->file(public_path().'/'.$data->image);
        }
        return response()->file(public_path().'/uploads/Unknown-person.jpg');
    }
    public function diamond_event(Request $request){
        $rules = [
            'events' => 'required',
            'user_id'=>'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $messages = $validator->errors()->all();
            $msg = $messages[0];
            return response()->json(['status' => false, 'message' => $msg]);
        }
        $user =  User::where('id', $request->user_id)->first();
        $diamond=DB::table('appdata')->where('id', 1)->value($request->events.'_diamond');
        if($diamond && $user){
            if($user->wallet>=$diamond){
                $user->wallet=$user->wallet-$diamond;
                $user->save();
            }
        }
        return json_encode(['status' => true, 'message' =>'successfully', 'data' =>$request->all()]); 
    }
}
