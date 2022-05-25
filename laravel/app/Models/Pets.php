<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pets extends Model
{
    use HasFactory;

    protected $table = 'pets';

    protected $fillable = [
        'id_category',
        'name',
        'status'
    ];

    public function category(){
        return $this->hasOne('App\Models\PetCategories', 'id', 'id_category');
    }

    public function tags(){
        return $this->hasMany('App\Models\PetTagsAsigned', 'id_pet', 'id');
    }

    public function photos(){
        return $this->hasMany('App\Models\PetImages', 'id_pet', 'id');
    }
}
