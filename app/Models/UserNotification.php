<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model
{
    use HasFactory;
    public $table = "user_notification";
    protected $fillable = ['sender_id', 'user_id', 'sender_avatar', 'user_id','msg','read','extra_data'];
    protected $casts = [
        'extra_data' => 'json'
    ];

    public function data_user()
    {
        return $this->hasOne(Users::class, "id", '  sender_id');
    }
}
