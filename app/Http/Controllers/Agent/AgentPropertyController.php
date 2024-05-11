<?php

namespace App\Http\Controllers\Agent;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\Facility;
use App\Models\MultiImage;
use App\Models\PropertyType;
use App\Models\User;
use Carbon\Carbon;
use App\Models\Amenities;
use App\Models\State;
use Illuminate\Support\Facades\Auth; 
use Haruncpi\LaravelIdGenerator\IdGenerator;
use DB;
use App\Models\PackagePlan;
use App\Models\PropertyMessage;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\Schedule;



class AgentPropertyController extends Controller
{
    public function AgentAllProperty(){

        $id = Auth::user()->id;
        $property = Property::where('agent_id',$id)->latest()->get();
        return view('agent.property.all_property', compact('property'));
    } // End Method

    public function AgentAddProperty(){


        $propertytype = PropertyType::latest()->get();
        $amenities = Amenities::latest()->get();
        $pstate = State::latest()->get();

        $id = Auth::user()->id;
        $property = User::where('role','agent')->where('id',$id)->first();
        $pcount = $property->credit;
        // dd($pcount);

        if($pcount == 1 || $pcount == 7){
            return redirect()->route('buy.package');
        }else{
            return view('agent.property.add_property', compact('propertytype', 'amenities','pstate'));
        }

      
    } // End Method

    public function AgentStoreProperty(Request $request){

        $id = Auth::user()->id;
        $uid = User::findOrFail($id);
        $nid = $uid->credit;

        $amen = $request->amemities_id;
        $amenities = implode(",", $amen);

        $pcode = IdGenerator::generate(['table' => 'properties', 'field' =>
        'property_code', 'length' => 5, 'prefix' => 'PC']);


        $image = $request->file('property_thambnail');
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('upload/property_thambnail'), $name_gen);
        $save_url = 'upload/property_thambnail/' . $name_gen;

        $property_id = Property::insertGetId([

            'ptype_id' => $request->ptype_id,
            'amemities_id' => $amenities,

            'property_name' => $request->property_name,
            'property_slug' => strtolower(str_replace('', '-', $request->property_name)),

            'property_code' => $pcode,
            'property_status' => $request->property_status,

            'lowest_price' => $request->lowest_price,
            'max_price' => $request->max_price,

            'short_desc' => $request->short_desc,
            'long_desc' => $request->long_desc,

            'bedrooms' => $request->bedrooms,
            'bathrooms' => $request->bathrooms,

            'garage' => $request->garage,
            'garage_size' => $request->garage_size,

            'property_size' => $request->property_size,
            'property_video' => $request->property_video,
            'address' => $request->address,

            'city' => $request->city,
            'state' => $request->state,
            'postal_code' => $request->postal_code,
            'neighborhood' => $request->neighborhood,

            'latitude' => $request->latitude,
            'longitude' => $request->longitude,

            'featured' => $request->featured,
            'hot' => $request->hot,
            'agent_id' => Auth::user()->id,

            'status' => 1,
            'property_thambnail' => $save_url,
            'created_at' => Carbon::now(),

        ]); 

        //Multiple Image  upload here
        $images = $request->file('multi_img');
        if ($images) {

            foreach ($images as $img) {

                $make_name = uniqid() . '.' . $img->getClientOriginalExtension();
                $img->move(public_path('upload/multi_img'), $make_name);
                $save_url = 'upload/multi_img/' . $make_name;
                
                $multiImage = new MultiImage();
                $multiImage->property_id = $property_id;
                $multiImage->photo_name = $save_url;
                $multiImage->save();
            }
        } // end forearch
        
        //Facility add form here//
        
        $facilitiesCount = count($request->facility_name);
        
        if ($facilitiesCount > 0) {
            for ($i = 0; $i < $facilitiesCount; $i++) {
                $facility = new Facility();
                $facility->property_id = $property_id;
                $facility->facility_name = $request->facility_name[$i];
                $facility->distance = $request->distance[$i]; // Corrected from property_id to distance
                $facility->save();
            }
        } // End Facility//

        User::where('id',$id)->update([
            'credit' => DB::raw('1 + '.$nid),
        ]);

        $notification = [
            'message' => 'Property Inserted Successfully',
            'alert-type' => 'success'
        ];

        return redirect()->route('agent.all.property')->with($notification);

