<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Tzsk\Otp\Facades\Otp;
class CheckOtp implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($mobile_number)
    {
        $this->mobile_number=$mobile_number;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $data=Otp::digits(6)->expiry(10)->check($value,md5($this->mobile_number.env('APP_KEY')));
        if($data){
            return true;
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'The :attribute invalid Or expire.';
    }
}