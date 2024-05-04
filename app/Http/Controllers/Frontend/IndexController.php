<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Amenities;
use App\Models\Property;
use App\Models\Facility;
use App\Models\MultiImage;
use App\Models\PropertyType;
use App\Models\User;
use Carbon\Carbon;
use Image;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use App\Models\PackagePlan;
use Barryvdh\DomPDF\Facade\Pdf;

class IndexController extends Controller
{
    public function PropertyDetails($id,$slug){

        $property = Property::findOrFail($id);

        $amenities = $property->amenities_id;
        $property_amen = explode(',',$amenities);

        $multiImage = MultiImage::where('property_id', $id)->get();
        $facility = Facility::where('property_id',$id)->get();

        $type_id = $property->ptype_id;

        $relatedproperty = Property::where('ptype_id',$type_id)->where('id','!=',$id)
        ->orderBy('id','DESC')->limit(3)->get();

        return view('frontend.property.property_details', compact('property', 
        'multiImage', 'property_amen', 'facility', 'relatedproperty'));

    } // End Method
}
