<?php

namespace ProyectoPAPW\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use View;

class ControllerDV extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function perfil(){
        return view('perfil');
    }
    public function listadonoticias(Request $request){
        $secciones = DB::table('allseccionesconnoticias')->get();
        $noticias = DB::table('ultimasnoticiasnovalidadas')->get();
        $arrayseccs = array();
        $arraynotis = array();

        foreach ($noticias as $noti){
            array_push($arraynotis, $noti);
        }
        foreach ($secciones as $secc){
            array_push($arrayseccs, $secc);
        }
        $dataToSend = array('dataNoti'=>$arraynotis, 'dataSeccs'=>$arrayseccs,'dataId'=>$request->id,'dataTipo'=>$request->tipo);
        return view('listadoNoticias', $dataToSend);
    }
    public function listadobusqueda(Request $request){
        $secciones = DB::table('allseccionesconnoticias')->get();
        $noticias = DB::select('CALL busquedaNoticias(?)', array($request->keywords));
        $arrayseccs = array();
        $arraynotis = array();

        foreach ($noticias as $noti){
            array_push($arraynotis, $noti);
        }
        foreach ($secciones as $secc){
            array_push($arrayseccs, $secc);
        }
        $dataToSend = array('dataNoti'=>$arraynotis, 'dataSeccs'=>$arrayseccs, 'dataKeywords'=>$request->keywords);
        return view('listadoBusqueda')->with($dataToSend);
    }

    public function listadobusquedafecha(Request $request){
        $secciones = DB::table('allseccionesconnoticias')->get();
        $noticias = DB::select('CALL busquedaNoticiasPorFecha(?,?)', array($request->fechaInicial, $request->fechaFin));
        $arrayseccs = array();
        $arraynotis = array();

        foreach ($noticias as $noti){
            array_push($arraynotis, $noti);
        }
        foreach ($secciones as $secc){
            array_push($arrayseccs, $secc);
        }

        $dataToSend = array('dataNoti'=>$arraynotis, 'dataSeccs'=>$arrayseccs, 'fechaFrom'=>$request->fechaInicial, 'fechaTo'=>$request->fechaFin);
        return view('listadoBusquedaFecha')->with($dataToSend);
    }
    public function index(Request $request){
        DB::enableQueryLog();
        $secciones = DB::table('allseccionesconnoticias')->get();
        $arrayseccs = array();
        $arraynotis = array();

        if ($request->idSecc != null && $request->idSecc != ''){
            if ($request->idSecc == 'notCom'){
                $noticias = DB::select('CALL obtenerNoticiasConMasComens')->get();

            } else if($request->idSecc == 'notLik'){
                $noticias = DB::select('CALL obtenerNoticiasConMasLikes')->get();
                
            } else {
               $noticias = DB::select('CALL obtenerNoticiasBySeccion(?)', array($request->idSecc));
           }
       } else {
        $noticias = DB::table('newultimasnoticiasvalidadas')->get();
    }
    foreach ($noticias as $noti) {
        array_push($arraynotis, $noti);
    }
    foreach ($secciones as $secc) {
        array_push($arrayseccs, $secc);
    }
    return view('portada')->with('dataNotis',$arraynotis)->with('dataSeccs', $arrayseccs);
}
public function front(){
    return view('');
}
public function header(){
    return view('header');
}
public function footer(){
    return view('footer');
}
public function panel(){
    $secciones = DB::table('allsecciones')->get();
    $arrayseccs = array();
    foreach ($secciones as $secc) {
        array_push($arrayseccs, $secc);
    }
    $dataToSend = array('dataSeccs'=>$arrayseccs);
    return view('panelNoticia', $dataToSend);
}
public function login(Request $request){
    return view('registrologin');
}
public function detalle(Request $request){
    $secciones = DB::table('allseccionesconnoticias')->get();
    $arrayseccs = array();

    if ($request->id != null){
       $arraynoti = array();
       $arraycomentarios = array();
       $arraymultis = array();
       $arraylikes = array();
       $noticia = DB::select('CALL obtenerNoticiaCompletaById(?)', array($request->id));
       $comentarios = DB::select('CALL obtenerComentarios(?)', array($request->id));
       $multmedias = DB::select('CALL obtenerMultimediaById(?)', array($request->id));
       $likes = DB::select('CALL obtenerLikesByNoti(?)', array($request->id));

       foreach ($noticia as $noti) {
        array_push($arraynoti, $noti);
    }
    foreach ($comentarios as $coment) {
        array_push($arraycomentarios, $coment);
    }
    foreach ($secciones as $secc) {
        array_push($arrayseccs, $secc);
    }
    foreach ($multmedias as $multi) {
        array_push($arraymultis, $multi);
    }
    foreach ($likes as $like) {
        array_push($arraylikes, $like);
    }
    $dataToSend = array('dataNoti'=>$arraynoti, 'dataComents'=>$arraycomentarios, 'dataSeccs'=>$arrayseccs, 'dataLikes'=>$arraylikes, 'dataMulti'=>$arraymultis);
    return view('noticiaDetalle')->with($dataToSend);
}
}
public function editarNoticia(Request $request){
    $secciones = DB::table('allsecciones')->get();
    $arrayseccs = array();
    $arraynoti = array();
    $arraymultis = array();
    $noticia = DB::select('CALL obtenerNoticiaCompletaById(?)', array($request->id));
    $multmedias = DB::select('CALL obtenerMultimediaById(?)', array($request->id));

    foreach ($noticia as $noti){
        array_push($arraynoti, $noti);
    }
    foreach ($secciones as $secc){
        array_push($arrayseccs, $secc);
    }
    foreach ($multmedias as $multi){
        array_push($arraymultis, $multi);
    }
    $dataToSend = array('dataNoti'=>$arraynoti, 'dataSeccs'=>$arrayseccs, 'dataMulti'=>$arraymultis,'dataId'=>$request->id);
    return View('editarNoticia', $dataToSend);
}
public function successLogin(Request $request){
    $email = $request->txtEmail;
    $pass = $request->txtPassword;
    $user = DB::table('usuario')->where('correo', $email)->where('contrasenia', $pass)->get();
    $loguser = array(
        'idSec'=>'1',
        'userLog'=>$user
    );
    foreach ($user as $u) {
        session(['idULog' => $u->idUsuario]);
        session(['nombreULog' => $u->nombre]);
        session(['apellidosULog' => $u->apellidos]);
        session(['correoULog' => $u->correo]);
        session(['tipoULog' => $u->tipoUsuario]);
        session(['imgAvatarULog' => $u->imgAvatar]);
    }
    return view('portada')->with($loguser);
}
}
