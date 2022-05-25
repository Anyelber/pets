<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PetImages extends Model
{
    use HasFactory;

    protected $table = 'pet_photos';

    protected $fillable = [
        'id_pet',
        'image'
    ];

}
