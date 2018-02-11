<?php

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
Route::get('prueba', function() {
	return "Esto es una ruta de pueba";
});

Route::get('params/{param}', function($param) {
	return "El parametro es ".$param;
});

Route::get('/', 'ControllerDV@index');
Route::get('header', 'ControllerDV@header');
Route::get('footer', 'ControllerDV@footer');