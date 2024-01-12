<?php   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Str;
use App\Rules\CheckOtp;
use Validator;
use Image;
use App\Models\Student;
use App\Models\Tutor;
use App\Models\TutorProfession;
use App\Models\Notification;
use App\Models\User;
use App\Models\Images;
use App\Models\Attribute;
use App\Models\UserSetting;
use App\Models\PersonalQuestion;
use App\Models\UserNotification;
use App\Models\Like;
use App\Models\Plan;
use App\Models\PlanSubscription;
use App\Models\PlanUsage;
use App\Models\BlockUser;
use App\Models\Report;
use App\Notifications\EmailVerify;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;
use Auth;
use DB;
class UserController extends BaseController
{
    public $lang='it';
    public function __construct()
    {
       if(request()->header('lang')){
           $this->lang=request()->header('lang');
       }
    }
    public function login(Request $request){
        $validator = Validator::make($request->all(), [
            'mobile_number' => 'required_without:email',
            'email' => 'required_without:mobile_number',
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
        $validator = Validator::make($request->all(), [
            'otp' => ['required',new CheckOtp($request->mobile_number?$request->mobile_number:$request->email)],
        ]);    
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
        $user=User::where('mobile_number',$request->mobile_number)->first();
        if($request->email){
            $user=User::where('email',$request->email)->first();
        }
        if($user){
            if($user->is_block==1){
                 return $this->sendError(__('Your_Account_has_been_Blocked!Contact_to_Admin',[],$this->lang));     
            }
            if(Auth::attempt(['identity' =>$user->identity,'password' =>$user->identity], false, false)) {
                $user=auth()->user();
                $user->device_token=$request->device_token?$request->device_token:Null;
                $user->save();
                $token=$this->getTokenAndRefreshToken('users',$user->identity,$user->identity);
                $user['token'] = $token['access_token'];
                $user['refresh_token'] = $token['refresh_token'];
                $user->images->makeHidden(['created_at','updated_at','user_id']);
                return $this->sendResponse($user, 'Login Successfully.');
            } 
            return $this->sendError(__('Sorry_something_went_wrong!',[],$this->lang));  
        }else{
            $input=$request->all();
            $input['token']=null;
            return $this->sendResponse($input,__('OTP_Verified_Successfully',[],$this->lang));
        }
    }
    public function new_token(Request $request){
        return $this->refreshToken($request->header('refreshtoken'),'users');
    }
    public function social_login(Request $request){
        $validator = Validator::make($request->all(), [
            'access_token' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }

        if(Auth::attempt(['identity' =>$request->access_token,'password' =>$request->access_token], false, false)) {
            $user=auth()->user();
            if($user->is_block==1){
                auth()->user()->tokens()->delete();
                return $this->sendError('Your Account has been Blocked ! Contact to Admin');     
            }
            $user->device_token=$request->device_token?$request->device_token:Null;
            $user->images->makeHidden(['created_at','updated_at','user_id']);
            $token=$this->getTokenAndRefreshToken('users',$request->access_token,$request->access_token);
            $user['token'] = $token['access_token'];
            $user['refresh_token'] = $token['refresh_token'];
            return $this->sendResponse($user, 'Login Successfully.');
        }
        return $this->sendError('Sorry, you are not register yet !',$request->all());     ;
    }
    public function subscribe(Request $request){
        $validator = Validator::make($request->all(), [
            'plan_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
        $plan=Plan::whereId($request->plan_id)->first();
        $x_sub=PlanSubscription::where('payment_id',$request->payment_id)->first();
        if($plan){
            try {
                    if($plan->type=='boosts' || $plan->type=='super_likes'){
                       $usage=PlanUsage::where('user_id',auth()->id())->where('type',$plan->type)->first();
                       if($usage){
                      	 $usage->limit=$usage->limit+$plan->limited;
                         $usage->save();
                       }else{
                       		PlanUsage::create(['type'=>$plan->type,'user_id'=>auth()->id(),'limit'=>$plan->limited]);
                       }
                       return $this->sendResponse($request->all(), 'Successfully');
                    }
                    $sub['plan_id']=$plan->id;
                    $sub['user_id']=auth()->id();
                    $sub['charging_price']=$plan->price;
                    $sub['charging_currency']=$plan->currency;
                    $sub['recurring_each_days']=$plan->duration;
                    $sub['starts_on']=Carbon::now()->toDateTimeString();
                    $sub['expires_on']=Carbon::now()->addDays($plan->duration)->toDateTimeString();
                    $sub['payment_id']=$request->payment_id;
                    $sub['free_boost']=$plan->free_boost;
                    $sub['boost_duration']=$plan->boost_duration;
                    $sub['free_superlike']=$plan->free_superlike;
                    $sub['superlike_duration']=$plan->superlike_duration;
                    $x_sub=PlanSubscription::where('plan_id',$plan->id)->where('user_id',auth()->id())->where('expires_on','>=',Carbon::now()->toDateTimeString())->first();
                    if($x_sub){
                        $subscription=$x_sub->update($sub);
                        PlanUsage::where('user_id',auth()->id())->where('type','boosts')->increment('limit',$plan->free_boost);
                        PlanUsage::where('user_id',auth()->id())->where('type','super_likes')->increment('limit',$plan->free_superlike);
                    }else{
                        $subscription=PlanSubscription::create($sub);
                        PlanUsage::create(['type'=>'boosts','user_id'=>auth()->id(),'limit'=>$plan->free_boost]);
                        PlanUsage::create(['type'=>'super_likes','user_id'=>auth()->id(),'limit'=>$plan->free_superlike]);
                    }
                    return $this->sendResponse($request->all(), __('Successfully_Subscribe',[],$this->lang));
            } catch (Exception $e) {
                return $this->sendError(__('Sorry_something_went_wrong!',[],$this->lang));
            }               
        }
        return $this->sendError(__('Sorry_something_went_wrong!',[],$this->lang));
    }
    public function register(Request $request){
        $data=User::first();
        $input = $request->all();
        $validator = Validator::make($input, [
            'mobile_number' => 'required_without:email',
            'email' => 'required_without:mobile_number',
            'first_name' => 'required|string|max:200',
            'birth_date' => 'required',
            'gender' => 'required|in:1,2,3',
            'interests' => 'required',
            'sexual_orientation' => 'required',
            'show_me'=>'required',
        ]);
        $validator->sometimes('mobile_number', 'unique:users,mobile_number', function($input) {
            return $input->mobile_number?true:false;
        });
        $validator->sometimes('email', 'unique:users,email', function($input) {
            return $input->email?true:false;
        });
        $validator->sometimes('identity', 'unique:users,identity', function($input) {
            return $input->identity?true:false;
        });
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
        $input['age'] = Carbon::parse($request->birth_date)->age;
        $input['identity'] = $request->identity?$request->identity:Str::random(12);
        $input['password'] = Hash::make($input['identity']);
        $input['sexual_orientation'] = json_decode($input['sexual_orientation']);
        $input['interests'] =json_decode($input['interests']);
      	 
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
          
            $user=User::whereId($result->id)->first();
            UserSetting::create(['user_id'=>$user->id,'latitude'=>$request->latitude,'longitude'=>$request->longitude,'address'=>$request->address,'age_range_from'=>$request->age_range_from,'age_range_to'=>$request->age_range_to,'only_range'=>$request->only_range?$request->only_range:0]);
            $token=$this->getTokenAndRefreshToken('users',$result->identity, $result->identity);
            $user->images->makeHidden(['created_at','updated_at','user_id']);
            $user['token'] = $token['access_token'];
            $user['refresh_token'] = $token['refresh_token'];
            $this->add_to_chat($user);
            return $this->sendResponse($user,__('Account_Created_Successfully',[],$this->lang));
        }
        return $this->sendError(__('Sorry_something_went_wrong!',[],$this->lang));
    }
    public function profile_image(Request $request,$id=Null){
        if($request->isMethod('DELETE')){
            $image=Images::whereId($id)->first();
            if($image){   
                @unlink('public/'.str_replace(env('APP_URL'),'',$image->image));
                $image->delete();    
            }
            return $this->sendResponse($request->all(),__('Deleted_Successfully',[],$this->lang));
        }
        if($request->isMethod('post')){
            $result=[];
            if($request->has('image')){
                foreach($request->file('image') as $img){
                    $it = new Images();
                    $imageName = rand(10,100).time().'.'.$img->extension();  
                    $img->move(public_path('uploads'), $imageName);
                    $it->image = 'uploads/'.$imageName;
                    $it->user_id = auth()->id();
                    $it->save();
                    $result[]=env('APP_URL').'/'.$it->image;       
                } 
            }
            return $this->sendResponse($result,__('Update_Successfully',[],$this->lang));
        }
        $image=Images::where('user_id',auth()->id())->get();
        return $this->sendResponse($image,__('Get_Successfully',[],$this->lang));
    }
    public function profile(Request $request){
        if($request->isMethod('post')){
            $input=$request->all();
            $validator = Validator::make($input, [
                'gender' => 'in:1,2,3'
            ]);
            if ($validator->fails()) {
                return $this->sendError($validator->errors()->first(),$request->all(),400);
            }
            $user=Auth()->user();
            $user->update($input);
            $this->add_to_chat($user);
            return $this->sendResponse($input,__('Update_Successfully',[],$this->lang));
        }
        $user=User::select('id','first_name','last_name','gender','photo_option','about','interests','sexual_orientation','attribute','language_know','job_title','school','city_live','show_age','show_distance','i_am_looking','type_of_relation','show_gender','show_sexual_orientation')->whereId(Auth()->id())->first();
        $user->images->makeHidden(['created_at','updated_at','user_id']);
        $user->languagesknow->makeHidden(['created_at','updated_at','deleted_at']);
        $user->interest->makeHidden(['created_at','updated_at','user_id']);
        $user->iamlooking;
        $user->typeofrelation;
      	if($user->attribute){
           	$que=Attribute::whereIn('id',$user->attribute)->pluck('question_id')->unique();
        	$attribute=PersonalQuestion::whereIn('id',$que)->with('options',function($query)use($user){
            	$query->whereIn('id',$user->attribute);
        	})->get()->groupBy('type');
        }
        $user['sexual_orientation']=$user->orientation->makeHidden(['created_at','updated_at','user_id']);
        $user['about_me']=isset($attribute['about_me'])?$attribute['about_me']:[];
        $user['lifestyle']=isset($attribute['lifestyle'])?$attribute['lifestyle']:[];
        $user->makeHidden(['interests','attribute','language_know']);
        unset( $user['orientation']);
        return $this->sendResponse($user,__('Get_Successfully',[],$this->lang));
    }
    public function setting(Request $request){
        $user=auth()->user();
        $user_setting=UserSetting::where('user_id',$user->id)->first();
        if(!$user_setting){
            $user_setting=UserSetting::create(['user_id'=>$user->id]);
        }
        if($request->isMethod('post')){
            $user_setting->update($request->all());
        }
        $user_setting->language;
        $user_setting['mobile_number']=$user->mobile_number;
        $user_setting['email']=$user->email;
        $user_setting['user_name']=$user->user_name;
        return $this->sendResponse($user_setting,__('Get_Successfully',[],$this->lang));
    }
    public function verify_otp(Request $request){
        $input = $request->all();
        $validator = Validator::make($input, [
            'mobile_number' => 'required|digits:10',
            'otp' => ['required','digits:4',new CheckOtp($request->mobile_number)],
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$input,400);
        }
        return $this->sendResponse($input,__('Otp_Verify_Successfully',[],$this->lang)); 
    }
    public function change_mobile_no(Request $request){
        $user=Auth()->user();
        $input = $request->all();
        $validator = Validator::make($input, [
            'mobile_number' => 'required|unique:users,mobile_number,'.$user->id,
            'otp' => ['required',new CheckOtp($request->mobile_number)],
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$input,400);
        }
        $user->country_code=$request->country_code?$request->country_code:Null;
        $user->mobile_number=$request->mobile_number;
        $user->save();
        $user_setting=UserSetting::where('user_id',$user->id)->first();
        if(!$user_setting){
             $user_setting=UserSetting::create(['user_id'=>$user->id]);
        }
        $user_setting->mobile_no_verified=1;
        $user_setting->save();
        return $this->sendResponse($input,__('Verify_&_Change_Successfully',[],$this->lang)); 
    }
    public function change_email(Request $request){
        $user=Auth()->user();
        $validator = Validator::make($request->all(), [
            'email_id' => 'required|unique:users,email,'.$user->id
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
        $messages['email'] = [$request->email_id];
        $data['email']=$request->email_id;
        $data['identity']=$user->identity;
        $messages["url"]=env('APP_URL').'/verify_email/'.Crypt::encryptString(json_encode($data));
        $notification = new EmailVerify($messages);
        \Notification::route('mail', $messages['email'])->notify($notification);
        return $this->sendResponse($request->all(),__('Reset_Link_Successfully_send_to_you_mail',[],$this->lang)); 
    }
    public function change_username(Request $request){
        $user=Auth()->user();
        $input = $request->all();
        $validator = Validator::make($input, [
            'user_name' => 'required|unique:users,user_name,'.$user->id,
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$input,400);
        }
        $user->user_name=$request->user_name;
        $user->save();
        return $this->sendResponse($request->all(),__('Successfully_Changed',[],$this->lang)); 
    }
    public function logout(Request $request){
        auth()->user()->tokens()->delete();
        return $this->sendResponse($request->all(),__('Successfully_Logout!',[],$this->lang));
    }
    public function delete_account(Request $request){
        auth()->user()->tokens()->delete();
        return $this->sendResponse($request->all(),__('Account_Deleted_Successfully!',[],$this->lang));
    }
    public function get_random(Request $request){
        $user=auth()->user();
        $random=User::select('users.id', 'first_name', 'last_name', 'age', 'gender', 'photo_option', 'about', 'birth_date', 'interests', 'address', 'latitude', 'longitude', 'address as distance', 'sexual_orientation', 'attribute', 'language_know', 'job_title', 'school', 'city_live', 'show_age', 'show_distance', 'i_am_looking', 'type_of_relation', 'boost_time')
    ->join('user_settings', 'users.id', 'user_settings.user_id')
    ->leftJoin('likes', function ($join) use ($user) {
        $join->on('users.id', '=', 'likes.rateable_id')
            ->where('likes.value', 1)
            ->where('likes.user_id', $user->id);
    })->whereNull('likes.rateable_id')->where('users.id','!=',$user->id);
 		if($user->show_me!=3){
            $random=$random->where('gender',$user->show_me);
        }
        if($user->setting->only_range==1){
           $random=$random->whereBetween('age',[$user->setting->age_range_from,$user->setting->age_range_to]);
        }
        if($user->setting->maximum_distance!=0){
            $random=$random->havingRaw('distance BETWEEN ? AND ?', [0,$user->setting->maximum_distance]);
        }
        $random=$random->orderByRaw('CASE WHEN boost_time IS NOT NULL AND boost_time > NOW() THEN 1 ELSE 0 END DESC');
        $random=$random->with('images','interest','languagesknow','iamlooking','typeofrelation','orientation')->inRandomOrder()->limit(10)->orderBy('boost_time',"DESC")->get()->map(function($result){
                    if($result->attribute){
                        $que=Attribute::whereIn('id',$result->attribute)->pluck('question_id')->unique();
                        $attribute=PersonalQuestion::whereIn('id',$que)->with('options',function($query)use($result){
                            $query->whereIn('id',$result->attribute);
                        })->get()->groupBy('type');
                    }
                   $result->about_me=isset($attribute['about_me'])?$attribute['about_me']:[];
                   $result->lifestyle=isset($attribute['lifestyle'])?$attribute['lifestyle']:[];
                    return $result;
         })->makeHidden(['interests','attribute','language_know']);
        $result=$random->makeHidden(['interests','latitude','longitude']);
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function get_likes(Request $request){
        $user=auth()->user();
        Like::where('likes.rateable_id',auth()->id())->where('like_type',$request->like_type)->where('value',1)->where('not_read',1)->update(['not_read'=>0]);
        $likes=Like::select('likes.id','likes.user_id','first_name','last_name','age','birth_date','likes.created_at')->join('users','users.id','likes.user_id')
          ->where('likes.rateable_id',auth()->id())->whereNotIn('user_id', function ($query) {
          $query->select('likes.rateable_id')
              ->from('likes')
              ->where('user_id',auth()->id())
              ->where('like_type','!=',3);
        })->where('like_type',$request->like_type)->where('value',1)->with('images:id,user_id,image');
      	$likes=$likes->latest();
        $result['per_page']=10;
        $result['current_page']=$request->page?(int)$request->page:1;
        $result['total']=$likes->count();
        $result['records']=$likes->latest()->offset(($result['current_page'] - 1) * $result['per_page'])->limit($result['per_page'])->get();
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function boost(Request $request){
        $user=auth()->user();
        PlanUsage::where('user_id',$user->id)->where('type','boosts')->decrement('limit',1);
        $user->boost_time=Carbon::now()->addMinute(30);
        $user->save();
        $result['remaining_boost']=PlanUsage::where('user_id',auth()->id())->where('type','boosts')->value('limit');
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function like_dislike(Request $request){
        $user=auth()->user();
        $validator = Validator::make($request->all(), [
            'user_id'=>'required|exists:users,id',
            'like_type' => 'in:1,2,3',
            'like'=>'in:0,1'
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
        $result=Like::updateOrCreate(['user_id'=>$user->id,"rateable_id"=>$request->user_id,'like_type'=>$request->like_type],['user_id'=>$user->id,"rateable_id"=>$request->user_id,'like_type'=>$request->like_type,'value'=>$request->like]);
        $has_like=Like::where('rateable_id',$user->id)->where('user_id',$request->user_id)->where('like_type','=',$request->like_type)->where('value',1)->count();
        $has_like==0?0:1;
        $reciver=User::whereId($request->user_id)->first();
        $rlang="it";
        if($reciver->setting->language_id){
        	$rlang=$reciver->setting->language->short_code;
        }
        if($has_like==1){
            $not['title']=__('New_Match_Found',[],$rlang);
            $not['msg']=$user->first_name." ".__('and_you_are_matched_in_Bitlove',[],$rlang);
            $fcm_token=User::whereId($request->user_id)->value('device_token');
            $this->fcm_notification($fcm_token,$not);
        }
        $result['has_like']=$has_like;
        if($request->like){
            if($request->like_type==1 || $request->like_type==2){
                if($request->like_type==2){
                    PlanUsage::where('user_id',auth()->id())->where('type','super_likes')->decrement('limit',1);
                }
                if($user->images){
                    $img=$user->images->first();
                    $img=$img->image;
                }
                $l_type=$request->like_type==1?'Like':'SuperLike';
                $not['sender_id']=$user->id;
                $not['sender_avatar']=$img;
                $not['user_id']=$request->user_id;
                $not['msg']="<b>".$user->first_name.' '.$user->last_name.'</b> '.__($l_type,[],$rlang)." ".__("your_profile",[],$rlang);
                UserNotification::create($not);
            }
            return $this->sendResponse($result,__('Successfully_like',[],$this->lang)); 
        }
        return $this->sendResponse($result,__('Successfully_dislike',[],$this->lang)); 
    }
    public function get_notification(Request $request){
        $notification=UserNotification::where('user_id',auth()->id());
        $notification->update(['read'=>0]);
      	$result['per_page']=10;
        $result['current_page']=$request->page?(int)$request->page:1;
        $result['total']=$notification->count();
        $result['records']=$notification->latest()->offset(($result['current_page'] - 1) * $result['per_page'])->limit($result['per_page'])->get();
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
  	public function unread_notification(Request $request){
       $result['notification']=UserNotification::where('user_id',auth()->id())->where('read',1)->count();
       $result['like']=Like::where('likes.rateable_id',auth()->id())->where('like_type',1)->where('value',1)->where('not_read',1)->count();
       $result['super_like']=Like::where('likes.rateable_id',auth()->id())->where('like_type',2)->where('value',1)->where('not_read',1)->count();
      return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
  	public function user_profile($id){
        if($id){
          $user=User::select('id','first_name','last_name','gender','photo_option','about','interests','sexual_orientation','attribute','language_know','job_title','school','city_live','show_age','show_distance','i_am_looking','type_of_relation','show_gender','show_sexual_orientation')->whereId($id)->first();
          if($user){
            $user->images->makeHidden(['created_at','updated_at','user_id']);
            $user->languagesknow->makeHidden(['created_at','updated_at','deleted_at']);
            $user->interest->makeHidden(['created_at','updated_at','user_id']);
            $user->iamlooking;
            $user->typeofrelation;
            if($user->attribute){
                $que=Attribute::whereIn('id',$user->attribute)->pluck('question_id')->unique();
                $attribute=PersonalQuestion::whereIn('id',$que)->with('options',function($query)use($user){
                    $query->whereIn('id',$user->attribute);
                })->get()->groupBy('type');
            }
            $user['sexual_orientation']=$user->orientation->makeHidden(['created_at','updated_at','user_id']);
            $user['about_me']=isset($attribute['about_me'])?$attribute['about_me']:[];
            $user['lifestyle']=isset($attribute['lifestyle'])?$attribute['lifestyle']:[];
            $user->makeHidden(['interests','attribute','language_know']);
            unset( $user['orientation']);
            return $this->sendResponse($user,__('Get_Successfully',[],$this->lang));
          }
        }
        return $this->sendError(__('Sorry_something_went_wrong!',[],$this->lang));     
    }
  	public function get_match(Request $request){
      $likes=Like::select('likes.id','rateable_id as user_id','first_name','last_name','like_type','age','birth_date','likes.created_at',\DB::raw('CASE WHEN block_by >= 1 THEN true ELSE false END AS is_blocked'))->where('likes.user_id', auth()->id())
      ->whereIn('rateable_id', function ($query) {
          $query->select('likes.user_id')
              ->from('likes')
              ->where('rateable_id',auth()->id())
              ->where('value',1)
              ->where('like_type','!=',3);
      })->where('value',1)->where('like_type','!=',3)->join('users','users.id','likes.rateable_id')->leftjoin('block_users','block_users.user_id','likes.rateable_id')->with('images:id,user_id,image');
      $result['per_page']=10;
      $result['current_page']=$request->page?(int)$request->page:1;
      $result['total']=$likes->count();
      $result['records']=$likes->latest()->offset(($result['current_page'] - 1) * $result['per_page'])->limit($result['per_page'])->get();
      return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function plan_info(Request $request){
        $user=auth()->user();
        $data['premium']=PlanSubscription::select('plan_id','type','name','starts_on','expires_on','cancelled_on')->where('type','premium')->where('user_id',$user->id)->where('expires_on','>=',Carbon::now()->toDateTimeString())->join('plans','plan_subscriptions.plan_id','plans.id')->first();
        $data['gold']=PlanSubscription::select('plan_id','type','name','starts_on','expires_on','cancelled_on')->where('user_id',$user->id)->where('type','gold')->where('expires_on','>=',Carbon::now()->toDateTimeString())->join('plans','plan_subscriptions.plan_id','plans.id')->first();
        $super_likes=PlanUsage::where('user_id',$user->id)->where('type','super_likes')->value('limit');
        $data['super_likes']=$super_likes?$super_likes:0;
        $boosts=PlanUsage::where('user_id',$user->id)->where('type','boosts')->value('limit');
        $data['boosts']=$boosts?$boosts:0;
       return $this->sendResponse($data,__('Get_Successfully',[],$this->lang));
    }
    public function get_top_pics(Request $request){

        $likes=Like::select('users.id as user_id','first_name','last_name','age','birth_date','likes.created_at',DB::raw('COUNT(*) as total_like'))->join('users','users.id','likes.rateable_id')->where('like_type',1)->where('value',1)->where('like_type',1)->where('value',1)->groupBy('likes.rateable_id')->orderByDesc(DB::raw('COUNT(*)'))->with('images:id,user_id,image');
        $result['per_page']=10;
        $result['current_page']=$request->page?(int)$request->page:1;
        $result['total']=count($likes->get());
        $result['records']=$likes->latest()->offset(($result['current_page'] - 1) * $result['per_page'])->limit($result['per_page'])->get(); 
       return $this->sendResponse($result,__('Get_Successfully',[],$this->lang));
    }
  	public function block_unblock(Request $request){
        $validator = Validator::make($request->all(), [
            'user_id'=>'required|exists:users,id'
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
       if($request->block==1){
            BlockUser::updateOrCreate(['user_id'=>$request->user_id,'block_by'=>auth()->id()],['user_id'=>$request->user_id,'block_by'=>auth()->id()]);
            return $this->sendResponse($request->all(),__('Successfully_Blocked',[],$this->lang));
       }else{
            BlockUser::where(['user_id'=>$request->user_id,'block_by'=>auth()->id()])->delete();
            return $this->sendResponse($request->all(),__('Successfully_Unblocked',[],$this->lang));
       }
    }
    public function report(Request $request){
        $validator = Validator::make($request->all(), [
            'user_id'=>'required|exists:users,id',
            'reason'=>'required'
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$request->all(),400);
        }
        Report::create(['user_id'=>$request->user_id,'user_by'=>auth()->id(),'reason'=>$request->reason]);
        return $this->sendResponse($request->all(),__('Successfully_Submited',[],$this->lang));
    }
}