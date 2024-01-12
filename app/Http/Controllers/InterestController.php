<?php

namespace App\Http\Controllers;

use App\Models\Interest;
use App\Models\Myfunction;
use Illuminate\Http\Request;
use App\Models\Language;
use DB; 
class InterestController extends Controller
{
    public function index(){
        $lang=Language::get();
        return view('interest',compact('lang'));
    }
    function fetchAllInterest(Request $request)
    {


        $totalData =  Interest::count();
        $rows = Interest::orderBy('id', 'DESC')->get();

        $lang=Language::where('is_default','!=',1)->get();
        $language="";
        foreach($lang as $key=>$value){
          $language.='<a class="dropdown-item interest_lang" href="javascript:void(0)" id="'.$value->short_code.'"><i class="fas fa-edit"></i>&nbsp;'.$value->language_name.'</a>';   
        }
        $categories = $rows;

        $columns = array(
            0 => 'id',
            1 => 'title',
            2 => 'image'
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        $totalData = Interest::count();
        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $categories = Interest::offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $categories =  Interest::Where('title', 'LIKE', "%{$search}%")
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = Interest::where('id', 'LIKE', "%{$search}%")
                ->orWhere('title', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($categories as $cat) {

            $edit = '<a href="" data-toggle="modal" id="' . $cat->id . '" rel="' . $cat->image . '"  data-id="' . $cat->title . '" data-target="#edit_cat_modal" class="btn btn-primary mr-2 edit_cats"><i class="fas fa-edit"></i></a>';
            $delete = '<a href = ""  rel = "' . $cat->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';
            $image = '<img src="'.$cat->image.'" style="width: 50px;height: 50px;"/>';

            $action = '<div style="display: flex;">'.$edit . $delete .'<div class="dropdown" style="margin-left: 10px;"> <button class="btn btn-primary mr-2 dropdown-toggle interest_id" type="button" id="' . $cat->id . '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . __('edit_other') . '</button> <div class="dropdown-menu" aria-labelledby="' . $cat->id . '">'.$language.'</div></div>';
            $data[] = array(
                $cat->title,
                 $image,
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


    function addInterest(Request $req)
    {
        $cat = new Interest();
        if($req->file('image')){
            $imageName = time().'.'.$req->image->extension();  
            $req->image->move(public_path('uploads/interest'), $imageName);
            $cat->image ='uploads/interest/'.$imageName;
        }
        $cat->title =   Myfunction::customReplace($req->title);
        $cat->save();
        $data['status'] = true;
        $data['message'] = "add successfull";

        echo json_encode($data);
    }


    function updateInterest(Request $req)
    {

        if($req->lang){
            $input['lang_code']=$req->lang;
            $input['interest_id']=$req->id;
            $input['title']=$req->title;
            $trans=DB::table('interests_translations')->where('interest_id',$req->id)->where('lang_code',$req->lang)->first();
            if($trans){
                DB::table('interests_translations')->where('interest_id',$req->id)->where('lang_code',$req->lang)->update($input);
             }else{
                 DB::table('interests_translations')->insert($input);
             }
        }else {
            if ($req->image == "") {
                Interest::where('id', $req->id)->update(['title' => Myfunction::customReplace($req->title)]);
            }else{
                $imageName = time().'.'.$req->image->extension();  
                $req->image->move(public_path('uploads/interest'), $imageName);
                $path ='uploads/interest/'.$imageName;
                Interest::where('id', $req->id)->update(['title' => Myfunction::customReplace($req->title), 'image' => $path]);    
            } 
        }
        $data['status'] = true;
        $data['message'] = __('app.Updatesuccessful');

        echo json_encode($data);
    }

    function getInterests()
    {
        $data = Interest::orderBy('id', 'DESC')->get();

        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);
    }
    function getInterest(Request $request)
    {
        $data = Interest::whereId($request->id)->first();

        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);
    }
    function deleteInterest($id)
    {

        $data =  Interest::where('id', $id);
        $data->delete();

        $data1['status'] = true;
        $data1['message'] = "delete successfull";

        echo json_encode($data1);
    }
}
