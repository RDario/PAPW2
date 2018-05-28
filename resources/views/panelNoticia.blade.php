@include('header')
<div class="panel">
	<div class="container">
		<div class="divColumnLeft">
			<h3>Subir nueva noticia</h3>
			<form class="form-busqueda" action="noticia_success_page.php" method="POST">
				<div class="address">
					<span>Título</span>
					<input class="inpTitulo" type="text" name="txtTitulo" autofocus="true" required="">
				</div>
				<div class="address">
					<span>Sección</span>
					<select class= "selectSeccion" name="txtSeccion" tabindex="1" required="">
						@if (isset($dataSeccs))
						@foreach ($dataSeccs as $secc)
						<option value="{{ $secc->idSeccion }}">{{ $secc->nombreSeccion }}</option>
						@endforeach
						@endif
					</select>
				</div>
				<div class="address">
					<span>Descripción breve</span>
					<textarea type="text" name="txtDescripcion" tabindex="2"></textarea>
				</div>
				<div class="address">
					<span>Autor</span>
					<input class="inpAutor" type="text" name="txtAutor" tabindex="6" required="" readOnly="" value="{{ Session::get('nombreULog') }} {{ Session::get('apellidosULog') }}">
				</div>
				<div class="address">
					<span>¿Noticia especial?</span>
					<select class= "selectFecha" name="txtIsEspecial" required="" tabindex="7">
						<option value="0">No</option>
						<option value="1">Si</option>
					</select>
				</div>
				<div class="address">
					<span>Cintillo</span>
					<select class= "selectFecha" name="txtCintillo" required="" tabindex="8">
						<option value="NONE">NONE</option>
						<option value="REPORTAJE ESPECIAL">REPORTAJE ESPECIAL</option>
						<option value="ÚLTIMA HORA">ÚLTIMA HORA</option>
					</select>
				</div>
				<div class="address">
					<span>Texto completo</span>
					<textarea class="textareaTexto" type="text" tabindex="9" name="txtTextoCompleto" rows="20" required=""></textarea>
				</div>
				<div class="address new">
					<input name="inpGuardarNoti" type="submit" value="Guardar" tabindex="10">
				</div>
			</form>
		</div>

		@if(Session::has('tipoULog'))
		@if(Session::get('tipoULog') == 'Administrador')
		<div class="divColumnRight">
			<h3>Subir nueva sección</h3>
			<form class="form-busqueda" action="seccion_success_page.php" method="POST">
				<div class="address">
					<span>Título</span>
					<input class="inpTitulo" type="text" name="txtTituloSecc" tabindex="8" required="">
				</div>
				<div class="address new">
					<input name="inpGuardarSecc" type="submit" value="Guardar" tabindex="9">
				</div>
			</form>
		</div>
		<br>
		<div class="divColumnRight">
			<br>
			<h3>Editar seccion</h3>
			<form class="form-busqueda" method="POST" action="seccion_update_success.php">
				<div class="address">
					<select id="inputIdSeccion" class="selectSeccion" name="IdSeccionUpdate" required="" onchange="getSeccion()">
						@if(isset($dataSeccs))
						@foreach($dataSeccs as $secc)
						<option value="{{ $secc->idSeccion }}">{{ $secc->nombreSeccion }}</option>
						@endforeach
						@endif
					</select>
					<div class="address">
						<input id="inputTextSeccion" class="inpTitulo" type="text" name="txtTitleSecUpdate" required="">
					</div>
					<div class="address new">
						<input id="idBtnSubmitEditar" name="inpEditarSecc" type="submit" value="Actualizar">
					</div>
				</div>
			</form>
		</div>
		<br>
		<div class="divColumnRight">
			<br>
			<h3>Eliminar seccion</h3>
			<form class="form-busqueda" method="POST" action="seccion_delete_success.php">
				<div class="address">
					<select class= "selectSeccion" name="txtSeccionEliminar" required="">
						@if(isset($dataSeccs))
						@foreach($dataSeccs as $secc)
						<option value="{{ $secc->idSeccion }}">{{ $secc->nombreSeccion }}</option>
						@endforeach
						@endif
					</select>
					<div class="address new">
						<input id="idBtnSubmitEliminar" name="inpEliminarSecc" type="submit" value="Eliminar" onclick="clicked(event);">
					</div>
				</div>
			</form>
		</div>
		<div class="clearfix"></div>
		@endif
		@endif
	</div>
</div>
@include('footer')

<script type="text/javascript">
	function clicked(e){
		if(!confirm('Se eliminarán todas las noticias no publicadas que contenga la sección. ¿Deseas continuar?'))e.preventDefault();
	}
</script>

<script>
	$(document).ready(function(){
		function getSeccion() {
			var x = document.getElementById("campoIdSeccion");
			x = x.options[x.selectedIndex].text;
			document.getElementById("campoTextSeccion").value = x;
		}
		getSeccion();

		$('.form-busqueda').submit(function(event){
			return false;
		});
	});
</script>