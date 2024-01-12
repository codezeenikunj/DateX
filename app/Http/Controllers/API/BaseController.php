<?php
namespace App\Http\Controllers\API;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;
use Tzsk\Otp\Facades\Otp;
use GuzzleHttp\Client;
use Laravel\Passport\Client as OClient;
class BaseController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponse($result, $message)
    {
    	$response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];


        return response()->json($response, 200);
    }


    /**
     * return error response.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError($error, $errorMessages = [], $code = 404)
    {
    	$response = [
            'success' => false,
            'message' => $error,
        ];
        $response['data'] = $errorMessages;  

        return response()->json($response, $code);
    }
    protected function send_otp($mobile_number){
        return Otp::digits(6)->expiry(10)->generate(md5($mobile_number.env('APP_KEY')));
    }
    protected function getTokenAndRefreshToken($provider, $identity, $password) { 
        $oClient = OClient::where('password_client', 1)->where('provider',$provider)->first();
        $http = new Client;
        $response = $http->request('POST',  env('APP_URL').'/oauth/token', [
            'form_params' => [
                'grant_type' => 'password',
                'client_id' => $oClient->id,
                'client_secret' => $oClient->secret,
                'username' => $identity,
                'password' => $password,
                'scope' => '*',
            ],
        ]);
        return $result = json_decode((string) $response->getBody(), true);
    }
    protected function refreshToken($refresh_token,$provider) {
        $oClient = OClient::where('password_client', 1)->where('provider',$provider)->first();
        $http = new Client(['http_errors' => false]);
        $response = $http->request('POST',  env('APP_URL').'/oauth/token', [
            'form_params' => [
                'grant_type' => 'refresh_token',
                'refresh_token' => $refresh_token,
                'client_id' => $oClient->id,
                'client_secret' => $oClient->secret,
                'scope' => '*',
            ],
        ]);  
        if($response->getStatusCode()==200){
            return $this->sendResponse(json_decode((string) $response->getBody(), true), 'New Token Generate successfully.');
        }      
        return $this->sendError('Unauthorised.', ['error'=>'Unauthorised'],401);
    }
    public function fcm_notification($fcm_token,$data){
        if(!$fcm_token){
            return false;
        }
        try{
            $SERVER_API_KEY = env('FCM_SERVER_KEY');
            $notification = [
                "registration_ids" => [$fcm_token],
                "notification" => [
                    "title" => $data['title'],
                    "body" => $data['msg'],  
                ]
            ];
            $dataString = json_encode($notification);
            $headers = [
                'Authorization: key=' . $SERVER_API_KEY,
                'Content-Type: application/json',
            ];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);
            $response = curl_exec($ch);
            return json_decode($response);
            //return true;
        }catch(Exception $e){

        }
    }
    public function add_to_chat($user){
        $input['user_id']=$user->id;
        $input['name']=$user->first_name.' '.$user->last_name;
        $image=$user->images->first();
        $input['profile_pic']=isset($image->image)?$image->image:'https://ui-avatars.com/api/?name='.$input['name'].'&background=9f8ee8&color=fff';
        $curl = curl_init();
        curl_setopt_array($curl, array(
          CURLOPT_URL => 'http://16.171.232.5:5000/api/register',
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => '',
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 10,
          CURLOPT_FOLLOWLOCATION => true,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => 'POST',
          CURLOPT_POSTFIELDS =>json_encode($input),
          CURLOPT_HTTPHEADER => array('Content-Type:application/json')
        ));
        $response = curl_exec($curl);
        curl_close($curl);
        return true;
    }
}