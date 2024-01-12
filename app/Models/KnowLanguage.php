<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Language;
class KnowLanguage extends Model
{
    use HasFactory;
    
    protected $fillable=['language_name'];
    
    protected $hidden = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];
     public function getLanguageNameAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return $this->attributes['language_name'];
        }
        $title=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('language_id',$this->attributes['id'])->value('language_name');
        if(!$title){
            return $this->attributes['language_name'];
        }
        return $title;
    }
}
