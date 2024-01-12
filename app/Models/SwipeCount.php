<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SwipeCount extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'swipe_count',
    ];
}
