<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
class Plan extends Model
{
    use HasFactory;
    protected $guarded=['id'];
    protected $casts = [
        'metadata' => 'array',
    ];
    public function getNameAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return $this->attributes['name'];
        }
        $name=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('plan_id',$this->attributes['id'])->value('name');
        if(!$name){
            return $this->attributes['name'];
        }
        return $name;
    }
    public function getDescriptionAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return $this->attributes['description'];
        }
        $description=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('plan_id',$this->attributes['id'])->value('name');
        if(!$description){
            return $this->attributes['description'];
        }
        return $description;
    }
     public function getMetadataAttribute(){
        $lang=Language::where('short_code',request()->header('lang'))->value('is_default');
        if($lang==1){
            return json_decode($this->attributes['metadata']);
        }
        $metadata=DB::table($this->table.'_translations')->where('lang_code',request()->header('lang'))->where('plan_id',$this->attributes['id'])->value('metadata');
        if(!$metadata){
            return json_decode($this->attributes['metadata']);
        }
        return explode(',',$metadata);
    }
}
