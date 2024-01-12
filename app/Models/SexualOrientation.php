<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Language;
class SexualOrientation extends Model
{
    use HasFactory;
    public function getNameAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return $this->attributes['name'];
        }
        $name=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('sexual_orientations_id',isset($this->attributes['id'])?$this->attributes['id']:'')->value('name');
        if(!$name){
            return $this->attributes['name'];
        }
        return $name;
    }
}
