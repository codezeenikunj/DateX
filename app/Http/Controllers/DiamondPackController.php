<?php

namespace App\Http\Controllers;

use App\Models\DiamondPacks;
use Illuminate\Http\Request;

class DiamondPackController extends Controller
{
    //

    function diamondpacks()
    {
        return view('diamondpacks');
    }

    function getDiamondPacks(Request $request){
        $data = DiamondPacks::all();

        return json_encode([
            'status' => true,
            'message' => 'diamond packs get successfully',
            'data' => $data
        ]);
    }

    function deleteDiamondPack($id)
    {
        $data =  DiamondPacks::where('id', $id);
        $data->delete();

        $data1['status'] = true;
        echo json_encode($data1);
    }


    function getDiamondPackById($id)
    {
        $data = DiamondPacks::where('id', $id)->first();
        echo json_encode($data);
    }

    function updateDiamondPack(Request $request)
    {
        //return $request->all();
        $pack =  DiamondPacks::find($request->id);
        $pack->title = $request->title;
        $pack->amount = $request->amount;
        $pack->price = $request->price;
        $pack->android_product_id = $request->android_product_id;
        $pack->ios_product_id = $request->ios_product_id;
        $pack->limited = $request->limited;
        if($request->file('image')){
            $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads'), $imageName);
            $pack->image ='uploads/'.$imageName;
        }
        $result = $pack->save();

        if ($result) {
            return json_encode(['status' => true, 'message' => __('app.AddSuccessful')]);
        } else {
            return json_encode(['status' => false, 'message' => 'something went wrong']);
        }
    }

    function addDiamondPack(Request $request)
    {
        //return $request->all();
        $pack = new DiamondPacks();
        $pack->title = $request->title;
        $pack->amount = $request->amount;
        $pack->price = $request->price;
        $pack->android_product_id = $request->android_product_id;
        $pack->ios_product_id = $request->ios_product_id;
         if($request->file('image')){
            $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads'), $imageName);
            $pack->image ='uploads/'.$imageName;
        }
        $result = $pack->save();

        if ($result) {
            return json_encode(['status' => true, 'message' => __('app.AddSuccessful')]);
        } else {
            return json_encode(['status' => false, 'message' => 'something went wrong']);
        }
    }

    function fetchDiamondPackages(Request $request)
    {
        $totalData =  DiamondPacks::count();
        $rows = DiamondPacks::orderBy('id', 'DESC')->get();

        $result = $rows;

        $columns = array(
            0 => 'id',
            1 => 'amount'
        );

        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        $totalData = DiamondPacks::count();
        $totalFiltered = $totalData;
        if (empty($request->input('search.value'))) {
            $result = DiamondPacks::offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $result =  DiamondPacks::Where('amount', 'LIKE', "%{$search}%")
                ->orWhere('android_product_id', 'LIKE', "%{$search}%")
                ->orWhere('ios_product_id', 'LIKE', "%{$search}%")
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
            $totalFiltered = DiamondPacks::where('amount', 'LIKE', "%{$search}%")
                ->orWhere('android_product_id', 'LIKE', "%{$search}%")
                ->orWhere('ios_product_id', 'LIKE', "%{$search}%")
                ->count();
        }
        $data = array();
        foreach ($result as $item) {


            if ($item->is_block == 0) {
                $block  =   '<a href=""  rel="' . $item->id . '"   class="btn btn-primary  edit_cats mr-2"><i class="fas fa-edit"></i></a><a href = ""  rel = "' . $item->id . '" class = "btn btn-danger delete-cat text-white" > <i class="fas fa-trash-alt"></i> </a>';
            }
            $limited='<span class="badge badge-secondary">No</span>';
            if($item->limited){
                $limited='<span class="badge badge-secondary">Yes</span>';
            }
            $data[] = array(
                '<p>' . $item->title . '</p>',
                '<img src="'.$item->image.'" style="width: 50px;height: 50px;"/>',
                '<p>' . $item->amount . '</p>',
                '<p>' . $item->price . '</p>',
                '<p>' . $item->android_product_id . '</p>',
                '<p>' . $item->ios_product_id . '</p>',
                '<p>' . $limited . '</p>',
                $block

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
