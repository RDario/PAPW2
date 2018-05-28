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
				<div class="col-md-8 mag-innert-left">
					<div class="single-left-grid">
						<div class="slideshow-container">
							@if (isset($dataMulti))
							@foreach ($dataMulti as $multi)
							<div class="mySlides">
								@if($multi->tipoMedia == 'IMG')
								@if($multi->urlMedia != null)
								<img src="{{ asset('images/'.$multi->urlMedia) }}" style="width:100%">
								@endif
								@elseif($multi->tipoMedia == 'VID')
								@if($multi->urlMedia != null)
								<video width="100%" height="320" controls>
									<source src="{{ asset('videos/'.$multi->urlMedia) }}" type="video/mp4">
									</video>
								@endif
								@endif
								</div>
								@endforeach
								@endif
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
								<a class="next" onclick="plusSlides(1)">&#10095;</a>
							</div>
							<br>
							<div style="text-align:center">
								@php
								for ($i=0; $i < count($dataMulti); $i++) { @endphp
								<span class="dot" onclick="currentSlide({{ $i }})"></span>
								@php } @endphp 
							</div>
							@if(isset($dataNoti))
							@foreach($dataNoti as $noti))
							<h2>{{ utf8_decode($noti->titulo) }}</h2>
							<h4>{{ utf8_decode($noti->descripcion) }}</h4>
							<p class="textoComplete">{{ utf8_decode($noti->texto) }}</p>
							<div class="single-bottom">
								@php 
								$datePubli = new DateTime($noti->fecha);
								@endphp
								<ul>
									<li><span>Reportero:</span> <a href="{{ route('perfil',$noti->idUsuario) }}">{{ utf8_decode($noti->autor) }}</a></li>
									<li><span>Fecha de publicacion </span>{{ $datePubli->format('H:i:s')." del día ".$datePubli->format('d-m-Y') }}</li>
									<li><span>{{ count($dataComents)." comentario(s)" }}</span>
									</li>
								</ul>
							</div>
							@endforeach
							@endif
						</div>
						<br>
						@if(isset($dataComents))
						@foreach($dataComents as $coment)
						@php
						$date = new DateTime($coment->fecha);
						@endphp
						<div class="divCajaComentario">
							<img class="imgComentario" src="{{ asset('images/profile/$coment->imgAvatar') }}" style="width: 60px; height: 60px; float: left;">
							<a href="{{ route('perfil',$coment->idUsuario) }}">{{ utf8_decode($coment->autor) }}</a>
							<br>
							<p>{{ utf8_decode($coment->texto) }}</p>
							<span>Publicado a las {{ $date->format('H:i:s')." del día ".$date->format('d-m-Y') }}</span>

							@if(Session::has('tipoULog'))
							@if(Session::get('tipoULog') == 'Administrador')
							@foreach($dataNoti as $noti))
							<a href="comentario_delete_success.php?idComen={{ $coment->idComentario }}&idNoti={{ $noti->idNoticia }}" style="float: right; padding-right: 3px;">Eliminar</a>
							@endforeach
							@elseif(Session::get('tipoULog') == 'Reportero')
							@foreach($dataNoti as $noti))
							@if(Session::get('idULog') == $noti->idUsuario)
							<a href="comentario_delete_success.php?idComen{{ $coment->idComentario }}&idNoti={{ $noti->idNoticia }}" style="float: right; padding-right: 3px;">Eliminar</a>
							@endif
							@endforeach
							@endif
							@endif
							<hr>
						</div>
						@endforeach
						@endif

						<div class="leave">
							<h4>Deja un comentario</h4>
							<form id="commentform" method="POST" action="comentario_insert_success.php">
								<p class="comment-form-author-name"><label for="author">Nombre</label>
									@if(Session::has('nombreULog'))
									<input name="txtNombreUser" type="text" size="30" required="" readOnly="" value="{{ Session::get('nombreULog') }} {{ Session::get('apellidosULog') }}">
									@else
									<input name="txtNombreUser" type="text" size="30" required="" placeholder="Ingresa un nombre para identificarte" value="">
									@endif
									<p class="comment-form-email">
										<label class="email">Correo eléctronico</label>
										@if(Session::has('correoULog'))
										<input name="txtEmailUser" type="text" required="" readOnly="" value="{{ Session::get('correoULog') }}">
										@else
										<input name="txtEmailUser" type="text" required="" placeholder="Ingresa un correo eléctronico válido" 
										value="" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}">
										@endif
									</p>
									<br>
									<p class="comment-form-comment">
										<textarea placeholder="Comenta lo que quieras!" name="txtTextoUser" requerid=""></textarea>
									</p>
									<div class="clearfix"></div>

									@if(Session::has('idULog'))
									<input name="txtIdUser" type="hidden" required="" value="{{ Session::get('idULog') }}">
									@else
									<input name="txtIdUser" type="hidden" required="" value="">
									@endif
									@if(isset($dataNoti))
									@foreach($dataNoti as $noti)
									<input name="txtIdNoticia" type="hidden" value="{{ $noti->idNoticia }}" required="">
									@endforeach
									@endif
									<input name="txtIdCommentPapa" type="hidden" value="0" required="">
									<p class="form-submit">
										<input type="submit" value="Enviar">
									</p>
									<div class="clearfix"></div>
								</form>
							</div>
						</div>

						<div class="col-md-4 mag-inner-right">
							<div class="sign_main" style="background-color: #f8f8f8;">
								<h4 class="side">Secciones</h4>
								<ul>
									@if(isset($dataSeccs))
									@foreach($dataSeccs as $secc)
									<li><a href="/{{ $secc->idSeccion }}">{{ utf8_decode($secc->nombreSeccion) }}</a></li>
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
										<input type="text" name="txtKeywords" class="txtBusqueda" placeholder="Ingrese palabras clave aquí">
										<input type="submit" value="Buscar">
									</form>
								</div>
								<div class="sign_up">
									<span>Búsqueda por fecha</span>
									<form class="form-busqueda" method="POST" action="">
										<div class="address">
											<span>Del día</span>
											<select class="selectFecha" id="inpDiaFrom" name="txtDiaFrom" placeholder="">
												@php
												foreach($arrayDias as $key => $value) {
													echo "<option value=' $value '> $value </option>";
												} @endphp
											</select>
											<select class="selectFecha" id="inpMesFrom" name="txtMesFrom" placeholder="">
												@php
												foreach($arrayMes as $key => $value) {
													echo "<option value=' $value '> $key </option>";
												} @endphp
											</select>
											<select class="selectFecha" id="inpAnioFrom" name="txtAnioFrom" placeholder="">
												@php
												foreach($arrayAnio as $key => $value) {
													echo "<option value=' $value '> $value </option>";
												} @endphp
											</select>
										</div>
										<div class="address">
											<span>Al día</span>
											<select class="selectFecha" id="inpDiaTo" name="txtDiaTo" placeholder="">
												@php
												foreach($arrayDias as $key => $value) {
													echo "<option value=' $value '> $value </option>";
												} @endphp
											</select>
											<select class="selectFecha" id="inpMesTo" name="txtMesTo" placeholder="">
												@php
												foreach($arrayMes as $key => $value) {
													echo "<option value=' $value '> $key </option>";
												} @endphp
											</select>
											<select class="selectFecha" id="inpAnioTo" name="txtAnioTo" placeholder="">
												@php
												foreach($arrayAnio as $key => $value) {
													echo "<option value=' $value '> $value </option>";
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

			<script type="text/javascript">
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

						console.log("Valores-fecha---> "+fechaFrom+" _ "+fechaTo);
						$(location).attr('href', 'busquedafecha/'+fechaFrom+'/'+fechaTo);
					});
				});

				var slideIndex = 1;
				showSlides(slideIndex);

				function plusSlides(n) {
					showSlides(slideIndex += n);
				}

				function currentSlide(n) {
					showSlides(slideIndex = n);
				}

				function showSlides(n) {
					var i;
					var slides = document.getElementsByClassName("mySlides");
					var dots = document.getElementsByClassName("dot");
					if (n > slides.length) {slideIndex = 1} 
						if (n < 1) {slideIndex = slides.length}
							for (i = 0; i < slides.length; i++) {
								slides[i].style.display = "none"; 
							}
							for (i = 0; i < dots.length; i++) {
								dots[i].className = dots[i].className.replace(" active", "");
							}
							slides[slideIndex-1].style.display = "block"; 
							dots[slideIndex-1].className += " active";
						}
					</script>


									<!-- DESMADRE DE LIKES
									@php
										if (isset($_SESSION["idULog"])) {
											$idULog = $_SESSION["idULog"]; @endphp
											@php
											$isLiked = false;
											for ($n=0; $n < count($arrayLikes); $n++) {
												$elemAux = $arrayLikes[$n];
												if ($idULog == $elemAux->idUsuario && $noticiaComplete->idNoticia == $elemAux->idNoticia) {
													$isLiked = true;
												}
											}
											for ($x=0; $x < count($arrayLikes); $x++) {
												$elementoLike = $arrayLikes[$x];
												if ($idULog == $elementoLike->idUsuario && $noticiaComplete->idNoticia == $elementoLike->idNoticia) { @endphp
												<form action="like_delete_success.php" method="POST" >
													<input type="hidden" name="inpIdNoticia" value="@php echo $elemento->idNoticia; @endphp"/>
													<input type="hidden" name="inpIdUsuario" value="@php echo $idULog; @endphp"/>
													<input type="submit" id="btnLiked" value="Te gusta"/>
												</form>
												@php 
												break; } else if ($idULog == $elementoLike->idUsuario && $noticiaComplete->idNoticia != $elementoLike->idNoticia) { @endphp
												<form action="like_insert_success.php" method="POST">
													<input type="hidden" name="inpIdNoticia" value="@php echo $elemento->idNoticia; @endphp"/>
													<input type="hidden" name="inpIdUsuario" value="@php echo $idULog; @endphp"/>
													<input type="submit" id="btnLike" value="¡ME GUSTA!"/>
												</form>
												@php
											} else if ($idULog != $elementoLike->idUsuario && $noticiaComplete->idNoticia == $elementoLike->idNoticia) {
												if (!$isLiked) { @endphp
												<form action="like_insert_success.php" method="POST">
													<input type="hidden" name="inpIdNoticia" value="@php echo $elemento->idNoticia; @endphp"/>
													<input type="hidden" name="inpIdUsuario" value="@php echo $idULog; @endphp"/>
													<input type="submit" id="btnLike" value="¡ME GUSTA!"/>
												</form>
												@php } else { @endphp
												@php } 
											}
										}
									} @endphp -->