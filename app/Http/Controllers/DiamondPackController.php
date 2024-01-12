<?php

namespace App\Http\Controllers;

use App\Models\DiamondPacks;
use Illuminate\Http\Request;
use App\Models\Plan;
use App\Models\PlanUsage;
use App\Models\PlanSubscription;
use App\Models\Language;
use DB;
class DiamondPackController extends Controller
{
    //

    function diamondpacks()
    {
        return view('diamondpacks');
    }

    function getDiamondPacks(Request $request){
        $data = Plan::all();

        return json_encode([
            'status' => true,
            'message' => 'diamond packs get successfully',
            'data' => $data
        ]);
    }

    function deleteDiamondPack($id)
    {
        $data =  Plan::where('id', $id);
        $data->delete();
        $data1['status'] = true;
        echo json_encode($data1);
    }


    function getDiamondPackById($id)
    {
        $data = Plan::where('plans.id', $id)->first();
        echo json_encode($data);
    }

    function updateDiamondPack(Request $request)
    {
        if($request->lang){
            $input['lang_code']=$request->lang;
            $input['plan_id']=$request->id;
            $input['name']=$request->name;
            $input['description']=$request->description;
            $input['metadata']=$request->metadata;
            $trans=DB::table('plans_translations')->where('plan_id',$request->id)->where('lang_code',$request->lang)->first();
            if($trans){
                DB::table('plans_translations')->where('plan_id',$request->id)->where('lang_code',$request->lang)->update($input);
            }else{
                 DB::table('plans_translations')->insert($input); 
            }
            return json_encode(['status' => true, 'message' => __('app.AddSuccessful')]);
        }
        $input=$request->all();
        unset($input['_token']);
        $input['duration']=$request->duration?$request->duration:0;
        $input['free_boost']=$request->free_boost?$request->free_boost:0;
        $input['free_superlike']=$request->free_superlike?$request->free_superlike:0;
        $input['metadata']=$request->metadata?explode(',',$request->metadata):[];
        $result=Plan::whereId($request->id)->update($input);
        if ($result) {
            return json_encode(['status' => true, 'message' => __('app.AddSuccessful')]);
        } else {
            return json_encode(['status' => false, 'message' => 'something went wrong']);
        }
    }

    function addDiamondPack(Request $request)
    {
        $input=$request->all();
        unset($input['_token']);
        $input['duration']=$request->duration?$request->duration:0;
        $input['free_boost']=$request->free_boost?$request->free_boost:0;
        $input['free_superlike']=$request->free_superlike?$request->free_superlike:0;
        $input['metadata']=$request->metadata?explode(',',$request->metadata):[];
        $result = Plan::create($input);
        if ($result) {
            return json_encode(['status' => true, 'message' => __('app.AddSuccessful')]);
        } else {
            return json_encode(['status' => false, 'message' => 'something went wrong']);
        }
    }

    function fetchDiamondPackages(Request $request)
    {
        $totalData =  Plan::count();
        $rows = Plan::orderBy('id', 'DESC')->get();
        $lang=Language::where('is_default','!=',1)->get();
        $language="";
        foreach($lang as $key=>$value){

          $language.='<a class="dropdown-item plan_lang" href="javascript:void(0)" id="'.$value->short_code.'"><i class="fas fa-edit"></i>&nbsp;'.$value->language_name.'</a>';   

        }
        $result = $rows;

        $columns = array(
            0 => 'id',
            1 => 'type',
            2 => 'name',
            3 => 'price',
            4 => 'duration',
        );

        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        $totalData = Plan::count();
        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $result = Plan::offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $result =  Plan::Where('price', 'LIKE', "%{$search}%")
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = Plan::where('price', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($result as $item) {
            $edit = '<a href="" id="' . $item->id . '" rel="' . $item->id . '" class="btn btn-primary mr-2 edit_cats"><i class="fas fa-edit"></i></a>';

            $delete = '<a href = ""  rel = "' . $item->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';
            $action = '<div style="display: flex;">'.$edit . $delete .'<div class="dropdown" style="margin-left: 10px;"> <button class="btn btn-primary mr-2 dropdown-toggle plan_id" type="button" id="' . $item->id . '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . __('edit_other') . '</button> <div class="dropdown-menu" aria-labelledby="' . $item->id . '">'.$language.'</div></div>';
           
            $limited='<span class="badge badge-secondary">No</span>';
            if($item->limited){
                $limited='<span class="badge badge-secondary">Yes</span>';
            }
            $data[] = array(
                '<p>' . ucwords(str_replace('_',' ',$item->type)). '</p>',
                '<p>' . $item->name . '</p>',
                '<p>' . '$'.$item->price . '</p>',
                $item->duration!=0?'<p>' . $item->duration . ' Days</p>':'Unlimited',
                $item->limited?'<p>'.$item->limited.'</p>':"N/A",
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
    function getallsubscriptions(Request $request)
    {
        $totalData =  PlanSubscription::count();
        $rows = PlanSubscription::select('plan_subscriptions.*','users.first_name','users.last_name','plans.description')->leftjoin('users','users.id','plan_subscriptions.plan_id')->leftjoin('plans','plans.id','plan_subscriptions.plan_id')->orderBy('id', 'DESC')->get();

        $result = $rows;

        $columns = array(
            0 => 'id',
            1 => 'name',
            2 => 'description',
            3 => 'price',
            4 => 'duration',
        );

        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        $totalData = PlanSubscription::count();
        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $result = PlanSubscription::select('plan_subscriptions.*','users.first_name','users.last_name','plans.description','plans.name')->leftjoin('users','users.id','plan_subscriptions.plan_id')->leftjoin('plans','plans.id','plan_subscriptions.plan_id')->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $result =  PlanSubscription::select('plan_subscriptions.*','users.first_name','users.last_name','plans.description','plans.name')->leftjoin('users','users.id','plan_subscriptions.plan_id')->leftjoin('plans','plans.id','plan_subscriptions.plan_id')->Where('price', 'LIKE', "%{$search}%")
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered =PlanSubscription::select('plan_subscriptions.*','users.first_name','users.last_name','plans.description','plans.name')->leftjoin('users','users.id','plan_subscriptions.plan_id')->leftjoin('plans','plans.id','plan_subscriptions.plan_id')->where('price', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($result as $item) {


            if ($item->is_block == 0) {
                $block  =   '<a href=""  rel="' . $item->id . '"   class="btn btn-primary  edit_cats mr-2"><i class="fas fa-edit"></i></a><a href = ""  rel = "' . $item->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';
            }
            $limited='<span class="badge badge-secondary">' . __('no') . '</span>';
            if($item->limited){
                $limited='<span class="badge badge-secondary">' . __('yes') . '</span>';
            }
            $data[] = array(
                '<p>' . $item->first_name.' '.$item->last_name . '</p>',
                '<p>' .$item->description . ' ('.$item->name.')</p>',
                '<p>' . '$'.$item->charging_price . '</p>',
                $item->recurring_each_days !=1000?'<p>' . $item->recurring_each_days . ' Days</p>':'Unlimited',
                '<p>' .$item->starts_on . '</p>',
                '<p>' .$item->expires_on . '</p>',
                $item->cancelled_on ?'<p>' .$item->cancelled_on . '</p>':'N/A',
                $item->expires_on>=date('Y-m-d H:i:s')?'<span class="badge badge-success">' . __('active') . '</span>':'<span class="badge badge-danger">' . __('expired') . 'Expired</span>'

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
}
