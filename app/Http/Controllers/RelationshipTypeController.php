<?php



namespace App\Http\Controllers;



use App\Models\TypeOfRelationship;

use App\Models\Myfunction;

use Illuminate\Http\Request;

use App\Models\Language;

use DB; 

class RelationshipTypeController extends Controller

{

    public function index(){

        $lang=Language::get();

        return view('typeof_relationships',compact('lang'));

    }

    function fetchAllrelationship_type(Request $request)

    {





        $totalData =  TypeOfRelationship::count();

        $rows = TypeOfRelationship::orderBy('id', 'DESC')->get();



        $lang=Language::where('is_default','!=',1)->get();

        $language="";

        foreach($lang as $key=>$value){

          $language.='<a class="dropdown-item relationship_type_lang" href="javascript:void(0)" id="'.$value->short_code.'"><i class="fas fa-edit"></i>&nbsp;'.$value->language_name.'</a>';   

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

        $totalData = TypeOfRelationship::count();

        $totalFiltered = $totalData;

        if (empty($request->input('search.value'))) {

            $categories = TypeOfRelationship::offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

        } else {

            $search = $request->input('search.value');

            $categories =  TypeOfRelationship::Where('name', 'LIKE', "%{$search}%")

                ->offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

            $totalFiltered = TypeOfRelationship::where('id', 'LIKE', "%{$search}%")

                ->orWhere('name', 'LIKE', "%{$search}%")

                ->count();

        }

        $data = array();

        foreach ($categories as $cat) {



            $edit = '<a href="" data-toggle="modal" id="' . $cat->id . '" data-id="' . $cat->name. '" data-target="#edit_cat_modal" class="btn btn-primary mr-2 edit_cats"><i class="fas fa-edit"></i></a>';

            $delete = '<a href = ""  rel = "' . $cat->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';



            $action = '<div style="display: flex;">'.$edit . $delete .'<div class="dropdown" style="margin-left: 10px;"> <button class="btn btn-primary mr-2 dropdown-toggle relationship_type_id" type="button" id="' . $cat->id . '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . __('edit_other') . '</button> <div class="dropdown-menu" aria-labelledby="' . $cat->id . '">'.$language.'</div></div>';

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





    function addrelationship_type(Request $req)

    {

        $cat = new TypeOfRelationship();

        $cat->name =   Myfunction::customReplace($req->title);

        $cat->save();

        $data['status'] = true;

        $data['message'] = "add successfull";



        echo json_encode($data);

    }





    function updaterelationship_type(Request $req)

    {



        if($req->lang){

            $input['lang_code']=$req->lang;

            $input['type_of_relationships_id']=$req->id;

            $input['name']=$req->title;

            $trans=DB::table('type_of_relationships_translations')->where('type_of_relationships_id',$req->id)->where('lang_code',$req->lang)->first();

            if($trans){

                DB::table('type_of_relationships_translations')->where('type_of_relationships_id',$req->id)->where('lang_code',$req->lang)->update($input);

             }else{

                 DB::table('type_of_relationships_translations')->insert($input);

             }

        }else {

            TypeOfRelationship::where('id', $req->id)->update(['name' => Myfunction::customReplace($req->title)]);

        }

        $data['status'] = true;

        $data['message'] = __('app.Updatesuccessful');



        echo json_encode($data);

    }



    function getrelationship_types()

    {

        $data = TypeOfRelationship::orderBy('id', 'DESC')->get();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function getrelationship_type(Request $request)

    {

        $data = TypeOfRelationship::whereId($request->id)->first();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function deleterelationship_type($id)

    {



        $data =  TypeOfRelationship::where('id', $id);

        $data->delete();



        $data1['status'] = true;

        $data1['message'] = "delete successfull";



        echo json_encode($data1);

    }

}

