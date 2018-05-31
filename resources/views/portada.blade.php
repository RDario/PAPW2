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
    0=>"2018",
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
                       @if(isset($noti->isEspecial))
                       @if($noti->isEspecial == 1)
                       <li>
                        <div class="divNotiHeader">
                           <img  src="images/{{ $noti->imgNoti }}" />
                           <a href="noticia/{{ $noti->idNoticia }}">{{ utf8_decode($noti->titulo) }}</a>
                           <a href="noticia/{{ $noti->idNoticia }}" style="color: #fff; background-color: #ee5656; padding: 3px">Leer más</a>
                       </div>
                   </li>
                   @endif
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
            @if(isset($noti->isEspecial))
            @if($noti->isEspecial != 1)
            <div class="divSeccion">
                <h2 class="tituloSeccion">{{ utf8_decode($noti->seccion) }}</h2>
            </div>
            <div class="divNoticia">
                @if(isset($noti->imgNoti))
                @if($noti->imgNoti != "")
                <img style="width: 400px; height: 380px" class="imgNoticia" src="images/{{ $noti->imgNoti }}" />
                @else
                <img class="imgNoticia" src="images/placeholder.png" alt="" />
                @endif
                @endif
                <span style="float: right; padding-left: 5px; color: #428bca;"># Likes</span>
                @if(Session::has('idULog'))
                {{-- HACER DESMADRE DE LIKES AQUI --}}
                @endif
                <div class="datosNoticia">
                    <span class="txtTitulo">{{ utf8_decode($noti->titulo) }}</span>
                    <p class="txtDescripcion">{{ utf8_decode($noti->descripcion) }}</p>
                    <p class="txtCredito">Publicado por: {{ utf8_decode($noti->autor) }}</p>
                    <span class="txtFecha">Fecha: {{ $noti->fechaReciente }}</span>
                    <a class="leerMas" href="noticia/{{ $noti->idNoticia }}">LEER MÁS</a>
                </div>
            </div>
            @endif
            @else
            <div class="divSeccion">
                <h2 class="tituloSeccion">{{ utf8_decode($noti->seccion) }}</h2>
            </div>
            <div class="divNoticia">
                @if(isset($noti->imgNoti))
                @if($noti->imgNoti != "")
                <img style="width: 400px; height: 380px" class="imgNoticia" src="images/{{ $noti->imgNoti }}" />
                @else
                <img class="imgNoticia" src="images/placeholder.png" alt="" />
                @endif
                @endif
                <span style="float: right; padding-left: 5px; color: #428bca;"># Likes</span>
                @if(Session::has('idULog'))
                {{-- HACER DESMADRE DE LIKES AQUI --}}
                @endif
                <div class="datosNoticia">
                    <span class="txtTitulo">{{ utf8_decode($noti->titulo) }}</span>
                    <p class="txtDescripcion">{{ utf8_decode($noti->descripcion) }}</p>
                    <p class="txtCredito">Publicado por: {{ utf8_decode($noti->autor) }}</p>
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
                        <a href="/{{ $secc->idSeccion }}">{{ utf8_decode($secc->nombreSeccion) }}</a>
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
                    <form class="form-busqueda" method="GET" action="">
                        <input type="text" id="inp-text-busqueda" name="txtKeywords" class="txtBusqueda" placeholder="Ingrese palabras clave aquí">
                        <input id="inp-buscar-simple" type="submit" value="Buscar">
                    </form>
                </div>
                <div class="sign_up">
                    <span>Búsqueda por fecha</span>
                    <form class="form-busqueda" method="GET" action="">
                        <div class="address">
                            <span>Del día</span>
                            <select class="selectFecha" id="inpDiaFrom" name="txtDiaFrom" placeholder="">
                                @php
                                foreach($arrayDias as $key => $value) {
                                    echo "<option value='$value'>$value</option>";
                                } @endphp
                            </select>
                            <select class="selectFecha" id="inpMesFrom" name="txtMesFrom" placeholder="">
                               @php
                               foreach($arrayMes as $key => $value) {
                                echo "<option value='$value'>$key</option>";
                            } @endphp
                        </select>
                        <select class="selectFecha" id="inpAnioFrom" name="txtAnioFrom" placeholder="">
                           @php
                           foreach($arrayAnio as $key => $value) {
                            echo "<option value='$value'>$value</option>";
                        } @endphp
                    </select>
                </div>
                <div class="address">
                    <span>Al día</span>
                    <select class="selectFecha" id="inpDiaTo" name="txtDiaTo" placeholder="">
                        @php
                        foreach($arrayDias as $key => $value) {
                            echo "<option value='$value'>$value</option>";
                        } @endphp
                    </select>
                    <select class="selectFecha" id="inpMesTo" name="txtMesTo" placeholder="">
                       @php
                       foreach($arrayMes as $key => $value) {
                        echo "<option value='$value'>$key</option>";
                    } @endphp
                </select>
                <select class="selectFecha" id="inpAnioTo" name="txtAnioTo" placeholder="">
                   @php
                   foreach($arrayAnio as $key => $value) {
                    echo "<option value='$value'>$value</option>";
                } @endphp
            </select>
        </div>
        <input id="inp-buscar-fecha" type="submit" value="Buscar">
    </form>
</div>
</div>
</div>
</div>
</div>
</div>
@include('footer')

<script>
 $(document).ready(function(){
     $('.form-busqueda').submit(function(event){
        return false;
    });

     $('#inp-buscar-simple').click(function(){
        var keywords = $('#inp-text-busqueda').val();
        if (keywords != ''){
            $(location).attr('href', 'busqueda/'+keywords);
        } else {
            alert("Ingresa un dato válido en el campo de búsqueda");
        }
    });

     $('#inp-buscar-fecha').click(function(){
        var diaFrom = $('#inpDiaFrom').val();
        var mesFrom = $('#inpMesFrom').val();
        var anioFrom = $('#inpAnioFrom').val();
        var anioTo = $('#inpAnioTo').val();
        var mesTo = $('#inpMesTo').val();
        var diaTo = $('#inpDiaTo').val();
        var fechaFrom = anioFrom+"-"+mesFrom+"-"+diaFrom;
        var fechaTo = anioTo+"-"+mesTo+"-"+diaTo;
        $(location).attr('href', 'busquedafecha/'+fechaFrom+'/'+fechaTo);
    });
 });
</script>

<!-- DESMADRE DE LIKES -->
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