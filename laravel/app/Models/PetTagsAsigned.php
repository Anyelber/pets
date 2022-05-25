<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PetTagsAsigned extends Model
{
    use HasFactory;

    protected $table = 'pet_tags_asigned';

    protected $fillable = [
        'id_pet',
        'id_tag'
    ];
}
