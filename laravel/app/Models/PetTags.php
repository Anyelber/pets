<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PetTags extends Model
{
    use HasFactory;

    protected $table = 'pet_tags';

    protected $fillable = [
        'name'
    ];
}
