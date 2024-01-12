<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
class User extends Authenticatable
{
    use \Staudenmeir\EloquentJsonRelations\HasJsonRelationships;
    use HasApiTokens, HasFactory, Notifiable,SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
     protected $fillable = ['first_name', 'last_name','age', 'mobile_number', 'email', 'referral_code', 'gender', 'birth_date', 'interests', 'password','identity','sexual_orientation','show_me','login_type','device_token','about','photo_option','language_know','attribute','job_title','school','city_live','i_am_looking','type_of_relation','show_distance','show_age','show_gender','show_sexual_orientation','country_code','device_token'];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    Public static function boot() {
        parent::boot();
        //while creating/inserting item into db  
        static::creating(function ($item) {
            $item->user_name = $item->first_name.rand(pow(10, 8 - 1), pow(10, 8) -1);; //assigning value
        });
    }
    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'interests'=>'array',
        'attribute'=>'array',
        'language_know'=>'array',
        'sexual_orientation'=>'array'
    ];

    public function findForPassport($identifier) {
        return $this->Where('identity', $identifier)->first();
    }
    public function images()
    {
        return $this->hasMany(Images::class, 'user_id', 'id');
    }
    public function setting()
    {
        return $this->belongsTo(UserSetting::class,'id','user_id');
    }
    public function interest()
    {
        return $this->belongsToJson(Interest::class,'interests','id');
    }
    public function languagesknow()
    {
        return $this->belongsToJson(KnowLanguage::class,'language_know','id');
    }
    public function orientation()
    {
        return $this->belongsToJson(SexualOrientation::class,'sexual_orientation','id');
    }
    public function iamlooking()
    {
        return $this->belongsTo(Looking::class,'i_am_looking','id');
    }
    public function typeofrelation()
    {
        return $this->belongsTo(TypeOfRelationship::class,'type_of_relation','id');
    }
    public function getAgeAttribute()
    {
        $birthDate = Carbon::createFromFormat('Y-m-d', $this->birth_date);
        $currentDate = Carbon::now();
        return $currentDate->diffInYears($birthDate);
    }
    public function aboute_me()
    {
        return $this->belongsToJson(Attribute::class,'attribute','id')->select('attributes.id as attr_id','personal_questions.*')->join('personal_questions','attributes.question_id','personal_questions.id')->where('type','about_me')->with('attribute');
    }
     public function lifestyle()
    {
        return $this->belongsToJson(Attribute::class,'attribute','id')->select('attributes.id as attr_id','personal_questions.*')->join('personal_questions','attributes.question_id','personal_questions.id')->where('type','lifestyle')->distinct('attr_id')/*->with('attribute')*/;
    }
    public function getDistanceAttribute($data)
    {
        $user=Auth()->user();
        if(isset($user->setting->latitude) && $user->setting->longitude && $this->attributes['latitude'] && $this->attributes['longitude']){
            $lat1=$user->setting->latitude;
            $lon1=$user->setting->longitude;
            $lat2=$this->attributes['latitude'];
            $lon2=$this->attributes['longitude'];
            $unit='K';
            $theta = $lon1 - $lon2; 
            $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta)); 
            $dist = acos($dist); 
            $dist = rad2deg($dist); 
            $miles = $dist * 60 * 1.1515;
            $unit = strtoupper($unit);
            if ($unit == "K") 
            {
                return number_format(($miles * 1.609344),2); 
            } 
            else if ($unit == "N") 
            {
                return ($miles * 0.8684);
            } 
            else 
            {
                return $miles;
            }
        }
        return "0.00";
    }
}
