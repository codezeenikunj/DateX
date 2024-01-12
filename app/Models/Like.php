<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
class Like extends Model
{
    use HasFactory,SoftDeletes;
    protected $fillable = ['rateable_id','user_id','like_type','value','not_read'];

    public function images()
    {
        return $this->hasMany(Images::class, 'user_id', 'user_id');
    }
    public function getAgeAttribute()
    {
        $birthDate = Carbon::createFromFormat('Y-m-d', $this->birth_date);
        $currentDate = Carbon::now();
        return $currentDate->diffInYears($birthDate);
    }

}
