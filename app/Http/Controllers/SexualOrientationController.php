<?php



namespace App\Http\Controllers;



use App\Models\SexualOrientation;

use App\Models\Myfunction;

use Illuminate\Http\Request;

use App\Models\Language;

use DB; 

class SexualOrientationController extends Controller

{

    public function index(){

        $lang=Language::get();

        return view('sexual_orientation',compact('lang'));

    }

    function fetchAllsexual_orientation(Request $request)

    {





        $totalData =  SexualOrientation::count();

        $rows = SexualOrientation::orderBy('id', 'DESC')->get();



        $lang=Language::where('is_default','!=',1)->get();

        $language="";

        foreach($lang as $key=>$value){

          $language.='<a class="dropdown-item sexual_orientation_lang" href="javascript:void(0)" id="'.$value->short_code.'"><i class="fas fa-edit"></i>&nbsp;'.$value->language_name.'</a>';   

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

        $totalData = SexualOrientation::count();

        $totalFiltered = $totalData;

        if (empty($request->input('search.value'))) {

            $categories = SexualOrientation::offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

        } else {

            $search = $request->input('search.value');

            $categories =  SexualOrientation::Where('name', 'LIKE', "%{$search}%")

                ->offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

            $totalFiltered = SexualOrientation::where('id', 'LIKE', "%{$search}%")

                ->orWhere('name', 'LIKE', "%{$search}%")

                ->count();

        }

        $data = array();

        foreach ($categories as $cat) {



            $edit = '<a href="" data-toggle="modal" id="' . $cat->id . '" rel="' . $cat->image . '"  data-id="' . $cat->name . '" data-target="#edit_cat_modal" class="btn btn-primary mr-2 edit_cats"><i class="fas fa-edit"></i></a>';

            $delete = '<a href = ""  rel = "' . $cat->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';

            $action = '<div style="display: flex;">'.$edit . $delete .'<div class="dropdown" style="margin-left: 10px;"> <button class="btn btn-primary mr-2 dropdown-toggle sexual_orientation_id" type="button" id="' . $cat->id . '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . __('edit_other') . '</button> <div class="dropdown-menu" aria-labelledby="' . $cat->id . '">'.$language.'</div></div>';

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





    function addsexual_orientation(Request $req)

    {

        $cat = new SexualOrientation();

        if($req->file('image')){

            $imageName = time().'.'.$req->image->extension();  

            $req->image->move(public_path('uploads/sexual_orientation'), $imageName);

            $cat->image ='uploads/sexual_orientation/'.$imageName;

        }

        $cat->name =   Myfunction::customReplace($req->title);

        $cat->save();

        $data['status'] = true;

        $data['message'] = "add successfull";



        echo json_encode($data);

    }





    function updatesexual_orientation(Request $req)

    {



        if($req->lang){

            $input['lang_code']=$req->lang;

            $input['sexual_orientations_id']=$req->id;

            $input['name']=$req->title;

            $trans=DB::table('sexual_orientations_translations')->where('sexual_orientations_id',$req->id)->where('lang_code',$req->lang)->first();

            if($trans){

                DB::table('sexual_orientations_translations')->where('sexual_orientations_id',$req->id)->where('lang_code',$req->lang)->update($input);

             }else{

                 DB::table('sexual_orientations_translations')->insert($input);

             }

        }else {

            SexualOrientation::where('id', $req->id)->update(['name' => Myfunction::customReplace($req->title)]); 

        }

        $data['status'] = true;

        $data['message'] = __('app.Updatesuccessful');



        echo json_encode($data);

    }



    function getsexual_orientations()

    {

        $data = SexualOrientation::orderBy('id', 'DESC')->get();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function getsexual_orientation(Request $request)

    {

        $data = SexualOrientation::whereId($request->id)->first();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function deletesexual_orientation($id)

    {



        $data =  SexualOrientation::where('id', $id);

        $data->delete();



        $data1['status'] = true;

        $data1['message'] = "delete successfull";



        echo json_encode($data1);

    }

}

