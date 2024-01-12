<?php

use App\Http\Controllers\DiamondPackController;
use App\Http\Controllers\InterestController;
use App\Http\Controllers\LiveApplicationController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\RedeemRequestsController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RelationshipTypeController;
use App\Http\Controllers\SexualOrientationController;
use App\Http\Controllers\LookingController;
use App\Http\Controllers\PersonalQuestionController;
use App\Http\Controllers\AttributeController;
use App\Http\Controllers\KnowLanguageController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [LoginController::class, 'login']);
Route::match(['get','post'],'index', [LoginController::class, 'index'])->middleware(['checkLogin'])->name('index');


Route::post('login', [LoginController::class, 'checklogin'])->name('login');
Route::post('updateProflie', [LoginController::class, 'updateProflie'])->middleware(['checkLogin'])->name('updateProflie');

Route::get('logout', [LoginController::class, 'logout'])->middleware(['checkLogin'])->name('logout');


/*|--------------------------------------------------------------------------|
  | users  Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::view('users', 'users')->middleware(['checkLogin'])->name('users');
Route::view('addUser', 'addFakeUser')->middleware(['checkLogin'])->name('addFakeUser');
Route::get('verify_email/{token}', [UsersController::class, 'verify_email'])->name('verify_email');
Route::post('fetchAllUsers', [UsersController::class, 'fetchAllUsers'])->middleware(['checkLogin'])->name('fetchAllUsers');
Route::post('updateUser', [UsersController::class, 'updateUser'])->middleware(['checkLogin'])->name('updateUser');
Route::post('addUserImage', [UsersController::class, 'addUserImage'])->middleware(['checkLogin'])->name('addUserImage');
Route::post('addFakeUserFromAdmin', [UsersController::class, 'addFakeUserFromAdmin'])->middleware(['checkLogin'])->name('addFakeUserFromAdmin');
Route::post('fetchStreamerUsers', [UsersController::class, 'fetchStreamerUsers'])->middleware(['checkLogin'])->name('fetchStreamerUsers');
Route::post('fetchFakeUsers', [UsersController::class, 'fetchFakeUsers'])->middleware(['checkLogin'])->name('fetchFakeUsers');

Route::get('blockUser/{id}', [UsersController::class, 'blockUser'])->middleware(['checkLogin'])->name('blockUser');
Route::get('deleteUserImage/{id}', [UsersController::class, 'deleteUserImage'])->middleware(['checkLogin'])->name('deleteUserImage');
Route::get('unblockUser/{id}', [UsersController::class, 'unblockUser'])->middleware(['checkLogin'])->name('unblockUser');
Route::get('viewUserDetails/{id}', [UsersController::class, 'viewUserDetails'])->middleware(['checkLogin'])->name('viewUserDetails');
Route::get('allowLiveToUser/{id}', [UsersController::class, 'allowLiveToUser'])->middleware(['checkLogin'])->name('allowLiveToUser');
Route::get('restrictLiveToUser/{id}', [UsersController::class, 'restrictLiveToUser'])->middleware(['checkLogin'])->name('restrictLiveToUser');

/*|--------------------------------------------------------------------------|
  | package  Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::view('package', 'package')->name('package')->middleware(['checkLogin']);
Route::post('fetchAllPackage', [PackageController::class, 'fetchAllPackage'])->middleware(['checkLogin'])->name('fetchAllPackage');
Route::post('addPackage', [PackageController::class, 'addPackage'])->middleware(['checkLogin'])->name('addPackage');
Route::post('updatePackage', [PackageController::class, 'updatePackage'])->middleware(['checkLogin'])->name('updatePackage');
Route::get('getPackageById/{id}', [PackageController::class, 'getPackageById'])->middleware(['checkLogin'])->name('getPackageById');
Route::get('deletePackage/{id}', [PackageController::class, 'deletePackage'])->middleware(['checkLogin'])->name('deletePackage');



/*|--------------------------------------------------------------------------|
  | Interests Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::get('interest', [InterestController::class, 'index'])->middleware(['checkLogin'])->name('interest');
Route::get('getInterest', [InterestController::class, 'getInterest'])->middleware(['checkLogin'])->name('getInterest');


Route::get('deleteInterest/{cat_id}', [InterestController::class, 'deleteInterest'])->name('deleteInterest')->middleware(['checkLogin']);


Route::post('fetchAllInterest', [InterestController::class, 'fetchAllInterest'])->middleware(['checkLogin'])->name('fetchAllInterest');
Route::post('updateInterest', [InterestController::class, 'updateInterest'])->middleware(['checkLogin'])->name('updateInterest');
Route::post('addInterest', [InterestController::class, 'addInterest'])->middleware(['checkLogin'])->name('addInterest');

/*|--------------------------------------------------------------------------|
  | Personal Questions Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::get('personal_question', [PersonalQuestionController::class, 'index'])->middleware(['checkLogin'])->name('personal_question');
Route::get('getpersonal_question', [PersonalQuestionController::class, 'getpersonal_question'])->middleware(['checkLogin'])->name('getpersonal_question');


Route::get('deletepersonal_question/{cat_id}', [PersonalQuestionController::class, 'deletepersonal_question'])->name('deletepersonal_question')->middleware(['checkLogin']);


Route::post('fetchAllpersonal_question', [PersonalQuestionController::class, 'fetchAllpersonal_question'])->middleware(['checkLogin'])->name('fetchAllpersonal_question');
Route::post('updatepersonal_question', [PersonalQuestionController::class, 'updatepersonal_question'])->middleware(['checkLogin'])->name('updatepersonal_question');
Route::post('addpersonal_question', [PersonalQuestionController::class, 'addpersonal_question'])->middleware(['checkLogin'])->name('addpersonal_question');

/*|--------------------------------------------------------------------------|
  | Relationship Type Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::get('relationship_type', [RelationshipTypeController::class, 'index'])->middleware(['checkLogin'])->name('relationship_type');
Route::get('getrelationship_type', [RelationshipTypeController::class, 'getrelationship_type'])->middleware(['checkLogin'])->name('getrelationship_type');


Route::get('deleterelationship_type/{cat_id}', [RelationshipTypeController::class, 'deleterelationship_type'])->name('deleterelationship_type')->middleware(['checkLogin']);


Route::post('fetchAllrelationship_type', [RelationshipTypeController::class, 'fetchAllrelationship_type'])->middleware(['checkLogin'])->name('fetchAllrelationship_type');
Route::post('updaterelationship_type', [RelationshipTypeController::class, 'updaterelationship_type'])->middleware(['checkLogin'])->name('updaterelationship_type');
Route::post('addrelationship_type', [RelationshipTypeController::class, 'addrelationship_type'])->middleware(['checkLogin'])->name('addrelationship_type');

/*|--------------------------------------------------------------------------|
  | Sexual Orientation Route                                                           |
  |--------------------------------------------------------------------------|*/


