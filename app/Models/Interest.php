<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Language;
class Interest extends Model
{
    use HasFactory; 
    public $table = "interests";
    public $timestamps = false;

    public function getImageAttribute($value)
    {
        return $value?env('APP_URL').'/'.$this->attributes['image']:Null;
    }
    public function getTitleAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return $this->attributes['title'];
        }
        $title=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('interest_id',$this->attributes['id'])->value('title');
        if(!$title){
            return $this->attributes['title'];
        }
        return $title;
    }
}
