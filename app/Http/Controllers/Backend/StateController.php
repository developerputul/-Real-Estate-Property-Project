<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\PropertyType;
use App\Models\State;
use Intervention\Image\Facades\Image;



class StateController extends Controller
{
    public function AllState(){

        $state = State::latest()->get();
        return view('backend.state.all_state', compact('state'));

    } // End Method

    public function AddState(){

        return view('backend.state.add_state');

    }// End Mehtod

    public function StoreState(Request $request){

        $image = $request->file('state_img');
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('upload/state/'), $name_gen);
        $save_url = 'upload/state/'.$name_gen;

        State::insert([

            'state_name' => $request->state_name,
            'state_img' => $save_url,
        ]);

        
        $notification = [
            'message' => 'State Inserted Successfully',
            'alert-type' => 'success'
        ];

        return redirect()->route('all.state')->with($notification);

   } // End Method

   public function EditState($id){

    $state = State::findOrFail($id);
    return view('backend.state.edit_state', compact('state'));
   } // End Method

   public function UpdateState(Request $request){

    $state_id = $request->id;

    if ($request->file('state_img')){

        $image = $request->file('state_img');
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('upload/state/'), $name_gen);
        $save_url = 'upload/state/'.$name_gen;

        State::findOrFail($state_id)->update([

            'state_name' => $request->state_name,
            'state_img' => $save_url,
        ]);

        
        $notification = [
            'message' => 'State Updated With Image Successfully',
            'alert-type' => 'success'
        ];

        return redirect()->route('all.state')->with($notification);

    }else{

           State::findOrFail($state_id)->update([

            'state_name' => $request->state_name,
        ]);

        
        $notification = [
            'message' => 'State Updated Without Image Successfully',
            'alert-type' => 'success'
        ];

        return redirect()->route('all.state')->with($notification);

    }

   }// End Method

   public function DeleteState($id){

    $state = State::findOrFail($id);
    $img = $state->state_img;
    unlink($img);

    State::findOrFail($id)->delete();

    $notification = [
        'message' => 'State Deleted Successfully',
        'alert-type' => 'success'
    ];

    return redirect()->back()->with($notification);


   } // End Method


}
