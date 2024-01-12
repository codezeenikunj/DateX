<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\DiamondPacks;
use App\Models\Gifts;
use App\Models\Interest;
use App\Models\LiveApplications;
use App\Models\RedeemRequest;
use App\Models\Report;
use App\Models\Users;
use App\Models\User;
use App\Models\VerifyRequest;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Plan;
use App\Models\PlanSubscription;
use App\Models\PlanUsage;
use App\Models\Looking;
use App\Models\SexualOrientation;
use DB;
class LoginController extends Controller
{

    
    function index(Request $request)
    {
      	if($request->isMethod('Post')){
          
          	if($request->type=="users"){
              $users=User::select(DB::raw('CASE WHEN age BETWEEN 18 AND 25 THEN "18 - 25" WHEN age BETWEEN 26 AND 29 THEN "26 - 29" WHEN age BETWEEN 30 AND 39 THEN "30 - 39" WHEN age BETWEEN 40 AND 49 THEN "40 - 49" WHEN age BETWEEN 50 AND 55 THEN "50 - 55" WHEN age BETWEEN 56 AND 65 THEN "56 - 65" ELSE "65+" END as age_group'), DB::raw('COUNT(*) as count'),'country_code')->groupBy('age_group','country_code')->OrderBy('age_group');;
              if($request->gender=='male'){
              	 $users=$users->where('gender',1);
              }
              if($request->gender=='female'){
              	 $users=$users->where('gender',2);
              }
              if($request->user_duration=='weekly'){
                 $users=$users->whereBetween('created_at', [Carbon::now()->startOfWeek()->toDateString(), Carbon::now()->endOfWeek()->toDateString()]);
              }
              if($request->user_duration=='monthly'){
                 $users=$users->whereBetween('created_at', [Carbon::now()->startOfMonth()->toDateString(), Carbon::now()->endOfMonth()->toDateString()]);
              }
              return $users->get();
            }
            if($request->type=="sub"){
              $sub_users=PlanSubscription::select(DB::raw('CASE WHEN age BETWEEN 18 AND 25 THEN "18 - 25" WHEN age BETWEEN 26 AND 29 THEN "26 - 29" WHEN age BETWEEN 30 AND 39 THEN "30 - 39" WHEN age BETWEEN 40 AND 49 THEN "40 - 49" WHEN age BETWEEN 50 AND 55 THEN "50 - 55" WHEN age BETWEEN 56 AND 65 THEN "56 - 65" ELSE "65+" END as age_group'), DB::raw('COUNT(*) as count'),'country_code' )->join('plans','plans.id','plan_id')->join('users','users.id','user_id')->where('expires_on','>',Carbon::now()->toDateString())->groupBy('age_group','country_code')->OrderBy('age_group');;
              if($request->gender=='male'){
              	 $sub_users=$sub_users->where('gender',1);
              }
              if($request->gender=='female'){
              	 $sub_users=$sub_users->where('gender',2);
              }
              if($request->sub_duration=='weekly'){
                 $sub_users=$sub_users->whereBetween('plan_subscriptions.created_at', [Carbon::now()->startOfWeek()->toDateString(), Carbon::now()->endOfWeek()->toDateString()]);
              }
              if($request->sub_duration=='monthly'){
                 $sub_users=$sub_users->whereBetween('plan_subscriptions.created_at', [Carbon::now()->startOfMonth()->toDateString(), Carbon::now()->endOfMonth()->toDateString()]);
              }
              if($request->sub_type!='all'){
                 $sub_users=$sub_users->where('plans.type',$request->sub_type);
              }
              return $sub_users->get();
            }
            if($request->type=="looking_for"){
            	$users=User::select(DB::raw('CASE WHEN age BETWEEN 18 AND 25 THEN "18 - 25" WHEN age BETWEEN 26 AND 29 THEN "26 - 29" WHEN age BETWEEN 30 AND 39 THEN "30 - 39" WHEN age BETWEEN 40 AND 49 THEN "40 - 49" WHEN age BETWEEN 50 AND 55 THEN "50 - 55" WHEN age BETWEEN 56 AND 65 THEN "56 - 65" ELSE "65+" END as age_group'), DB::raw('COUNT(*) as count') ,'country_code')->join('lookings','lookings.id','i_am_looking')->where('lookings.id',$request->looking_for)->groupBy('age_group','country_code')->OrderBy('age_group');;
             	if($request->gender=='male'){
              	 	$users=$users->where('gender',1);
              	}
              	if($request->gender=='female'){
              		 $users=$users->where('gender',2);
              	}
                return $users->get();
            }

            if($request->type=="sexual_orientations"){
               $users=SexualOrientation::select(DB::raw('CASE WHEN age BETWEEN 18 AND 25 THEN "18 - 25" WHEN age BETWEEN 26 AND 29 THEN "26 - 29" WHEN age BETWEEN 30 AND 39 THEN "30 - 39" WHEN age BETWEEN 40 AND 49 THEN "40 - 49" WHEN age BETWEEN 50 AND 55 THEN "50 - 55" WHEN age BETWEEN 56 AND 65 THEN "56 - 65" ELSE "65+" END as age_group'),DB::raw('COUNT(*) as count'),'sexual_orientations.id','name','country_code')->join('users', function ($join) {
                        $join->whereJsonContains('users.sexual_orientation', SexualOrientation::raw('CAST(sexual_orientations.id AS CHAR)'));
                    })->where('sexual_orientations.id',$request->sexual_orientations)->groupBy('age_group','country_code')->OrderBy('age_group');
                if($request->gender=='male'){
              	 	$users=$users->where('gender',1);
              	}
              	if($request->gender=='female'){
              		 $users=$users->where('gender',2);
              	}
                return $users->get();
            }
            return [];
        }
     	$total_user=User::count();
        $today_user=User::whereDate('created_at',now())->count();
        $weekly_user=User::whereBetween('created_at', [Carbon::now()->startOfWeek()->toDateString(), Carbon::now()->endOfWeek()->toDateString()])->count();
        $monhtly_user=User::whereBetween('created_at', [Carbon::now()->startOfMonth()->toDateString(), Carbon::now()->endOfMonth()->toDateString()])->count();
        $total_sub=PlanSubscription::where('expires_on','>',Carbon::now()->toDateString())->count();
        $today_sub=PlanSubscription::whereDate('created_at',now())->where('expires_on','>',Carbon::now()->toDateString())->count();
        $weekly_sub=PlanSubscription::whereBetween('created_at', [Carbon::now()->startOfWeek()->toDateString(), Carbon::now()->endOfWeek()->toDateString()])->where('expires_on','>',Carbon::now()->toDateString())->count();
        $monhtly_sub=PlanSubscription::whereBetween('created_at', [Carbon::now()->startOfMonth()->toDateString(), Carbon::now()->endOfMonth()->toDateString()])->where('expires_on','>',Carbon::now()->toDateString())->count();
        $orientation=SexualOrientation::pluck('name','id');
        $looking_for=Looking::pluck('name','id');
        return view('index')->with([
            'total_user' => $total_user, 
            'today_user' => $today_user,
            'weekly_user' => $weekly_user,
            'monhtly_user' => $monhtly_user,
            'total_sub' => $total_sub,
            'today_sub' => $today_sub,
            'weekly_sub' => $weekly_sub,
            'monhtly_sub' => $monhtly_sub,
            'orientation'=>$orientation,
            'looking_for'=>$looking_for
        ]);
    }
    function login()
    {

        return  view('login.login');
    }

    function checklogin(Request $req)
    {
		
        $data = Admin::where('user_name', $req->user_name)->first();

        if ($req->user_name == $data['user_name'] && $req->user_password == $data['user_password']) {


            $req->session()->put('user_name', $data['user_name']);
            $req->session()->put('user_password', $data['user_password']);
            $req->session()->put('user_type', $data['user_type']);
            return  json_encode(['status' => true, "message" => "login susseccfull"]);
        } else {
            return   json_encode(['status' => false, "message" => "somethig wrong"]);
        }
    }

    function logout()
    {

        session()->pull('user_name');
        session()->pull('user_password');
        session()->pull('user_type');
        return  redirect(url('/'));
    }

    function profile()
    {
        $data = Admin::first();
        return view('setting.profile', ['data' => $data]);
    }

    function updateProflie(Request $req)
    {

        $item = Admin::where('user_id', 1)->update([
            'user_password' => $req->user_password,
            'user_name' => $req->user_name
        ]);


        return  json_encode(['status' => true, "message" => "Update susseccfull"]);
    }
}
