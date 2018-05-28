@include('header')
<div class="panelEdicion">
	<div class="container">
		<div class="columnEdit">
			<h3>Editar noticia</h3>
			<div>
				<form method="POST" action="noticia_delete_success.php">
					@if(isset($dataNoti))
					@foreach($dataNoti as $noti)
					@endforeach
					<div class="address">
						<input class="inpTitulo" readOnly="" type="hidden" name="txtIdNoticiaDelete" required="" value="{{ $noti->idNoticia }}">
					</div>
					<div class="address new">
						<input name="inpGuardarMedia" type="submit" value="Eliminar noticia">
					</div>
					@endif
				</form>
			</div>
			<form action="noticia_update_success.php" method="POST">
				<div class="address">
					<span>Validar noticia</span>
					@if(isset($dataNoti))
					@foreach($dataNoti as $noti)
					<input class="inpTitulo" type="hidden" name="txtIdNoticia" required="" value="{{ $noti->idNoticia }}">
					@endforeach
					@endif
					<select class= "selectValidacion" name="txtValidacion" tabindex="9" required="">
						@if(Session::has('tipoULog'))
						@if(Session::get('tipoULog') == 'Administrador')
						@if(isset($dataNoti))
						@foreach($dataNoti as $noti)
						@if($noti->isPublica == 0)
						<option value="1">Si</option>
						<option value="0" selected>No</option>
						@else
						<option value="0">No</option>
						@endif
						@endforeach
						@endif
						@endif
						@endif
					</select>
				</div>
				<div class="address">
					<span>Título</span>
					@if(isset($dataNoti))
					@foreach($dataNoti as $noti)
					<input class="inpTitulo" type="text" name="txtTitulo" autofocus="true" required="" value="{{ utf8_decode($noti->titulo) }}">
					@endforeach
					@endif
				</div>
				<div class="address">
					<span>Sección</span>
					<select id="campoIdSeccion" class= "selectSeccion" name="txtIdSeccion" tabindex="1" required="" onchange="getSeccion()">
						@if(isset($dataSeccs))
						@foreach($dataSeccs as $secc)
						@foreach($dataNoti as $noti)
						@if($noti->idSeccion == $secc->idSeccion)
						<option value="{{ $secc->idSeccion }}" selected>{{ $secc->nombreSeccion }}</option>
						@else
						<option value="{{ $secc->idSeccion }}">{{ $secc->nombreSeccion }}</option>
						@endif
						@endforeach
						@endforeach
						@endif
					</select>
					<input id="campoTextSeccion" class="inpAutor" type="hidden" name="txtSeccion" required="">
				</div>
				<span>Descripción breve</span>
				@if(isset($dataNoti))
				@foreach($dataNoti as $noti)
				<div class="address">
					<textarea type="text" name="txtDescripcion" tabindex="2">{{ utf8_decode($noti->descripcion) }}</textarea>
				</div>
				<div class="address">
					<span>Autor</span>
					<input class="inpAutor" type="text" name="txtAutor" tabindex="6" required="" readOnly="" value="{{ utf8_decode($noti->autor) }}">
					<input class="inpAutor" type="hidden" name="txtIdAutor" tabindex="7" required="" readOnly="" value="{{ utf8_decode($noti->idUsuario) }}">
				</div>
				<div class="address">
					<span>¿Noticia especial?</span>
					<select class= "selectFecha" name="txtIsEspecial" required="" tabindex="7">
						@if($noti->isEspecial == '0')
						<option value="0" selected>No</option>
						<option value="1">Si</option>
						@else
						<option value="0">No</option>
						<option value="1" selected>Si</option>
						@endif
					</select>
				</div>
				<div class="address">
					<span>Cintillo</span>
					<select class= "selectFecha" name="txtCintillo" required="" tabindex="8">
						@if($noti->cintillo == 'REPORTAJE ESPECIAL')
						<option value="NONE">NONE</option>
						<option value="REPORTAJE ESPECIAL" selected>REPORTAJE ESPECIAL</option>
						<option value="ÚLTIMA HORA">ÚLTIMA HORA</option>
						@elseif($noti->cintillo == 'ÚLTIMA HORA')
						<option value="NONE">NONE</option>
						<option value="REPORTAJE ESPECIAL">REPORTAJE ESPECIAL</option>
						<option value="ÚLTIMA HORA" selected>ÚLTIMA HORA</option>
						@else
						<option value="NONE" selected>NONE</option>
						<option value="REPORTAJE ESPECIAL">REPORTAJE ESPECIAL</option>
						<option value="ÚLTIMA HORA">ÚLTIMA HORA</option>
						@endif
					</select>
				</div>		
				<div class="address">
					<span>Texto completo</span>
					<textarea class="textareaTexto" type="text" tabindex="8" name="txtTextoCompleto" rows="20" required="">{{ utf8_decode($noti->texto) }}</textarea>
				</div>
				<div class="address new">
					<input name="inpGuardarNoti" type="submit" value="Actualizar" tabindex="9">
				</div>
			</form>
		</div>
		<hr>
		<div class="columnEdit">
			<form enctype="multipart/form-data" action="images_upload_success.php" method="POST">
				<div class="address">
					<span>Sube una o varias imágenes (max 3)</span>
					<div class="divMediasNoticia">
						@php $indice = 1; @endphp
						@foreach($dataMulti as $multi)
						@if($multi->tipoMedia == 'IMG')
						<img class="imgMediasImg" id="idMediaImg0{{ $indice }}" onchange="loadFilePort(event)" src="{{ asset('images/'.$multi->urlMedia) }}">
							<input type="file" accept="image/*" name="inpImgNoti0{{ $indice }}" />
							<input type="hidden" name="inpIdMedia0{{ $indice }}" value="{{ $multi->idMultimedia }}" />
						@php $indice++; @endphp
						@endif
						@endforeach
					</div>
				</div>
				<div class="address new">
					<input name="inpGuardarMedia" type="submit" value="Actualizar" tabindex="9">
				</div>
				<input class="inpTitulo" type="hidden" name="txtIdNoticiaMedia" required="" value="{{ $noti->idNoticia }}">
			</form>
			<hr>
			<form enctype="multipart/form-data" action="videos_upload_success.php" method="POST">
				<div class="address">
					<span>Sube un o varios videos (max 3)</span>
					<div class="divMediasNoticia">
						@php $indix = 1; @endphp
						@foreach($dataMulti as $multi)
						@if($multi->tipoMedia == 'VID')
						<span>Video actual</span>
							<span>{{ $multi->urlMedia }}</span>
							<input type="file" accept="video/*" name="inpVidNoti0{{ $indix }}" />
							<input type="hidden" name="inpIdMediaVid0{{ $indix }}" value="{{ $multi->idMultimedia }}" />
							@php $indix++; @endphp
						@endif
						@endforeach
				</div>
			</div>
			<input class="inpTitulo" type="hidden" name="txtIdNoticiaMedia" required="" value="{{ $noti->idNoticia }}">
			<div class="address new">
				<input name="inpGuardarVideo" type="submit" value="Actualizar">
			</div>
		</form>
	</div>
	@endforeach
	@endif
	<hr>
</div>
</div>
@include('footer')
<script>
	var loadFilePort = function (event) {
		var output = document.getElementById('idMediaImg03');
		console.log(output);
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>
<script>
	$(document).ready(function(){
		function getSeccion() {
			var x = document.getElementById("campoIdSeccion");
			x = x.options[x.selectedIndex].text;
			document.getElementById("campoTextSeccion").value = x;
		}
		getSeccion();
	});
</script>