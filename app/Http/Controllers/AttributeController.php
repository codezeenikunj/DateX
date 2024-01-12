<?php



namespace App\Http\Controllers;



use App\Models\Attribute;

use App\Models\PersonalQuestion;

use App\Models\Myfunction;

use Illuminate\Http\Request;

use App\Models\Language;

use DB; 

class AttributeController extends Controller

{

    public function index($id=null){

        $question=PersonalQuestion::whereId($id)->first();

        $lang=Language::get();

        return view('attribute',compact('lang','question'));

    }

    function fetchAlloptions(Request $request)

    {



        $totalData = Attribute::where('question_id',$request->per_q_id)->count();

        $rows = Attribute::where('question_id',$request->per_q_id)->orderBy('id', 'DESC')->get();



        $lang=Language::where('is_default','!=',1)->get();

        $language="";

        foreach($lang as $key=>$value){

          $language.='<a class="dropdown-item option_lang" href="javascript:void(0)" id="'.$value->short_code.'"><i class="fas fa-edit"></i>&nbsp;'.$value->language_name.'</a>';   

        }

        $categories = $rows;



        $columns = array(

            0 => 'id',

            1 => 'name',

        );

        $limit = $request->input('length');

        $start = $request->input('start');

        $order = $columns[$request->input('order.0.column')];

        $dir = $request->input('order.0.dir');

        $totalData = Attribute::where('question_id',$request->per_q_id)->count();

        $totalFiltered = $totalData;

        if (empty($request->input('search.value'))) {

            $categories = Attribute::where('question_id',$request->per_q_id)->offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

        } else {

            $search = $request->input('search.value');

            $categories =  Attribute::where('question_id',$request->per_q_id)->Where('name', 'LIKE', "%{$search}%")

                ->offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

            $totalFiltered = Attribute::where('question_id',$request->per_q_id)->where('id', 'LIKE', "%{$search}%")

                ->orWhere('name', 'LIKE', "%{$search}%")

                ->count();

        }

        $data = array();

        foreach ($categories as $cat) {



            $edit = '<a href="" data-toggle="modal" id="' . $cat->id . '" rel="' . $cat->image . '"  data-id="' . $cat->name . '" data-target="#edit_cat_modal" class="btn btn-primary mr-2 edit_cats"><i class="fas fa-edit"></i></a>';

            $delete = '<a href = ""  rel = "' . $cat->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';



            $action = '<div style="display: flex;">'.$edit . $delete .'<div class="dropdown" style="margin-left: 10px;"> <button class="btn btn-primary mr-2 dropdown-toggle option_id" type="button" id="' . $cat->id . '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . __('edit_other') . '</button> <div class="dropdown-menu" aria-labelledby="' . $cat->id . '">'.$language.'</div></div>';

            $data[] = array(

                $cat->name,

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





    function addoptions(Request $req)

    {

        $cat = new Attribute();

        $cat->name =   Myfunction::customReplace($req->title);

        $cat->question_id = $req->question_id;

        $cat->save();

        $data['status'] = true;

        $data['message'] = "add successfull";



        echo json_encode($data);

    }





    function updateoptions(Request $req)

    {



        if($req->lang){

            $input['lang_code']=$req->lang;

            $input['attribute_id']=$req->id;

            $input['name']=$req->title;

            $trans=DB::table('attributes_translations')->where('Attribute_id',$req->id)->where('lang_code',$req->lang)->first();

            if($trans){

                DB::table('attributes_translations')->where('Attribute_id',$req->id)->where('lang_code',$req->lang)->update($input);

             }else{

                 DB::table('attributes_translations')->insert($input);

             }

        }else {

            Attribute::where('id', $req->id)->update(['name' => Myfunction::customReplace($req->title)]);

        }

        $data['status'] = true;

        $data['message'] = __('app.Updatesuccessful');



        echo json_encode($data);

    }



    function getAttributes()

    {

        $data = Attribute::orderBy('id', 'DESC')->get();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function getoptions(Request $request)

    {

        $data = Attribute::whereId($request->id)->first();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function deleteoptions($id)

    {



        $data =  Attribute::where('id', $id);

        $data->delete();



        $data1['status'] = true;

        $data1['message'] = "delete successfull";



        echo json_encode($data1);

    }

}

