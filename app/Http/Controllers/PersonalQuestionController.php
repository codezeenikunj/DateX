<?php



namespace App\Http\Controllers;



use App\Models\PersonalQuestion;

use App\Models\Myfunction;

use Illuminate\Http\Request;

use App\Models\Language;

use DB; 

class PersonalQuestionController extends Controller

{

    public function index(){

        $lang=Language::get();

        return view('personal_question',compact('lang'));

    }

    function fetchAllpersonal_question(Request $request)

    {





        $totalData =  PersonalQuestion::count();

        $rows = PersonalQuestion::orderBy('id', 'DESC')->get();



        $lang=Language::where('is_default','!=',1)->get();

        $language="";

        foreach($lang as $key=>$value){

          $language.='<a class="dropdown-item personal_question_lang" href="javascript:void(0)" id="'.$value->short_code.'"><i class="fas fa-edit"></i>&nbsp;'.$value->language_name.'</a>';   

        }

        $persona_question = $rows;



        $columns = array(

            0 => 'id',

            1 => 'type',

            2 => 'title',

            3 => 'question',

            4 => 'image'

        );

        $limit = $request->input('length');

        $start = $request->input('start');

        $order = $columns[$request->input('order.0.column')];

        $dir = $request->input('order.0.dir');

        $totalData = PersonalQuestion::count();

        $totalFiltered = $totalData;

        if (empty($request->input('search.value'))) {

            $persona_question = PersonalQuestion::offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

        } else {

            $search = $request->input('search.value');

            $persona_question =  PersonalQuestion::Where('title', 'LIKE', "%{$search}%")

                ->offset($start)

                ->limit($limit)

                ->orderBy($order, $dir)

                ->get();

            $totalFiltered = PersonalQuestion::where('id', 'LIKE', "%{$search}%")

                ->orWhere('title', 'LIKE', "%{$search}%")

                ->count();

        }

        $data = array();

        foreach ($persona_question as $cat) {



            $edit = '<a href="" data-toggle="modal" id="' . $cat->id . '" data-target="#edit_cat_modal" class="btn btn-primary mr-2 edit_cats"><i class="fas fa-edit"></i></a>';

            $view = '<a href="'.route('options',$cat->id).'" class="btn btn-primary mr-2 view_cats"><i class="fas fa-eye"> ' . __('options') . '</i></a>';

            $delete = '<a href = ""  rel = "' . $cat->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';

            $image = '<img src="'.$cat->image.'" style="width: 50px;height: 50px;"/>';



            $action = '<div style="display: flex;">'.$view.$edit . $delete .'<div class="dropdown" style="margin-left: 10px;"> <button class="btn btn-primary mr-2 dropdown-toggle personal_question_id" type="button" id="' . $cat->id . '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . __('edit_other') . '</button> <div class="dropdown-menu" aria-labelledby="' . $cat->id . '">'.$language.'</div></div>';

            $data[] = array(

                ucfirst(str_replace('_',' ',$cat->type)),

                $cat->title,

                $cat->question,

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





    function addpersonal_question(Request $req)

    {

        $cat = new PersonalQuestion();

        if($req->file('image')){

            $imageName = time().'.'.$req->image->extension();  

            $req->image->move(public_path('uploads/PersonalQuestion'), $imageName);

            $cat->image ='uploads/PersonalQuestion/'.$imageName;

        }

        $cat->title =   Myfunction::customReplace($req->title);

        $cat->type =   $req->type;

        $cat->question =   $req->question;

        $cat->save();

        $data['status'] = true;

        $data['message'] = "add successfull";



        echo json_encode($data);

    }





    function updatepersonal_question(Request $req)

    {



        if($req->lang){

            $input['lang_code']=$req->lang;

            $input['personal_questions_id']=$req->id;

            $input['title']=$req->title;

            $input['question']=$req->question;

            $trans=DB::table('personal_questions_translations')->where('personal_questions_id',$req->id)->where('lang_code',$req->lang)->first();

            if($trans){

                DB::table('personal_questions_translations')->where('personal_questions_id',$req->id)->where('lang_code',$req->lang)->update($input);

             }else{

                 DB::table('personal_questions_translations')->insert($input);

             }

        }else {

            if ($req->image == "") {

                PersonalQuestion::where('id', $req->id)->update(['title' => Myfunction::customReplace($req->title),'question' => $req->question, 'type' => $req->type]);

            }else{

                $imageName = time().'.'.$req->image->extension();  

                $req->image->move(public_path('uploads/PersonalQuestion'), $imageName);

                $path ='uploads/PersonalQuestion/'.$imageName;

                PersonalQuestion::where('id', $req->id)->update(['title' => Myfunction::customReplace($req->title), 'question' => $req->question, 'type' => $req->type, 'image' => $path]);   

            } 

        }

        $data['status'] = true;

        $data['message'] = __('app.Updatesuccessful');



        echo json_encode($data);

    }



    function getPersonalQuestions()

    {

        $data = PersonalQuestion::orderBy('id', 'DESC')->get();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function getpersonal_question(Request $request)

    {

        $data = PersonalQuestion::whereId($request->id)->first();



        return json_encode(['status' => true, 'message' => __('app.fetchSuccessful'), 'data' => $data]);

    }

    function deletepersonal_question($id)

    {



        $data =  PersonalQuestion::where('id', $id);

        $data->delete();



        $data1['status'] = true;

        $data1['message'] = "delete successfull";



        echo json_encode($data1);

    }

}

