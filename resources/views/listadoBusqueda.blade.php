@include('header')
<div class="panelEdicion">
	<div class="container">
		<div class="divColumn">
			<h3>Resultados de {{ $dataKeywords }}</h3>
			<br>
			<div class="listaNoticias">
				<ul class="ulListaNoticias">
					@if(isset($dataNoti))
					@if(count($dataNoti) > 0)
					@foreach($dataNoti as $noti)
					<li class="elementLista">
						<div class="divElementNoti">
							<a class="txtTituloNV"  href="{{ route('noticia',$noti->idNoticia) }}">{{ $noti->titulo }}<a/>
								<br>
								<span>Reportero: </span>
								<a class="txtAutorNV" href="{{ route('perfil',$noti->idUsuario) }}">{{ $noti->autor }}</a>
								<span>Fecha de publicación: </span>
								<span class="txtFechaNV">{{ $noti->fecha }}</span>
							</div>
						</li>
						@endforeach
						@else
						<span>No se encontró resultados de la búsqueda</span>
						@endif
						@endif
					</ul>
				</div>
			</div>
		</div>
	</div>
	@include('footer')