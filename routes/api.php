<?php

use App\Http\Controllers\DiamondPackController;
use App\Http\Controllers\InterestController;
use App\Http\Controllers\LiveApplicationController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\RedeemRequestsController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\LikeController;
use App\Models\DiamondPacks;
use App\Models\LiveApplications;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
/*------------------ New -----------------------*/
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\GeneralController;
/*------------------ End New --------------------*/
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|



/*|--------------------------------------------------------------------------|
  | Users Route                                                              |
  |--------------------------------------------------------------------------|*/
Route::post('translate', [GeneralController::class,'translate']);
Route::post('generate_otp', [GeneralController::class,'generate_otp']);
Route::post('account_recovery', [GeneralController::class,'account_recovery']);
Route::get('get_sexual_orientation', [GeneralController::class,'get_sexual_orientation']);
Route::get('get_lookings', [GeneralController::class,'get_lookings']);
Route::get('get_type_of_relationships', [GeneralController::class,'get_type_of_relationships']);
Route::get('get_question_list/{type?}', [GeneralController::class,'get_question_list']);
Route::get('get_options/{id?}', [GeneralController::class,'get_options']);
Route::get('get_interest', [GeneralController::class,'get_interest']);
Route::get('get_language', [GeneralController::class,'get_language']);
Route::get('get_language_know', [GeneralController::class,'get_language_know']);
Route::get('get_plans', [GeneralController::class,'get_plans']);
Route::post('login', [UserController::class,'login']);
Route::post('register', [UserController::class,'register']);
Route::post('new_token', [UserController::class,'new_token']);
Route::post('social_login', [UserController::class,'social_login']);
Route::post('verify_otp', [UserController::class,'verify_otp']);
Route::post('upload_file', [GeneralController::class,'upload_file']);
Route::middleware('auth:api')->group(function () {
    Route::match(['get','post','delete'],'profile_image/{id?}', [UserController::class,'profile_image']);
    Route::match(['get','post'],'profile', [UserController::class,'profile']);
    Route::match(['get','post'],'setting', [UserController::class,'setting']);
    Route::get('user_profile/{id?}', [UserController::class,'user_profile']);
    Route::get('get_top_pics', [UserController::class,'get_top_pics']);
    Route::post('change_mobile_no', [UserController::class,'change_mobile_no']);
    Route::post('change_email', [UserController::class,'change_email']);
    Route::post('change_username', [UserController::class,'change_username']);
  	Route::post('get_random', [UserController::class,'get_random']);
    Route::get('get_likes', [UserController::class,'get_likes']);
    Route::post('like_dislike', [UserController::class,'like_dislike']);
    Route::post('boost', [UserController::class,'boost']);
    Route::get('get_notification', [UserController::class,'get_notification']);
    Route::post('subscribe', [UserController::class,'subscribe']);
    Route::get('plan_info', [UserController::class,'plan_info']);
    Route::get('get_match', [UserController::class,'get_match']);
    Route::post('logout', [UserController::class,'logout']);
    Route::post('delete_account',[UserController::class,'delete_account']);
    Route::post('block_unblock',[UserController::class,'block_unblock']);
    Route::post('report',[UserController::class,'report']);
});

Route::get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/unauthenticated', function () {
    return response()->json(['message' => 'Unauthenticated.'], 403);
});

// // Route::post('register', [UsersController::class, 'addUserDetails'])->middleware('checkHeader');
// Route::post('updateProfile', [UsersController::class, 'updateProfile'])->middleware('checkHeader');
// Route::post('deleteUser', [UsersController::class, 'deleteUser'])->middleware('checkHeader');
// Route::post('fetchUsersByCordinates', [UsersController::class, 'fetchUsersByCordinates'])->middleware('checkHeader');
// Route::post('updateUserBlockList', [UsersController::class, 'updateUserBlockList'])->middleware('checkHeader');
// Route::post('deleteMyAccount', [UsersController::class, 'deleteMyAccount'])->middleware('checkHeader');

// Route::post('getProfile', [UsersController::class, 'getProfile'])->middleware('checkHeader');
// Route::post('getUserDetails', [UsersController::class, 'getUserDetails'])->middleware('checkHeader');
// Route::post('getRandomProfile', [UsersController::class, 'getRandomProfile'])->middleware('checkHeader');
// Route::post('getExplorePageProfileList', [UsersController::class, 'getExplorePageProfileList'])->middleware('checkHeader');

