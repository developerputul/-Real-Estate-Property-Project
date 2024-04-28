<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Amenities;
use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\Facility;
use App\Models\MultiImage;
use App\Models\PropertyType;
use App\Models\User;
use Carbon\Carbon;
use Image;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class PropertyController extends Controller
{
    public function AllProperty()
    {
        $property = Property::latest()->get();
        return view('backend.property.all_property', compact('property'));
    } // End Method

    public function AddProperty()
    {
        $propertytype = PropertyType::latest()->get();
        $amenities = Amenities::latest()->get();
        $activeAgent = User::where('status', 'active')->where('role', 'agent')->latest()->get();

        return view('backend.property.add_property', compact('propertytype', 'amenities', 'activeAgent'));
    } //End Method

    public function StoreProperty(Request $request)
    {
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
            'agent_id' => $request->agent_id,

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
        }

        $notification = [
            'message' => 'Property Inserted Successfully',
            'alert-type' => 'success'
        ];

        return redirect()->route('all.property')->with($notification);

        //Facility End form here//


    } // End Method

    public function EditProperty($id){
        $property = Property::findOrFail($id);

        $type = $property->amemities_id;
        $property_ami = explode(',', $type);

        $propertytype = PropertyType::latest()->get();
        $amenities = Amenities::latest()->get();
        $activeAgent = User::where('status', 'active')->where('role', 'agent')->latest()->get();

        return view('backend.property.edit_property',compact('property', 
        'propertytype','amenities','activeAgent', 'property_ami'));
    } // End Method


}
