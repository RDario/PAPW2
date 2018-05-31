<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <title>Fake News</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="{{ asset('css/bootstrap-3.1.1.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('css/mystyle.css') }}" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
    <script src=" {{ asset('js/jquery.min.js') }}" type="text/javascript" charset="utf-8"></script>
    <script src="{{ asset('js/bootstrap-3.1.1.min.js') }}" type="text/javascript" charset="utf-8"></script>
</head>

<body>
    <div class="header" id="home">
        <div class="content white">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/"><h1><span>FEIK</span>NEWS</h1></a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            @if(Session::has('idULog'))
                            <li>
                                <a href="{{ route('panel',1) }}">Subir noticia</a>
                            </li>
                            <li>
                                <a href="{{ route('noticias',['id'=>Session::get('idULog'),'tipo'=>Session::get('tipoULog')]) }}">Noticias sin publicar</a>
                            </li>
                            @endif
                        </ul>
                        <div id="divCuadroPerfil">
                            <span id="txtCuadroPerfil">
                               @if(Session::has('nombreULog'))
                               <a id="txtCuadroPerfil" href="{{ route('perfil',Session::get('idULog')) }}">Hola {{ Session::get('nombreULog') }}<a/>
                                   @if(Session::has('imgAvatarULog'))
                                   <img id="imgCuadroPerfil" src="{{ asset('images/profile/'.Session::get('imgAvatarULog')) }}" style="width: 50px; height: 50px;" >
                                   <a id="txtDeslog" href="{{ route('loginout') }}" style="font-size: 12px;" onclick="">Cerrar sesión<a/>
                                   @else
                                   <img id="imgCuadroPerfil" src="{{ asset('images/avatar.jpg') }}" style="width: 50px; height: 50px;" >
                                   @endif
                                   @else
                                   <a href="login/1">Inicia sesión aquí<a/>
                                    @endif
                                   </span>
                               </div>
                           </div>
                       </div>
                   </nav>
               </div>
           </div>
       </body>
       </html>