        //Facility End form here//
    } // End Method

    public function AgentEditProperty($id){

        $facilities = Facility::where('property_id', $id)->get();
        $property = Property::findOrFail($id);
        $type = $property->amemities_id;
        $property_ami = explode(',', $type);

        $multiImage = MultiImage::where('property_id', $id)->get();
        $pstate = State::latest()->get();

        $propertytype = PropertyType::latest()->get();
        $amenities = Amenities::latest()->get();
       

        return view('agent.property.edit_property',compact('property', 
        'propertytype','amenities','property_ami', 'multiImage', 'facilities','pstate'));

    } // End Method


    public function AgentUpdateProperty(Request $request){
        $amen = $request->amemities_id;
        $amenities = implode(",", $amen);

        $property_id = $request->id;
        Property::findOrFail( $property_id )->update([

            'ptype_id' => $request->ptype_id,
            'amemities_id' => $amenities,

            'property_name' => $request->property_name,
            'property_slug' => strtolower(str_replace('', '-', $request->property_name)),

            'property_status' => $request->property_status,
            'lowest_price' => $request->lowest_price,
            'max_price' => $request->max_price,

            'short_desc' => $request->short_desc,
            'long_desc' => $request->long_desc,

            'bedrooms' => $request->bedrooms,
            'bathrooms' => $request->bathrooms,

            'garage' => $request->garage,
            'garage_size' => $request->garage_size,

            'property_size' => $request->property_size,
            'property_video' => $request->property_video,
            'address' => $request->address,

            'city' => $request->city,
            'state' => $request->state,
            'postal_code' => $request->postal_code,
            'neighborhood' => $request->neighborhood,

            'latitude' => $request->latitude,
            'longitude' => $request->longitude,

            'featured' => $request->featured,
            'hot' => $request->hot,
            'agent_id' => Auth::user()->id,
            'updated_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Property Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('agent.all.property')->with($notification);

    }// End Method

    public function AgentUpdatePropertyThambnail(Request $request){

        $pro_id = $request->id;
        $oldImage = $request->old_img;

        $image = $request->file('property_thambnail');
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('upload/property_thambnail'), $name_gen);
        $save_url = 'upload/property_thambnail/' . $name_gen;

        if(file_exists($oldImage)){
            unlink($oldImage);
        }

        Property::findOrFail($pro_id)->update([
            'property_thambnail' => $save_url,
            'updated_at'    => Carbon::now(),
        ]);

        $notification = [
            'message' => 'Property Image Thambnail Updated Successfully',
            'alert-type' => 'success'
        ];

        return redirect()->back()->with($notification);

    } // End Method

    public function AgentUpdatePropertyMultiimage(Request $request){

        $imgs = $request->multi_img;

        foreach($imgs as $id => $img){
           $imgDel = MultiImage::findOrFail($id);
           unlink($imgDel->photo_name);


           $make_name = uniqid() . '.' . $img->getClientOriginalExtension();
           $img->move(public_path('upload/multi_img'), $make_name);
           $save_url = 'upload/multi_img/' . $make_name;

           MultiImage::where('id', $id)->update([

            'photo_name' => $save_url,
            'updated_at' => Carbon::now(),

           ]);
        } // End Foreach 

        $notification = array(
            'message' => 'Agent Property Multi Image  Updated Successfully',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    } // End Method


         public function AgentPropertyMultiimageDelete($id){

        $oldImg = MultiImage::findOrFail($id);
        unlink($oldImg->photo_name);

        MultiImage::findOrFail($id)->delete();

        $notification = array(
            'message' => 'Property Multi Image Deleted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification); 

    }// End Method 

    public function AgentStoreNewMultiimage(Request $request){
        $new_multi = $request->imageid;

        $image = $request->file('multi_img');

        $make_name = uniqid() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('upload/multi_img'), $make_name);
        $save_url = 'upload/multi_img/' . $make_name;

        MultiImage::insert([

         'property_id' => $new_multi,
         'photo_name' => $save_url,
         'updated_at' => Carbon::now(),

        ]);
        $notification = array(
            'message' => 'Property Multi Image  Added Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    } // End Method

    public function AgentUpdatePropertyFacilities(Request $request){

        $pid = $request->id;
        
        if($request->facility_name == NULL){
            return redirect()->back();
        }else{
            Facility::where('property_id',$pid)->delete();

            $facilitiesCount = count($request->facility_name);
        
                for ($i = 0; $i < $facilitiesCount; $i++) {
                    $facility = new Facility();
                    $facility->property_id = $pid;
                    $facility->facility_name = $request->facility_name[$i];
                    $facility->distance = $request->distance[$i]; // Corrected from property_id to distance
                    $facility->save();
                } //end for
        }

        $notification = array(
            'message' => 'Property Facility Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    } // End Method

    public function AgentDetailsProperty($id){

        $facilities = Facility::where('property_id', $id)->get();
        $property = Property::findOrFail($id);
        $type = $property->amemities_id;
        $property_ami = explode(',', $type);

        $multiImage = MultiImage::where('property_id', $id)->get();

        $propertytype = PropertyType::latest()->get();
        $amenities = Amenities::latest()->get();

        return view('agent.property.details_property',compact('property', 
        'propertytype','amenities', 'property_ami', 'multiImage', 'facilities'));

    } // End Method

    public function AgentDeleteProperty($id){

        $property = Property::findOrFail($id);
        unlink($property->property_thambnail);

        Property::findOrFail($id)->delete();

        $image = MultiImage::where('property_id',$id)->get();

        foreach($image as $img){
            unlink($img->photo_name);
            MultiImage::where('property_id',$id)->delete();
        }

        $facilitiesData = Facility::where('property_id',$id)->get();
        foreach($facilitiesData as $item){
            $item->facility_name;
            Facility::where('property_id',$id)->delete();
        }
        
          $notification = array(
            'message' => 'Property Deleted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    }// End Method  

    public function BuyPackage(){

        return view('agent.package.buy_package');
    } // End Method
    
    public function BuyBusinessPlan(){

        $id = Auth::user()->id;
        $data = User::find($id);

        return view('agent.package.business_plan', compact('data'));
    } // End Method

    public function StoreBusinessPlan(Request $request){

        $id = Auth::user()->id;
        $uid = User::findOrFail($id);
        $nid = $uid->credit;
    
        PackagePlan::insert([
    
            'user_id'          => $id,
            'package_name'     => 'Business',
            'package_credits'  => '3',
            'invoice'          => 'ERS'.mt_rand(10000000,99999999),
            'package_amount'   => '20',
            'created_at'       => Carbon::now(),
        ]);
    
        User::where('id',$id)->update([
            'credit' => DB::raw('3 + '.$nid),
        ]);
    
        $notification = array(
            'message' => 'You have purchase Basic package Successfully',
            'alert-type' => 'success'
        );
    
        return redirect()->route('agent.all.property')->with($notification);
    }// End Method


    public function BuyProfessionalPlan(){

        $id = Auth::user()->id;
        $data = User::find($id);

        return view('agent.package.Professional_plan', compact('data'));

    } // End Method
    public function StoreProfessionalPlan(Request $request){

        $id = Auth::user()->id;
        $uid = User::findOrFail($id);
        $nid = $uid->credit;
    
        PackagePlan::insert([
    
            'user_id'          => $id,
            'package_name'     => 'Professional',
            'package_credits'  => '10',
            'invoice'          => 'ERS'.mt_rand(10000000,99999999),
            'package_amount'   => '50',
            'created_at'       => Carbon::now(),
        ]);
    
        User::where('id',$id)->update([
            'credit' => DB::raw('10 + '.$nid),
        ]);
    
        $notification = array(
            'message' => 'You have purchase Professional package Successfully',
            'alert-type' => 'success'
        );
    
        return redirect()->route('agent.all.property')->with($notification);
    }// End Method

    public function PackageHistory(){

        $id = Auth::user()->id;
        $packagehistory = PackagePlan::where('user_id',$id)->get();
        return view('agent.package.package_history', compact('packagehistory'));

    } // End Method

    public function AgentPackageInvoice($id){

        $packagehistory = PackagePlan::where('id',$id)->first(); 
        $pdf = Pdf::loadView('agent.package.package_history_invoice', compact('packagehistory'))
        ->setPaper('a4')->setOption([
            'tempDir' => public_path(),
            'chroot' => public_path(),
        ]);
        return $pdf->download('invoice.pdf');

    } // End Method

    public function AgentPropertyMessage(){

        $id = Auth::user()->id;
        $usermsg = PropertyMessage::where('agent_id',$id)->get();

        return view('agent.message.all_message', compact('usermsg'));
    } // End Method

    public function AgentMessageDetails($id){

        $uid = Auth::user()->id;
        $usermsg = PropertyMessage::where('agent_id',$uid)->get();

        $msgdetails = PropertyMessage::findOrFail($id);

        return view('agent.message.message_details', compact('usermsg','msgdetails'));
    } // End Method

    public function AgentScheduleRequest(){

        $id = Auth::user()->id;
        
        $usermsg = Schedule::where('agent_id',$id)->get();

        return view('agent.schedule.schedule_request', compact('usermsg'));

    } // End Method
    
}
