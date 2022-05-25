<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PetCategories extends Model
{
    use HasFactory;

    protected $table = 'pet_categories';

    protected $fillable = [
        'name'
    ];
}