Route::get('sexual_orientation', [SexualOrientationController::class, 'index'])->middleware(['checkLogin'])->name('sexual_orientation');
Route::get('getsexual_orientation', [SexualOrientationController::class, 'getsexual_orientation'])->middleware(['checkLogin'])->name('getsexual_orientation');


Route::get('deletesexual_orientation/{cat_id}', [SexualOrientationController::class, 'deletesexual_orientation'])->name('deletesexual_orientation')->middleware(['checkLogin']);


Route::post('fetchAllsexual_orientation', [SexualOrientationController::class, 'fetchAllsexual_orientation'])->middleware(['checkLogin'])->name('fetchAllsexual_orientation');
Route::post('updatesexual_orientation', [SexualOrientationController::class, 'updatesexual_orientation'])->middleware(['checkLogin'])->name('updatesexual_orientation');
Route::post('addsexual_orientation', [SexualOrientationController::class, 'addsexual_orientation'])->middleware(['checkLogin'])->name('addsexual_orientation');

/*|--------------------------------------------------------------------------|
  | Know Language Type Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::get('know_languages', [KnowLanguageController::class, 'index'])->middleware(['checkLogin'])->name('know_languages');
Route::get('getknow_languages', [KnowLanguageController::class, 'getknow_languages'])->middleware(['checkLogin'])->name('getknow_languages');


Route::get('deleteknow_languages/{cat_id}', [KnowLanguageController::class, 'deleteknow_languages'])->name('deleteknow_languages')->middleware(['checkLogin']);


Route::post('fetchAllknow_languages', [KnowLanguageController::class, 'fetchAllknow_languages'])->middleware(['checkLogin'])->name('fetchAllknow_languages');
Route::post('updateknow_languages', [KnowLanguageController::class, 'updateknow_languages'])->middleware(['checkLogin'])->name('updateknow_languages');
Route::post('addknow_languages', [KnowLanguageController::class, 'addknow_languages'])->middleware(['checkLogin'])->name('addknow_languages');

/*|--------------------------------------------------------------------------|
  | Looking Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::get('looking', [LookingController::class, 'index'])->middleware(['checkLogin'])->name('looking');
Route::get('getlooking', [LookingController::class, 'getlooking'])->middleware(['checkLogin'])->name('getlooking');
Route::get('deletelooking/{cat_id}', [LookingController::class, 'deletelooking'])->name('deletelooking')->middleware(['checkLogin']);
Route::post('fetchAlllooking', [LookingController::class, 'fetchAlllooking'])->middleware(['checkLogin'])->name('fetchAlllooking');
Route::post('updatelooking', [LookingController::class, 'updatelooking'])->middleware(['checkLogin'])->name('updatelooking');
Route::post('addlooking', [LookingController::class, 'addlooking'])->middleware(['checkLogin'])->name('addlooking');

/*|--------------------------------------------------------------------------|
  | Options or Attribute Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::get('options/{per_q?}', [AttributeController::class, 'index'])->middleware(['checkLogin'])->name('options');
Route::get('getoptions', [AttributeController::class, 'getoptions'])->middleware(['checkLogin'])->name('getoptions');
Route::get('deleteoptions/{cat_id}', [AttributeController::class, 'deleteoptions'])->name('deleteoptions')->middleware(['checkLogin']);
Route::post('fetchAlloptions', [AttributeController::class, 'fetchAlloptions'])->middleware(['checkLogin'])->name('fetchAlllooking');
Route::post('updateoptions', [AttributeController::class, 'updateoptions'])->middleware(['checkLogin'])->name('updateoptions');
Route::post('addoptions', [AttributeController::class, 'addoptions'])->middleware(['checkLogin'])->name('addoptions');

/*|--------------------------------------------------------------------------|
  | Report  Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::view('report', 'report')->name('report')->middleware(['checkLogin']);
Route::post('fetchAllReport', [ReportController::class, 'fetchAllReport'])->middleware(['checkLogin'])->name('fetchAllReport');

/*|--------------------------------------------------------------------------|
  | Notification  Route
  |--------------------------------------------------------------------------|*/
