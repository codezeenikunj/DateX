<?php
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use Tzsk\Otp\Facades\Otp;
use App\Rules\CheckOtp;
use Validator;
use App\Models\SexualOrientation;
use App\Models\Interest;
use App\Models\PersonalQuestion;
use App\Models\Attribute;
use App\Models\Language;
use App\Models\Looking;
use App\Models\User;
use App\Models\KnowLanguage;
use App\Models\TypeOfRelationship;
use App\Notifications\AccountRecovery;
use App\Models\DiamondPacks;
use App\Models\Plan;
use DB;
class GeneralController extends BaseController
{
    public $lang='it';
    public function __construct()
    {
       if(request()->header('lang')){
           $this->lang=request()->header('lang');
       }
    }
    public function generate_otp(Request $request){
        $input = $request->all();
        $validator = Validator::make($input, [
            'mobile_number' => 'required_without:email_id',
            'email_id' => 'email|required_without:mobile_number',
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$input,400);
        }
        $input['otp']=$this->send_otp($request->mobile_number?$request->mobile_number:$request->email);
        return $this->sendResponse($input,'Otp Send Successfully');
    }
    public function verify_otp(Request $request){
        $input = $request->all();
        $validator = Validator::make($input, [
            'mobile_number' => 'required',
            'otp' => ['required',new CheckOtp($request->mobile_number)],
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first(),$input,400);
        }
        return $this->sendResponse($input,__('Get_Successfully',[],$this->lang)); 
    }
    public function get_sexual_orientation(Request $request){
        $result=SexualOrientation::get();
        return $this->sendResponse($result,'Sexual Orientation get Successfully'); 
    }
    public function get_interest(Request $request){
        $result=Interest::get();
        return $this->sendResponse($result,'Interest get Successfully'); 
    }
    public function get_question_list(Request $request,$type=null){
        $result=new PersonalQuestion;
        if($type){
             $result=PersonalQuestion::where('type',$type);
        }
        if($request->option=="true"){
             $result=$result->with('options');
        }
        $result=$result->get();
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function get_options(Request $request,$id=null){
        $result=PersonalQuestion::with('options')->whereId($id)->get();
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function get_language(Request $request){
        $result=Language::get()->makeHidden(['is_default','rtl','language_file']);
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function get_language_know(Request $request){
        $result=KnowLanguage::get();
        return $this->sendResponse($result,__('Get_Successfully',[],$this->lang)); 
    }
    public function get_type_of_relationships(Request $request){
        $result=TypeOfRelationship::get();
        return $this->sendResponse($result,'Type Of Relationships get Successfully'); 
    }
    public function get_lookings(Request $request){
        $result=Looking::get();
        return $this->sendResponse($result,'Lookings get Successfully'); 
    }
    public function account_recovery(Request $request){
        $user=User::where('email',$request->email_id)->first();
        if(!$user){
             return $this->sendError('Account Not Found !');     
        }
        $messages["url"] = 'https://bitlove.page.link/account-recovery';
        $user->notify(new AccountRecovery($messages));
        return $this->sendResponse($request->all(),'Link Send Successfully'); 
    }
    public function get_plans(Request $request){
        if($request->plan_type=='premium'){
            $plan=Plan::select('id','name','price','currency','duration','metadata')->where('type','premium')->get()->map(function ($result){
                $originalPrice=$result->where('type','premium')->orderBy('price','asc')->value('price')*($result->duration/30);
                $result->monthly_price=$result->price/($result->duration/30);
                $result->save=(($originalPrice - $result->price) / $originalPrice) * 100;
                return $result;
            });
            return $this->sendResponse($plan,__('Get_Successfully',[],$this->lang)); 
        }
        if($request->plan_type=='gold'){
            $plan=Plan::select('id','name','price','currency','duration','metadata')->where('type','gold')->get()->map(function ($result){
                $originalPrice=$result->orderBy('price','asc')->where('type','gold')->value('price')*($result->duration/30);
                $result->monthly_price=$result->price/($result->duration/30);
                $result->save=(($originalPrice - $result->price) / $originalPrice) * 100;
                return $result;
            });
            return $this->sendResponse($plan,__('Get_Successfully',[],$this->lang)); 
        }
        if($request->plan_type=='boosts'){
            $plan=Plan::select('id','name','price','currency','limited')->where('type','boosts')->get()->map(function ($result){
                $first=$result->orderBy('price','asc')->where('type','boosts')->first();
                $price=($first->price/$first->limited);
                $originalPrice=($price*$result->limited);
                $result->save=(($originalPrice - $result->price) / $originalPrice) * 100;
                return $result;
            });
            return $this->sendResponse($plan,__('Get_Successfully',[],$this->lang)); 
        }
        if($request->plan_type=='like'){
            $plan=Plan::select('id','name','price','currency','limited')->where('type','super_likes')->get()->map(function ($result){
                $first=$result->orderBy('price','asc')->where('type','super_likes')->first();
                $price=($first->price/$first->limited);
                $originalPrice=($price*$result->limited);
                $result->save=(($originalPrice - $result->price) / $originalPrice) * 100;
                return $result;
            });
            return $this->sendResponse($plan,__('Get_Successfully',[],$this->lang)); 
        }
        return $this->sendError('Sorry, something went wrong !');
    }
    public function translate(Request $request){
        return $this->translate_lang($request->detail,$request->lang);
    }
    public function get_diamond_packs(Request $request){
         $pack=DiamondPacks::all();
        return $this->sendResponse($pack,__('Get_Successfully',[],$this->lang)); 
    }
    function get_setting_data(Request $req)
    {
      $data['appdata'] = DB::table('appdata')->first();
      return $this->sendResponse($data,__('Get_Successfully',[],$this->lang)); 
    }
    public function upload_file(Request $request){
       if($request->file('files')){
            $files=[];
            foreach($request->file('files') as $key =>$file){
               $fileName = time() . '_' .$file->getClientOriginalName();
               $file->move(public_path('uploads/chat'), $fileName);
               $files[]=env('APP_URL').'/uploads/chat/'.$fileName;
            }
           return $this->sendResponse($files,'Successfully');
       }
       if($request->file('file')){
         $file=$request->file('file');
         $fileName = time() . '_' .$file->getClientOriginalName();
         $file->move(public_path('uploads/chat'), $fileName);
         return $this->sendResponse([env('APP_URL').'/uploads/chat/'.$fileName],'Successfully');
       }
      return $this->sendError('Sorry, something went wrong !');
    }
    private function translate_lang($detail,$lang){
        $curl = curl_init();
        curl_setopt_array($curl, array(
          CURLOPT_URL => 'https://translate.googleapis.com/translate_a/single?client=gtx&dt=t&sl=en&tl='.$lang.'&q='.urlencode($detail),
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => '',
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 0,
          CURLOPT_FOLLOWLOCATION => true,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => 'GET',
        ));
        $response = curl_exec($curl);
        $response=json_decode($response,true);
        curl_close($curl);
        $data=collect($response[0]);
        $data=$data->filter();
        if($data){
            $detail='';
            foreach($data as $key=>$value){
                 $detail.=$value[0];
            }
        }
        return $detail;
    }
}
