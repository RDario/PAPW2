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

Route::get('/{idSecc?}', 'ControllerDV@index');
Route::get('login/{id?}', 'ControllerDV@login');
Route::get('perfil/{id}', ['as' => 'perfil', 'uses' => 'ControllerDV@perfil']);
Route::get('noticia/{id}', ['as' => 'noticia', 'uses' => 'ControllerDV@detalle']);
Route::get('editar/{id}', ['as' => 'editar', 'uses' => 'ControllerDV@editarNoticia']);
Route::get('noticias/{id}/{tipo}', ['as' => 'noticias', 'uses' => 'ControllerDV@listadonoticias']);
Route::get('busqueda/{keywords}', ['as' => 'busqueda', 'uses' => 'ControllerDV@listadobusqueda']);
Route::get('busquedafecha/{fechaInicial}/{fechaFin}', ['as' => 'busquedafecha', 'uses' => 'ControllerDV@listadobusquedafecha']);
Route::post('loginsuccess/{id?}', ['as' => 'loginsuccess', 'uses' => 'ControllerDV@successLogin']);
Route::get('header', 'ControllerDV@header');
Route::get('footer', 'ControllerDV@footer');
Route::get('panel/{id?}', ['as' => 'panel', 'uses' => 'ControllerDV@panel']);
?>