Route::get('notifications', [NotificationController::class, 'notifications'])->name('notifications')->middleware(['checkLogin']);
Route::post('fetchAllNotification', [NotificationController::class, 'fetchAllNotification'])->name('fetchAllNotification')->middleware(['checkLogin']);
Route::post('addNotification', [NotificationController::class, 'addNotification'])->name('addNotification')->middleware(['checkLogin']);
Route::post('updateNotification', [NotificationController::class, 'updateNotification'])->name('updateNotification')->middleware(['checkLogin']);
Route::get('deleteNotification/{id}', [NotificationController::class, 'deleteNotification'])->middleware(['checkLogin'])->name('deleteNotification');
Route::get('getNotificationById/{id}', [NotificationController::class, 'getNotificationById'])->middleware(['checkLogin'])->name('getNotificationById');



/*|--------------------------------------------------------------------------|
  | setting  Route                                                           |
  |--------------------------------------------------------------------------|*/

Route::get('setting', [SettingController::class, 'setting'])->name('setting')->middleware(['checkLogin']);
Route::post('updateAdmob', [SettingController::class, 'updateAdmob'])->middleware(['checkLogin'])->name('updateAdmob');
Route::post('updateOther', [SettingController::class, 'updateOther'])->middleware(['checkLogin'])->name('updateOther');
Route::post('updateAppdata', [SettingController::class, 'updateAppdata'])->middleware(['checkLogin'])->name('updateAppdata');

Route::post('change_language', [SettingController::class, 'change_language'])->middleware(['checkLogin'])->name('change_language');

/*|--------------------------------------------------------------------------|
  | Diamond Pack  Route
  |--------------------------------------------------------------------------|*/

Route::get('diamondpacks', [DiamondPackController::class, 'diamondpacks'])->name('diamondpacks')->middleware(['checkLogin']);
Route::post('fetchDiamondPackages', [DiamondPackController::class, 'fetchDiamondPackages'])->name('fetchDiamondPackages')->middleware(['checkLogin']);
Route::post('addDiamondPack', [DiamondPackController::class, 'addDiamondPack'])->name('addDiamondPack')->middleware(['checkLogin']);
Route::post('updateDiamondPack', [DiamondPackController::class, 'updateDiamondPack'])->name('updateDiamondPack')->middleware(['checkLogin']);
Route::get('getDiamondPackById/{id}', [DiamondPackController::class, 'getDiamondPackById'])->name('getDiamondPackById')->middleware(['checkLogin']);
Route::get('deleteDiamondPack/{id}', [DiamondPackController::class, 'deleteDiamondPack'])->name('deleteDiamondPack')->middleware(['checkLogin']);

/*|--------------------------------------------------------------------------|
| Gift  Route
|--------------------------------------------------------------------------|*/
Route::get('subscription', [SettingController::class, 'gifts'])->name('subscription')->middleware(['checkLogin']);

Route::post('getallsubscriptions', [DiamondPackController::class, 'getallsubscriptions'])->name('getallsubscriptions')->middleware(['checkLogin']);

