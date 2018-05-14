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

    public function registro() {
        return view('registrologin');
    }
    public function perfil() {
        return view('perfil');
    }
    public function listadonoticias() {
        return view('listadoNoticias');
    }
    public function listadobusqueda() {
        return view('listadoBusqueda');
    }
    public function listadobusquedafecha() {
        return view('listadoBusquedaFecha');
    }
    public function index(Request $request) {
        DB::enableQueryLog();
        echo "La seccion es ".$request->idSecc;
        $secciones = DB::table('allseccionesconnoticias')->get();
        $arrayseccs = array();
        $arraynotis = array();

        if ($request->idSecc != null && $request->idSecc != ''){
            if ($request->idSecc == 'notCom'){
                $noticias = DB::select('EXEC obtenerNoticiasConMasComens')->get();

            } else if($request->idSecc == 'notLik'){
                $noticias = DB::select('EXEC obtenerNoticiasConMasLikes')->get();
                
            } else {
             $noticias = DB::select('EXEC obtenerNoticiasBySeccion(?)', array($request->idSecc));
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
public function front() {
    return view('');
}
public function header() {
    return view('header');
}
public function footer() {
    return view('footer');
}
public function panel() {
    return view('panelNoticia');
}
public function detalle(Request $request) {
    $secciones = DB::table('allseccionesconnoticias')->get();
    $arrayseccs = array();

    if ($request->id != null) {
     $arraynoti = array();
     $arraycomentarios = array();
     $arraymultis = array();
     $arraylikes = array();
     $noticia = DB::select('EXEC obtenerNoticiaCompletaById(?)', array($request->id));
     $comentarios = DB::select('EXEC obtenerComentarios(?)', array($request->id));
     $multmedias = DB::select('EXEC obtenerMultimediaById(?)', array($request->id));
     $likes = DB::select('EXEC obtenerLikesByNoti(?)', array($request->id));

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
    return view('noticiaDetalle')->with('dataNoti',$arraynoti)->with('dataComents', $arraycomentarios)->width('dataSeccs',$arrayseccs)->width('dataLikes',$arraylikes);
}
}
public function editarNoticia($id) {
    $data['id'] = $id;
    return View('editarNoticia', $data);
}
public function successLogin(Request $request) {
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
