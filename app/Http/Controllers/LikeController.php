<?php

namespace App\Http\Controllers;

use App\Models\Like;
use Illuminate\Http\Request;
use App\Models\Myfunction;
use App\Models\Users;
use App\Models\UserNotification;
use DB;
class LikeController extends Controller
{
    function like_dislike(Request $request)
    {
        if($request->user_id && $request->rateable_id){
            if($request->like==true){
                $lk=Like::where('user_id',$request->user_id)->where('rateable_id',$request->rateable_id)->where('like_type','Normal')->withTrashed()->first();
                if(isset($lk->deleted_at)){
                    $hourdiff = round((strtotime(date("Y-m-d H:s:i")) - strtotime($lk->deleted_at))/3600, 1);
                    if($hourdiff>=24){
                        $this->send_notification($request->rateable_id,$request->user_id,'Liked',1);
                    }
                    $lk->restore();
                }
                if(!$lk){
                    $like=new Like();
                    $like->user_id=$request->user_id;
                    $like->rateable_id=$request->rateable_id;
                    $like->save();
                    $this->send_notification($request->rateable_id,$request->user_id,'Liked',1);
                }
                return json_encode([
                    'status' => true,
                    'message' => 'Like successfull',
                    'data' => $request->all()
                ]);
            }
            Like::where('user_id',$request->user_id)->where('rateable_id',$request->rateable_id)->where('like_type','Normal')->delete();
            return json_encode([
                'status' => true,
                'message' => 'Dislike successfull',
                'data' => $request->all()
            ]);
        }
    }
    private function send_notification($rateable_id,$user_id,$msg,$type){
        $user = Users::find($rateable_id);
        $data_user=Users::where('id',$user_id)->first();
        Myfunction::sendPushToUser($data_user->fullname,$data_user->fullname . " has ".$msg." your profile, you should check their profile!",$user->device_token);
        $userNotification = new UserNotification();
        $userNotification->user_id = $user->id;
        $userNotification->data_user_id = $data_user->id;
        $userNotification->type = $type;
        $userNotification->save();
    }
    function super_like_dislike(Request $request)
    {
        if($request->user_id && $request->rateable_id){
            if($request->like==true){
                 $lk=Like::where('user_id',$request->user_id)->where('rateable_id',$request->rateable_id)->where('like_type','Super')->withTrashed()->first();
                  if(isset($lk->deleted_at)){
                    $hourdiff = round((strtotime(date("Y-m-d H:s:i")) - strtotime($lk->deleted_at))/3600, 1);
                    if($hourdiff>=24){
                        $this->send_notification($request->rateable_id,$request->user_id,'SuperLiked',2);
                    }
                    $lk->restore();
                    $user =  Users::where('id', $request->user_id)->first();
                    $diamond=DB::table('appdata')->where('id', 1)->value('super_like_diamond');
                    if($diamond && $user){
                        if($user->wallet>=$diamond){
                            $user->wallet=$user->wallet-$diamond;
                            $user->save();
                        }
                    }
                }
                if(!$lk){
                    $like=new Like();
                    $like->user_id=$request->user_id;
                    $like->rateable_id=$request->rateable_id;
                    $like->like_type='Super';
                    $like->save();
                    $user =  Users::where('id', $request->user_id)->first();
                    $diamond=DB::table('appdata')->where('id', 1)->value('super_like_diamond');
                    if($diamond && $user){
                        if($user->wallet>=$diamond){
                            $user->wallet=$user->wallet-$diamond;
                            $user->save();
                        }
                    }
                    $this->send_notification($request->rateable_id,$request->user_id,'SuperLiked',2);
                }
                 return json_encode([
                    'status' => true,
                    'message' => 'Super Like successfull',
                    'data' => $request->all()
                ]);
            }
            Like::where('user_id',$request->user_id)->where('rateable_id',$request->rateable_id)->where('like_type','Super')->delete();
            return json_encode([
                'status' => true,
                'message' => 'Super Dislike successfull',
                'data' => $request->all()
            ]);
        }
    }
}