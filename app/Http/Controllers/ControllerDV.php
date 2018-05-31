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

    public function perfil(Request $request){
        $datos_user = DB::select('CALL obtenerDatosUsuario(?)', array($request->id));
        $datos = array();
        foreach ($datos_user as $dato){
            array_push($datos, $dato);
        }
        $dataToSend = array('datos'=>$datos);
        return view('perfil', $dataToSend);
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
                $noticias = DB::select('CALL obtenerNoticiasConMasComens');

            } else if($request->idSecc == 'notLik'){
                $noticias = DB::select('CALL obtenerNoticiasConMasLikes');
                
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
        $dataToSend = array('dataNotis'=>$arraynotis,'dataSeccs'=>$arrayseccs);
        return view('portada', $dataToSend);
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
        foreach ($secciones as $secc){
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

         foreach ($noticia as $noti){
            array_push($arraynoti, $noti);
        }
        foreach ($comentarios as $coment){
            array_push($arraycomentarios, $coment);
        }
        foreach ($secciones as $secc){
            array_push($arrayseccs, $secc);
        }
        foreach ($multmedias as $multi){
            array_push($arraymultis, $multi);
        }
        foreach ($likes as $like){
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
public function updatenoticia(Request $request){
    $id_noticia = $request->txtIdNoticia;
    $titulo = $request->txtTitulo;
    $id_seccion = $request->txtIdSeccion;
    $seccion = $request->txtSeccion;
    $id_autor = $request->txtIdAutor;
    $autor = $request->txtAutor;
    $descripcion = $request->txtDescripcion;
    $is_especial = $request->txtIsEspecial;
    $is_publica = $request->txtValidacion;
    $cintillo = $request->txtCintillo;
    $texto_completo = $request->txtTextoCompleto;

    $insert = DB::select('CALL updateNoticia(?,?,?,?,?,?,?,?,?,?,?)', array($id_noticia,$titulo,$descripcion,$texto_completo,$id_seccion,$seccion,$id_autor,$autor,$is_publica,$is_especial,$cintillo));

    $secciones = DB::table('allsecciones')->get();
    $arrayseccs = array();
    $arraynoti = array();
    $arraymultis = array();
    $noticia = DB::select('CALL obtenerNoticiaCompletaById(?)', array($id_noticia));
    $multmedias = DB::select('CALL obtenerMultimediaById(?)', array($id_noticia));

    foreach ($noticia as $noti){
        array_push($arraynoti, $noti);
    }
    foreach ($secciones as $secc){
        array_push($arrayseccs, $secc);
    }
    foreach ($multmedias as $multi){
        array_push($arraymultis, $multi);
    }
    $dataToSend = array('dataNoti'=>$arraynoti, 'dataSeccs'=>$arrayseccs, 'dataMulti'=>$arraymultis,'dataId'=>$id_noticia);
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
public function loginout(Request $request){
    session(['idULog' => null]);
    session(['nombreULog' => null]);
    session(['apellidosULog' => null]);
    session(['correoULog' => null]);
    session(['tipoULog' => null]);
    session(['imgAvatarULog' => null]);
    return view('registrologin');
}
public function altaseccion(Request $request){
    $nombre_secc = $request->txtTituloSecc;
    $id_user = $request->txtIdUser;

    $insert = DB::select('CALL insertSeccion(?,?)', array($nombre_secc, $id_user));

    $secciones = DB::table('allsecciones')->get();
        $arrayseccs = array();
        foreach ($secciones as $secc){
            array_push($arrayseccs, $secc);
        }
        $dataToSend = array('dataSeccs'=>$arrayseccs);
        return view('panelNoticia', $dataToSend);
}
public function insertComment(Request $request){
    $nombre = $request->txtNombreUser;
    $email = $request->txtEmailUser;
    $texto = $request->txtTextoUser;
    $id_user = $request->txtIdUser;
    $id_noticia = $request->txtIdNoticia;
    $id_coment_papa = $request->txtIdCommentPapa;

    $insert = DB::select('CALL insertComentario(?,?,?,?,?,?)', array($texto,$nombre,$email,$id_user,$id_noticia,$id_coment_papa));

    $secciones = DB::table('allseccionesconnoticias')->get();
    $arrayseccs = array();

    $arraynoti = array();
    $arraycomentarios = array();
    $arraymultis = array();
    $arraylikes = array();
    $noticia = DB::select('CALL obtenerNoticiaCompletaById(?)', array($id_noticia));
    $comentarios = DB::select('CALL obtenerComentarios(?)', array($id_noticia));
    $multmedias = DB::select('CALL obtenerMultimediaById(?)', array($id_noticia));
    $likes = DB::select('CALL obtenerLikesByNoti(?)', array($id_noticia));

    foreach ($noticia as $noti){
        array_push($arraynoti, $noti);
    }
    foreach ($comentarios as $coment){
        array_push($arraycomentarios, $coment);
    }
    foreach ($secciones as $secc){
        array_push($arrayseccs, $secc);
    }
    foreach ($multmedias as $multi){
        array_push($arraymultis, $multi);
    }
    foreach ($likes as $like){
        array_push($arraylikes, $like);
    }
    $dataToSend = array('dataNoti'=>$arraynoti, 'dataComents'=>$arraycomentarios, 'dataSeccs'=>$arrayseccs, 'dataLikes'=>$arraylikes, 'dataMulti'=>$arraymultis);
    return view('noticiaDetalle',$dataToSend);
}
public function subirNoticia(Request $request){
    $titulo = $request->txtTitulo;
    $id_seccion = $request->txtSeccion;
    $id_autor = $request->idAutor;
    $autor = $request->txtAutor;
    $descripcion = $request->txtDescripcion;
    $is_especial = $request->txtIsEspecial;
    $cintillo = $request->txtCintillo;
    $texto_completo = $request->txtTextoCompleto;

    $insert = DB::select('CALL insertNoticia(?,?,?,?,?,?,?,?,?,?)', array($titulo,$descripcion,$texto_completo,$id_seccion,'',$id_autor,$autor,0,$is_especial,$cintillo));

    $last_insert_id = DB::table('noticia')-> insertGetId(array(
        'titulo' => $titulo,
        'descripcion' => $descripcion,
        'texto' => $texto_completo,
        'idSeccion' => $id_seccion,
        'idUsuario' => $id_autor,
        'autor' => $autor,
        'isPublica' => 0,
        'isEspecial' => $is_especial,
        'cintillo' => $cintillo));

    $secciones = DB::table('allsecciones')->get();
    $arrayseccs = array();
    $arraynoti = array();
    $arraymultis = array();
    $noticia = DB::select('CALL obtenerNoticiaCompletaById(?)', array($last_insert_id));
    $multmedias = DB::select('CALL obtenerMultimediaById(?)', array($last_insert_id));

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

    return view('editarNoticia', $dataToSend);
}

public function editarperfil(Request $request){
    $img_avatar = $request->txtImgAvatar;
    $img_portada = $request->txtImgPortada;

    if ($request->hasFile('inpImgPortada')){
        $img_portada = time().'.'.$request->inpImgPortada->getClientOriginalExtension();
        $request->inpImgPortada->move(public_path('images/profile'), $img_portada);
    }
    if ($request->hasFile('inpImgPerfil')){
        $img_avatar = time().'.'.$request->inpImgPerfil->getClientOriginalExtension();
        $request->inpImgPerfil->move(public_path('images/profile'), $img_avatar);
    }

    $tipoCuenta = $request->txtTipoCuenta;
    $id_usuario = $request->txtIdUsuario;
    $nombre = $request->txtNombre;
    $apellidos = $request->txtApellidos;
    $email = $request->txtEmail;
    $password = $request->txtPassword;
    $nac_dia = $request->txtNacDia;
    $nac_mes = $request->txtNacMes;
    $nac_anio = $request->txtNacAnio;
    $telefono = $request->txtTelefono;

    $noticia = DB::select('CALL updateUsuarioById(?,?,?,?,?,?,?,?,?,?)', array($id_usuario,$nombre,$apellidos,$email,$password,$telefono,$nac_dia."-".$nac_mes."-".$nac_anio,$tipoCuenta,$img_avatar,$img_portada));

    $datos_user = DB::select('CALL obtenerDatosUsuario(?)', array($id_usuario));
    $datos = array();
    foreach ($datos_user as $dato){
        array_push($datos, $dato);
        session(['nombreULog' => $dato->nombre]);
        session(['apellidosULog' => $dato->apellidos]);
        session(['correoULog' => $dato->correo]);
        session(['tipoULog' => $dato->tipoUsuario]);
        session(['imgAvatarULog' => $dato->imgAvatar]);
    }
    $dataToSend = array('datos'=>$datos);
    return view('perfil', $dataToSend);
}
public function imagesupload(Request $request){
    $img_01 = $request->inpTextMedia01;
    $img_02 = $request->inpTextMedia02;
    $img_03 = $request->inpTextMedia03;

    $id_img_01 = $request->inpIdMedia01;
    $id_img_02 = $request->inpIdMedia02;
    $id_img_03 = $request->inpIdMedia03;

    $id_noti_01 = $request->inpidNoticia01;
    $id_noti_02 = $request->inpidNoticia02;
    $id_noti_03 = $request->inpidNoticia03;

    if ($request->hasFile('inpImgNoti01')){
        $img_01 = time().'.'.$request->inpImgNoti01->getClientOriginalExtension();
        $request->inpImgNoti01->move(public_path('images'), $img_01);
        $update1 = DB::select('CALL updateMultimediaById(?,?,?,?)', array($id_img_01,$id_noti_01,$img_01,'2'));
    }
    if ($request->hasFile('inpImgNoti02')){
        $img_02 = time().'.'.$request->inpImgNoti02->getClientOriginalExtension();
        $request->inpImgNoti02->move(public_path('images'), $img_02);
        $update2 = DB::select('CALL updateMultimediaById(?,?,?,?)', array($id_img_02,$id_noti_02,$img_02,'2'));
    }
    if ($request->hasFile('inpImgNoti03')){
        $img_03 = time().'.'.$request->inpImgNoti03->getClientOriginalExtension();
        $request->inpImgNoti03->move(public_path('images'), $img_03);
        $update3 = DB::select('CALL updateMultimediaById(?,?,?,?)', array($id_img_03,$id_noti_03,$img_03,'2'));
    }
    $secciones = DB::table('allsecciones')->get();
    $arrayseccs = array();
    $arraynoti = array();
    $arraymultis = array();
    $noticia = DB::select('CALL obtenerNoticiaCompletaById(?)', array($id_noti_01));
    $multmedias = DB::select('CALL obtenerMultimediaById(?)', array($id_noti_01));

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
    return view('editarNoticia', $dataToSend);
}
}