Route::get('gifts', [SettingController::class, 'gifts'])->name('gifts')->middleware(['checkLogin']);
Route::post('fetchAllGifts', [SettingController::class, 'fetchAllGifts'])->name('fetchAllGifts')->middleware(['checkLogin']);
Route::get('deleteGift/{id}', [SettingController::class, 'deleteGift'])->name('deleteGift')->middleware(['checkLogin']);
Route::post('addGift', [SettingController::class, 'addGift'])->name('addGift')->middleware(['checkLogin']);
Route::post('updateGift', [SettingController::class, 'updateGift'])->name('updateGift')->middleware(['checkLogin']);


/*|--------------------------------------------------------------------------|
  | Livestream Application  Route
  |--------------------------------------------------------------------------|*/
Route::get('liveapplication', [LiveApplicationController::class, 'liveapplication'])->name('liveapplication')->middleware(['checkLogin']);
Route::post('fetchLiveApplications', [LiveApplicationController::class, 'fetchLiveApplications'])->name('fetchLiveApplications')->middleware(['checkLogin']);
Route::post('fetchLiveHistory', [LiveApplicationController::class, 'fetchLiveHistory'])->name('fetchLiveHistory')->middleware(['checkLogin']);
Route::get('deleteLiveApplication/{id}', [LiveApplicationController::class, 'deleteLiveApplication'])->name('deleteLiveApplication')->middleware(['checkLogin']);
Route::get('approveApplication/{id}', [LiveApplicationController::class, 'approveApplication'])->name('approveApplication')->middleware(['checkLogin']);
Route::get('viewLiveApplication/{id}', [LiveApplicationController::class, 'viewLiveApplication'])->name('viewLiveApplication')->middleware(['checkLogin']);
Route::get('livehistory', [LiveApplicationController::class, 'livehistory'])->name('livehistory')->middleware(['checkLogin']);

/*|--------------------------------------------------------------------------|
  | Redeem Requests Features Route
  |--------------------------------------------------------------------------|*/
Route::get('redeemrequests', [RedeemRequestsController::class, 'redeemrequests'])->name('redeemrequests')->middleware(['checkLogin']);
Route::post('fetchPendingRedeems', [RedeemRequestsController::class, 'fetchPendingRedeems'])->name('fetchPendingRedeems')->middleware(['checkLogin']);
Route::post('fetchCompletedRedeems', [RedeemRequestsController::class, 'fetchCompletedRedeems'])->name('fetchCompletedRedeems')->middleware(['checkLogin']);
Route::post('completeRedeem', [RedeemRequestsController::class, 'completeRedeem'])->name('completeRedeem')->middleware(['checkLogin']);
Route::get('deleteRedeemRequest/{id}', [RedeemRequestsController::class, 'deleteRedeemRequest'])->name('deleteRedeemRequest')->middleware(['checkLogin']);
Route::get('getRedeemById/{id}', [RedeemRequestsController::class, 'getRedeemById'])->name('getRedeemById')->middleware(['checkLogin']);

/*|--------------------------------------------------------------------------|
| Verification Requests 
|--------------------------------------------------------------------------|*/
Route::get('verificationrequests', [UsersController::class, 'verificationrequests'])->name('verificationrequests')->middleware(['checkLogin']);
Route::post('fetchverificationRequests', [UsersController::class, 'fetchverificationRequests'])->name('fetchverificationRequests')->middleware(['checkLogin']);
Route::get('rejectVerificationRequest/{id}', [UsersController::class, 'rejectVerificationRequest'])->middleware(['checkLogin'])->name('rejectVerificationRequest');
Route::get('approveVerificationRequest/{id}', [UsersController::class, 'approveVerificationRequest'])->middleware(['checkLogin'])->name('approveVerificationRequest');

// Pages Routes
Route::get('viewPrivacy', [PagesController::class, 'viewPrivacy'])->middleware(['checkLogin'])->name('viewPrivacy');
Route::post('updatePrivacy', [PagesController::class, 'updatePrivacy'])->middleware(['checkLogin'])->name('updatePrivacy');
Route::get('viewTerms', [PagesController::class, 'viewTerms'])->middleware(['checkLogin'])->name('viewTerms');
Route::post('updateTerms', [PagesController::class, 'updateTerms'])->middleware(['checkLogin'])->name('updateTerms');
Route::get('privacypolicy', [PagesController::class, 'privacypolicy'])->name('privacypolicy');
Route::get('termsOfUse', [PagesController::class, 'termsOfUse'])->name('termsOfUse');
Route::get('get_profile_image/{id}', [UsersController::class, 'get_profile_image']);

Route::get('/unauthorised',function(){
    return response()->json(["success"=>false,'message' => 'Unauthenticated.','data'=>[]], 401);
})->name('unauthorised');