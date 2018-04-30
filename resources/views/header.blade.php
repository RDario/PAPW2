<?php SESSION_START();
error_reporting(0); ?>

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
                        <a class="navbar-brand" href=""><h1><span>FEIK</span>NEWS</h1></a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <?php
                            if (isset($_SESSION["tipoULog"])) {
                                $idUser = $_SESSION['idULog'];
                                $tipoUser = $_SESSION["tipoULog"];
                                if (strcmp($tipoUser, "Administrador") == 0 || strcmp($tipoUser, "Reportero") == 0) { ?>
                                <li><a href="panelNoticia.php">Subir noticia</a></li>
                                <li><a href="listadoNoticias.php?id=<?php echo $idUser;?>&tipo=<?php echo $tipoUser;?>">Noticias sin publicar</a></li>
                                <?php }
                            } ?>
                        </ul>
                        <div id="divCuadroPerfil">
                            <span id="txtCuadroPerfil">
                                <?php
                                if (isset($_SESSION["nombreULog"])) {
                                    $nomUser = $_SESSION['nombreULog']; ?>
                                    <a id="txtCuadroPerfil" href="perfil.php?id=<?php echo $idUser;?>">Hola <?php echo "$nomUser"; ?><a/>
                                        <?php if (isset($_SESSION['imgAvatarULog'])) { 
                                            $imgAvatarLog = $_SESSION['imgAvatarULog']; ?>
                                            <img id="imgCuadroPerfil" src="<?php echo 'images/profile/'.$imgAvatarLog; ?>" style="width: 50px; height: 50px;" >
                                            <?php } else { ?>
                                            <img id="imgCuadroPerfil" src="images/avatar.jpg" style="width: 50px; height: 50px;" >
                                            <?php } ?>
                                            <a id="txtDeslog" href="" onclick="">Cerrar sesión<a/>
                                                <?php } else {
                                                    print_r('<a href="registro">Inicia sesión aquí<a/>');
                                                } ?>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                </body>
                </html>