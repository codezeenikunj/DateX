<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserSetting extends Model
{
    use HasFactory;
    protected $guarded=['id'];
    protected $casts = [
        'push_notification' => 'json',
        'email_notification'=>'json',
    ];
    public function language()
    {
        return $this->belongsTo(Language::class,'language_id','id');
    }
    
    protected $hidden = [
        'created_at',
        'update_at',
        'deleted_at',
    ];
}
