<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/





//Only if the user is logged in,and has access to the routes,then the below routes can be accessed
Route::group(['middleware' => ['auth','acl','location.permit']],function(){

Route::get('product',['as' => 'product.index','uses' => 'ProductController@index']);
Route::put('product',['as' => 'product.store','uses' => 'ProductController@store']);
Route::get('product/{id}/edit',['as' => 'product.edit', 'uses' => 'ProductController@edit']);
Route::post('product/{id}',['as' => 'product.update','uses' => 'ProductController@update']);
Route::get('product/{id}/delete',['as' => 'product.delete', 'uses' => 'ProductController@delete']);
Route::post('product/{id}/delete',['as' => 'product.destroy', 'uses' => 'ProductController@destroy']);


Route::get('productmodifier',['as' => 'productmodifier.index','uses' => 'ProductModifierController@index']);
Route::put('productmodifier',['as' => 'productmodifier.store','uses' => 'ProductModifierController@store']);
Route::get('productmodifier/{id}/edit',['as' => 'productmodifier.edit', 'uses' => 'ProductModifierController@edit']);
Route::post('productmodifier/{id}',['as' => 'productmodifier.update','uses' => 'ProductModifierController@update']);
Route::get('productmodifier/{id}/delete',['as' => 'productmodifier.delete', 'uses' => 'ProductModifierController@delete']);
Route::post('productmodifier/{id}/delete',['as' => 'productmodifier.destroy', 'uses' => 'ProductModifierController@destroy']);


Route::resource('productmodifiergroup','ProductModifierGroupController');
Route::get('productmodifiergroup/{id}/delete',['as' => 'productmodifiergroup.delete', 'uses' => 'ProductModifierGroupController@delete']);


Route::resource('location','LocationController');

Route::get('bill',['as'=>'bill.index','uses'=>'BillController@index']);
Route::get('bill/create',['as'=>'bill.create','uses'=>'BillController@create']);
Route::post('bill/store',['as' => 'bill.store','uses' => 'BillController@store']);
Route::post('bill/getNextBillId',['as' => 'bill.getnextbillid','uses' => 'BillController@getNextBillId']);
Route::get('bill/list',['as' => 'bill.list','uses'=> 'BillController@listBill']);
Route::get('bill/{billid}/print',['as' => 'bill.print', 'uses' => 'BillController@printBill']);
Route::post('bill/printnow',['as' => 'bill.printNow', 'uses' => 'BillController@printBillNow']);
Route::get('bill/migrate',['as' => 'bill.migrate','uses'=> 'BillController@billMigrate']);


Route::post('share/productcategory',['as' => 'share.productcategory', 'uses' => 'ShareController@getProductCategories']);
Route::post('share/product/{productcategory}',['as' => 'share.product', 'uses' => 'ShareController@getProduct']);
Route::get('share/menudata',['as' => 'share.menudata','uses' => 'ShareController@createMenuData']);

Route::get('menu',['as'=> 'menu.index','uses' => 'MenuController@index']);
Route::get('menu/create',['as'=>'menu.create','uses'=>'MenuController@create']);
Route::put('menu',['as' => 'menu.store','uses' => 'MenuController@store']);
Route::get('menu/{menuid}/edit',['as'=>'menu.edit','uses' => 'MenuController@edit']);
Route::post('menu/{menuid}',['as'=>'menu.update','uses'=>'MenuController@update']);
Route::get('menu/{menuid}',['as'=>'menu.show','uses'=>'MenuController@show']);
Route::get('menu/{menuid}/delete',['as'=>'menu.delete','uses' => 'MenuController@delete']);
Route::post('menu/{menuid}/delete',['as'=>'menu.destroy','uses' => 'MenuController@destroy']);
Route::get('menu/{menuid}/active',['as'=>'menu.activate','uses' => 'MenuController@activate']);


Route::get('location',['as'=>'location.create','uses'=>'LocationController@create']);
Route::put('location',['as'=>'location.store','uses' => 'LocationController@store']);
Route::get('location/change/{location}',['as' => 'location.change','uses' => 'LocationController@change']);

//Registration Routes under ACL
Route::get('register',['as'=>'register.create','uses'=>'Auth\AuthController@showRegistrationForm']);
Route::post('register',['as'=>'register.store','uses'=>'Auth\AuthController@register']);




});



Route::group(['middleware' => ['location.permit']],function(){
Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index');
});

Route::auth();


Route::get('logout', 'Auth\AuthController@getLogout');

