<?php

namespace App\Http\Controllers;

use App\Models\KnowLanguage;
use App\Models\Myfunction;
use Illuminate\Http\Request;
use App\Models\Language;
use DB; 
class KnowLanguageController extends Controller
{
    public function index(){
        $lang=Language::get();
        return view('knowlanguage',compact('lang'));
    }
    function fetchAllknow_languages(Request $request)
    {

        $totalData =  KnowLanguage::count();
        $rows = KnowLanguage::orderBy('id', 'DESC')->get();

        $lang=Language::where('is_default','!=',1)->get();
        $language="";
        foreach($lang as $key=>$value){
          $language.='<a class="dropdown-item know_languages_lang" href="javascript:void(0)" id="'.$value->short_code.'"><i class="fas fa-edit"></i>&nbsp;'.$value->language_name.'</a>';   
        }
        $categories = $rows;

        $columns = array(
            0 => 'id',
            1 => 'language_name',
        );
        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        $totalData = KnowLanguage::count();
        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $categories = KnowLanguage::offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $categories =  KnowLanguage::Where('language_name', 'LIKE', "%{$search}%")
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = KnowLanguage::where('id', 'LIKE', "%{$search}%")
                ->orWhere('language_name', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($categories as $cat) {

            $edit = '<a href="" data-toggle="modal" id="' . $cat->id . '" data-id="' . $cat->language_name. '" data-target="#edit_cat_modal" class="btn btn-primary mr-2 edit_cats"><i class="fas fa-edit"></i></a>';
            $delete = '<a href = ""  rel = "' . $cat->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';

            $action = '<div style="display: flex;">'.$edit . $delete .'<div class="dropdown" style="margin-left: 10px;"> <button class="btn btn-primary mr-2 dropdown-toggle know_languages_id" type="button" id="' . $cat->id . '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Edit Other</button> <div class="dropdown-menu" aria-labelledby="' . $cat->id . '">'.$language.'</div></div>';
            $data[] = array(
                $cat->language_name,
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


    function addknow_languages(Request $req)
    {
        $cat = new KnowLanguage();
        $cat->language_name =   Myfunction::customReplace($req->language_name);
        $cat->save();
        $data['status'] = true;
        $data['message'] = "add successfull";

        echo json_encode($data);
    }


    function updateknow_languages(Request $req)
    {

        if($req->lang){
            $input['lang_code']=$req->lang;
            $input['language_id']=$req->id;
            $input['language_name']=$req->language_name;
            $trans=DB::table('know_languages_translations')->where('language_id',$req->id)->where('lang_code',$req->lang)->first();
            if($trans){
                DB::table('know_languages_translations')->where('language_id',$req->id)->where('lang_code',$req->lang)->update($input);
             }else{
                 DB::table('know_languages_translations')->insert($input);
             }
        }else {
            KnowLanguage::where('id', $req->id)->update(['language_name' => Myfunction::customReplace($req->language_name)]);
        }
        $data['status'] = true;
        $data['message'] = __('app.Updatesuccessful');

        echo json_encode($data);
    }

    function getrelationship_types()
    {
        $data = KnowLanguage::orderBy('id', 'DESC')->get();

        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);
    }
    function getknow_languages(Request $request)
    {
        $data = KnowLanguage::whereId($request->id)->first();

        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);
    }
    function deleteknow_languages($id)
    {

        $data =  KnowLanguage::where('id', $id);
        $data->delete();

        $data1['status'] = true;
        $data1['message'] = "delete successfull";

        echo json_encode($data1);
    }
}
