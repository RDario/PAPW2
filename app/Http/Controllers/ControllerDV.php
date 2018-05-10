<?php

namespace ProyectoPAPW\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class ControllerDV extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        return view('portada')->with('idSec','1');
    }
    public function front() {
        return view('');
    }
    public function header() {
        return view('header');
    }
    public function footer() {
        return view('footer');
    }
    public function registro() {
        return view('registro-login');
    }
    public function panel() {
        return view('panelNoticia');
    }
    public function detalle() {
        return view('noticiaDetalle');
    }
    public function editarNoticia($id) {
        $data['id'] = $id;
        return View('editarNoticia', $data);
    }
    public function successLogin(Request $request) {
        $email = $request->txtEmail;
        $pass = $request->txtPassword;
        $user = DB::table('usuario')->where('correo', $email)->where('contrasenia', $pass)->get();
        $data = array(
            'idSec'=>'1',
            'userLog'=>$user
            );
       return view('portada')->with($data);
    }
}
