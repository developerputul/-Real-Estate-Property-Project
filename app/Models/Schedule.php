<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    use HasFactory;

    protected $fillable = [
        'status', // Add any other fields here that you want to allow mass assignment for
    ];
    
//  protected $guraded =[];

    public function user(){
        return $this->belongsTo(User::class, 'user_id','id');
    }

    public function property(){
        return $this->belongsTo(Property::class, 'property_id','id');
    }
}
