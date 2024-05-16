<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ChatMessage;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ChatController extends Controller
{
    public function SendMsg(Request $request){
        $validator = Validator::make($request->all(), [
            'receiver_id' => 'required',
            'msg' => 'required'
        ]);

        if ($validator->fails()) {
            $notification = array(
                'message' => 'Message not send due to error',
                'alert-type' => 'error'
            );

            return redirect()->back()->withErrors($validator)->withInput();
        }
        
        ChatMessage::create([
            'sender_id' => Auth::user()->id,
            'receiver_id' => $request->receiver_id,
            'msg' => $request->msg,
            'created_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Message Sent Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    } // End Method
}
