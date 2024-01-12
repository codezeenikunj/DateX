<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Str;
class Users extends Model
{
    use HasFactory,SoftDeletes;

    public $table = "users";
    public $timestamps = false;
    protected $casts = [
        'birth_date' => 'date:d/m/Y',
    ];
    public static function boot() {
        parent::boot();
        static::creating(function ($user) {
            $rand=Str::random(6);
            $referral_code = \Str::slug(substr($user->f_name,0,5));
            $count = static::where("referral_code",$referral_code.$rand)->count();
            $user->referral_code = strtoupper($count?$referral_code.($rand+$count):$referral_code.$rand);
        });
    }
    public function images()
    {
        return $this->hasMany(Images::class, 'user_id', 'id');
    }
    
    public function notifications()
    {
        return $this->hasMany(UserNotification::class, 'user_id', 'id');
    }

    function liveApplications()
    {
        return $this->hasOne(LiveApplications::class, 'user_id', 'id');
    }
    function verifyRequest()
    {
        return $this->hasOne(VerifyRequest::class, 'user_id', 'id');
    }

    function liveHistory()
    {
        return $this->hasMany(LiveHistory::class, 'user_id', 'id');
    }
    function redeemRequests()
    {
        return $this->hasMany(RedeemRequest::class, 'user_id', 'id');
    }
}
