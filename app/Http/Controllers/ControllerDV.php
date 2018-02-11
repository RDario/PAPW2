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
        return view('portada');
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
}
