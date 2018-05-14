@php
$arrayDias = array(
    1=>"01",
    2=> "02",
    3=> "03",
    4=> "04",
    5=> "05",
    6=> "06",
    7=> "07",
    8=> "08",
    9=> "09",
    10=>"10",
    11=> "11",
    12=> "12",
    13=> "13",
    14=> "14",
    15=> "15",
    16=> "16",
    17=> "17",
    18=> "18",
    19=>"19",
    20=> "20",
    21=> "21",
    22=> "22",
    23=> "23",
    24=> "24",
    25=> "25",
    26=> "26",
    27=> "27",
    28=>"28",
    29=> "29",
    30=> "30",
    31=> "31");
$arrayMes = array(
    'enero'=>"01",
    'febrero'=> "02",
    'marzo'=> "03",
    'abril'=> "04",
    'mayo'=> "05",
    'junio'=> "06",
    'julio'=> "07",
    'agosto'=> "08",
    'septiembre'=> "09",
    'octubre'=>"10",
    'noviembre'=> "11",
    'diciembre'=> "12");
$arrayAnio = array(
    1=>"2017",
    2=> "2016",
    3=> "2015",
    4=> "2014",
    5=> "2013",
    6=> "2012",
    7=> "2011",
    8=> "2010",
    9=> "2009",
    10=>"2008",
    11=> "2007",
    12=> "2006",
    13=> "2005",
    14=> "2004",
    15=> "2003",
    16=> "2002",
    17=> "2001",
    18=> "2000",
    19=>"1999",
    20=> "1998");
    @endphp

    @include('header')
    <div class="main-content">
        <div class="container">
            <div class="mag-inner">
                <div class="divHeaderNews">
                    <ul class="listaNewsHorizontal">
                       @if (isset($dataNotis))
                       @foreach ($dataNotis as $noti)
                       @if($noti->isEspecial == 1)
                       <li>
                        <div class="divNotiHeader">
                           <img  src="images/{{ $noti->imgNoti }}" />
                           <a href="noticia/{{ $noti->idNoticia }}">{{ $noti->titulo }}</a>
                           <a href="noticia/{{ $noti->idNoticia }}" style="color: #fff; background-color: #ee5656; padding: 3px">Leer más</a>
                       </div>
                   </li>
                   @endif
                   @endforeach
                   @endif
               </ul>
           </div>

           <div class="col-md-8 mag-innert-left" style="background-color: #f8f8f8;">
            <a class="linkOrderNews"><a href="notCom">Noticias con más comentarios</a>
            <a class="linkOrderNews"><a href="notLik">Noticias con más likes</a>

            @if (isset($dataNotis))
            @foreach ($dataNotis as $noti)
            @if($noti->isEspecial != 1)
            <div class="divSeccion">
                <h2 class="tituloSeccion">{{ $noti->seccion }}</h2>
            </div>
            <div class="divNoticia">
                @if($noti->imgNoti != "")
                <img style="width: 400px; height: 380px" class="imgNoticia" src="images/{{ $noti->imgNoti }}" />
                @else
                <img class="imgNoticia" src="images/placeholder.png" alt="" />
                @endif
                <span style="float: right; padding-left: 5px; color: #428bca;"># Likes</span>
                @if(Session::has('idULog'))
                {{-- HACER DESMADRE DE LIKES AQUI --}}
                @endif
                <div class="datosNoticia">
                    <span class="txtTitulo">{{ $noti->titulo }}</span>
                    <p class="txtDescripcion">{{ $noti->descripcion }}</p>
                    <p class="txtCredito">Publicado por: {{ $noti->autor }}</p>
                    <span class="txtFecha">Fecha: {{ $noti->fechaReciente }}</span>
                    <a class="leerMas" href="noticia/{{ $noti->idNoticia }}">LEER MÁS</a>
                </div>
            </div>
            @endif
            @endforeach
            @endif
        </div>

        <div class="col-md-4 mag-inner-right">
            <div class="sign_main" style="background-color: #f8f8f8;">
                <h4 class="side">Secciones</h4>
                <ul>
                    @if(isset($dataSeccs))
                    @foreach($dataSeccs as $secc)
                    <li>
                        <a href="/{{ $secc->idSeccion }}">{{ $secc->nombreSeccion }}</a>
                    </li>
                    @endforeach
                    @endif
                    </ul>
                </div>    
            </div>

            <div class="col-md-4 mag-inner-right">
                <div class="sign_main" style="background-color: #f8f8f8;">
                    <h4 class="side">Búsqueda</h4>
                    <div class="sign_up">
                        <form method="GET" action="listadoBusqueda.php">
                            <input type="text" name="txtKeywords" class="txtBusqueda" placeholder="Ingrese palabras clave aquí">
                            <input type="submit" value="Buscar">
                        </form>
                    </div>
                    <div class="sign_up">
                        <span>Búsqueda por fecha</span>
                        <form method="POST" action="listadoBusquedaFecha.php">
                            <div class="address">
                                <span>Del día</span>
                                <select class="selectFecha" id="inpNacDia" name="txtDiaFrom" placeholder="">
                                    @php
                                    foreach($arrayDias as $key => $value) {
                                        echo "<option value=' $value '> $value </option>";
                                    } @endphp
                                </select>
                                <select class="selectFecha" id="inpNacMes" name="txtMesFrom" placeholder="">
                                   @php
                                   foreach($arrayMes as $key => $value) {
                                    echo "<option value=' $value '> $key </option>";
                                } @endphp
                            </select>
                            <select class="selectFecha" id="inpNacAnio" name="txtAnioFrom" placeholder="">
                               @php
                               foreach($arrayAnio as $key => $value) {
                                echo "<option value=' $value '> $value </option>";
                            } @endphp
                        </select>
                    </div>
                    <div class="address">
                        <span>Al día</span>
                        <select class="selectFecha" id="inpNacDia" name="txtDiaTo" placeholder="">
                            @php
                            foreach($arrayDias as $key => $value) {
                                echo "<option value=' $value '> $value </option>";
                            } @endphp
                        </select>
                        <select class="selectFecha" id="inpNacMes" name="txtMesTo" placeholder="">
                           @php
                           foreach($arrayMes as $key => $value) {
                            echo "<option value=' $value '> $key </option>";
                        } @endphp
                    </select>
                    <select class="selectFecha" id="inpNacAnio" name="txtAnioTo" placeholder="">
                       @php
                       foreach($arrayAnio as $key => $value) {
                        echo "<option value=' $value '> $value </option>";
                    } @endphp
                </select>
            </div>
            <input type="submit" value="Buscar">
        </form>
    </div>
