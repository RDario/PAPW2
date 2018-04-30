<?php

namespace ProyectoPAPW\Http\Controllers;

use Illuminate\Http\Request;

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
}
