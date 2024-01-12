<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Language;
class PersonalQuestion extends Model
{
    use HasFactory;
    public function getTitleAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return $this->attributes['title'];
        }
        $title=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('personal_questions_id',$this->attributes['id'])->value('title');
        if(!$title){
            return $this->attributes['title'];
        }
        return $title;
    }
    public function getQuestionAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return $this->attributes['question'];
        }
        $question=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('personal_questions_id',$this->attributes['id'])->value('question');
        if(!$question){
            return $this->attributes['question'];
        }
        return $question;
    }
    public function getImageAttribute($value)
    {
        return $value?env('APP_URL').'/'.$this->attributes['image']:Null;
    }
    public function options(){
        return $this->hasMany(Attribute::class, 'question_id','id');
    }
}