</div>
</div>
</div>
</div>
</div>
@include('footer')

{{--  <form action="like_delete_success.php" method="POST" style="float: right;">
                                        <input type="hidden" name="inpIdNoticia" value="@php echo $elemento->idNoticia; @endphp"/>
                                        <input type="hidden" name="inpIdUsuario" value="@php echo $idULog; @endphp"/>
                                        <input type="submit" id="btnLiked" value="Te gusta"/>
                                    </form>
                                    @php
                                    break; } else if ($idULog == $elementoLike->idUsuario && $elemento->idNoticia != $elementoLike->idNoticia) {
                                        @endphp
                                        <form action="like_insert_success.php" method="POST" style="float: right">
                                            <input type="hidden" name="inpIdNoticia" value="@php echo $elemento->idNoticia; @endphp"/>
                                            <input type="hidden" name="inpIdUsuario" value="@php echo $idULog; @endphp"/>
                                            <input type="submit" id="btnLike" value="¡ME GUSTA!"/>
                                        </form>

                                        @php 
                                    } else if ($idULog != $elementoLike->idUsuario && $elemento->idNoticia == $elementoLike->idNoticia) {
                                        if (!$isLiked) { @endphp
                                        <form action="like_insert_success.php" method="POST" style="float: right">
                                            <input type="hidden" name="inpIdNoticia" value="@php echo $elemento->idNoticia; @endphp"/>
                                            <input type="hidden" name="inpIdUsuario" value="@php echo $idULog; @endphp"/>
                                            <input type="submit" id="btnLike" value="¡ME GUSTA!"/> --}}