// Route::post('swipe_counts', [UsersController::class, 'swipe_counts'])->middleware('checkHeader');

// Route::post('increase_swipe_count', [UsersController::class, 'increase_swipe_count'])->middleware('checkHeader');

// Route::post('updateSavedProfile', [UsersController::class, 'updateSavedProfile'])->middleware('checkHeader');
// Route::post('updateLikedProfile', [UsersController::class, 'updateLikedProfile'])->middleware('checkHeader');
// Route::post('notifyLikedUser', [NotificationController::class, 'notifyLikedUser'])->middleware('checkHeader');

// Route::post('getPackage', [PackageController::class, 'getPackage'])->middleware('checkHeader');
// Route::post('getInterests', [InterestController::class, 'getInterests'])->middleware('checkHeader');
// Route::post('addReport', [ReportController::class, 'addReport'])->middleware('checkHeader');
// Route::post('getSettingData', [SettingController::class, 'getSettingData'])->middleware('checkHeader');

// Route::post('searchUsers', [UsersController::class, 'searchUsers'])->middleware('checkHeader');
// Route::post('searchUsersForInterest', [UsersController::class, 'searchUsersForInterest'])->middleware('checkHeader');

// Route::post('getUserNotifications', [NotificationController::class, 'getUserNotifications'])->middleware('checkHeader');

// Route::get('get_notificationcount', [NotificationController::class, 'get_notificationcount'])->middleware('checkHeader');

// Route::post('getAdminNotifications', [NotificationController::class, 'getAdminNotifications'])->middleware('checkHeader');

// Route::post('getDiamondPacks', [DiamondPackController::class, 'getDiamondPacks'])->middleware('checkHeader');

// Route::post('onOffNotification', [UsersController::class, 'onOffNotification'])->middleware('checkHeader');
// Route::post('updateLiveStatus', [UsersController::class, 'updateLiveStatus'])->middleware('checkHeader');
// Route::post('onOffShowMeOnMap', [UsersController::class, 'onOffShowMeOnMap'])->middleware('checkHeader');
// Route::post('onOffAnonymous', [UsersController::class, 'onOffAnonymous'])->middleware('checkHeader');
// Route::post('onOffVideoCalls', [UsersController::class, 'onOffVideoCalls'])->middleware('checkHeader');
// Route::post('fetchSavedProfiles', [UsersController::class, 'fetchSavedProfiles'])->middleware('checkHeader');

// Route::post('applyForLive', [LiveApplicationController::class, 'applyForLive'])->middleware('checkHeader');
// Route::post('applyForVerification', [UsersController::class, 'applyForVerification'])->middleware('checkHeader');

// Route::post('addCoinsToWallet', [UsersController::class, 'addCoinsToWallet'])->middleware('checkHeader');
// Route::post('minusCoinsFromWallet', [UsersController::class, 'minusCoinsFromWallet'])->middleware('checkHeader');
// Route::post('increaseStreamCountOfUser', [UsersController::class, 'increaseStreamCountOfUser'])->middleware('checkHeader');

// Route::post('addLiveStreamHistory', [LiveApplicationController::class, 'addLiveStreamHistory'])->middleware('checkHeader');
// Route::post('logOutUser', [UsersController::class, 'logOutUser'])->middleware('checkHeader');
// Route::post('fetchAllLiveStreamHistory', [LiveApplicationController::class, 'fetchAllLiveStreamHistory'])->middleware('checkHeader');

// Route::post('placeRedeemRequest', [RedeemRequestsController::class, 'placeRedeemRequest'])->middleware('checkHeader');
// Route::post('fetchMyRedeemRequests', [RedeemRequestsController::class, 'fetchMyRedeemRequests'])->middleware('checkHeader');
// Route::post('storeFileGivePath', [SettingController::class, 'storeFileGivePath'])->middleware('checkHeader');
// Route::post('like_dislike', [LikeController::class, 'like_dislike'])->middleware('checkHeader');
// Route::post('super_like_dislike', [LikeController::class, 'super_like_dislike'])->middleware('checkHeader');
// Route::post('diamond_event', [UsersController::class, 'diamond_event'])->middleware('checkHeader');




// Route::get('test', [UsersController::class, 'test'])->middleware('checkHeader');
