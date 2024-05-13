<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Mail\ScheduleMail;
use Illuminate\Http\Request;
use App\Models\PackagePlan;
use Carbon\Carbon;
use App\Models\SmtpSetting;
use Illuminate\Support\Facades\Mail;
use App\Models\SiteSetting;
use Image;

class SettingController extends Controller
{
    public function SmtpSetting(){

        $setting = SmtpSetting::find(1);
        return view('backend.setting.smtp_update',compact('setting'));

    }// End Method

    public function UpdateSmtpSetting(Request $request){
        $smtp_id = $request->id;

        SmtpSetting::findOrFail($smtp_id)->update([

            'mailer' => $request->mailer,
            'host' => $request->host,
            'port' => $request->port,
            'username' => $request->username,
            'password' => $request->password,
            'encryption' => $request->encryption,
            'from_address' => $request->from_address,

        ]);

        $notification = array(
            'message' => 'Smtp Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);


    }// End Method

    public function SiteSetting(){

        $sitesetting = SiteSetting::find(1);
        return view('backend.setting.site_update',compact('sitesetting'));

    }// End Method

    public function UpdateSiteSetting(Request $request){

        $site_id = $request->id;

        if ($request->file('logo')){
            $image = $request->file('logo');
            $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('upload/logo/'), $name_gen);
            $save_url = 'upload/logo/'.$name_gen;
    
            SiteSetting::findOrFail($site_id)->update([
    
                'support_phone' => $request->support_phone,
                'company_address' => $request->company_address,
                'email' => $request->email,
                'facebook' => $request->facebook,
                'twitter' => $request->twitter,
                'copyright' => $request->copyright,
                'logo' => $save_url,
            ]);
    
            
            $notification = [
                'message' => 'SiteSetting Updated With Image Successfully',
                'alert-type' => 'success'
            ];
    
            return redirect()->back()->with($notification);
    
        }else{
    
               
            SiteSetting::findOrFail($site_id)->update([
    
                'support_phone' => $request->support_phone,
                'company_address' => $request->company_address,
                'email' => $request->email,
                'facebook' => $request->facebook,
                'twitter' => $request->twitter,
                'copyright' => $request->copyright,
               
            ]);
    
            
            $notification = [
                'message' => 'SiteSetting Updated Without Image Successfully',
                'alert-type' => 'success'
            ];
    
            return redirect()->back()->with($notification);
    
    
        }
    
       }// End Method
}
