<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    use HasFactory;
    protected $fillable=['user_id','user_by','reason'];
    function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
    function report_by()
    {
        return $this->belongsTo(User::class, 'user_by', 'id');
    }

}
