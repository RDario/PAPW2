<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
| DB::select('exec my_stored_procedure(?,?,..)',array($Param1,$param2));
*/
Route::get('prueba', function() {
	return "Esto es una ruta de pueba";
});

Route::get('params/{param}', function($param) {
	return "El parametro es ".$param;
});

Route::get('/', 'ControllerDV@index');
Route::get('header', 'ControllerDV@header');
Route::get('footer', 'ControllerDV@footer');
Route::get('registro', 'ControllerDV@registro');
Route::get('panel', 'ControllerDV@panel');
Route::get('detalle', 'ControllerDV@detalle');
Route::get('editar/{id}', 'ControllerDV@editarNoticia');
Route::post('login', ['as' => 'login', 'uses' => 'ControllerDV@successLogin']);
