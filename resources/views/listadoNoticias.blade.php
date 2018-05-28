@include('header')
<div class="panelEdicion">
	<div class="container">
		<div class="divColumn">
			<h3>Noticias pendientes de publicar</h3>
			<br>
			<div class="listaNoticias">
				<ul class="ulListaNoticias">
					@if(isset($dataNoti))
					@if(count($dataNoti) > 0)
					@foreach($dataNoti as $noti)
					@if($dataTipo == 'Administrador')
					<li class="elementLista">
						<div class="divElementNoti">
							<a class="txtTituloNV" href="{{ route('editar',$noti->idNoticia) }}">{{ utf8_decode($noti->titulo) }}<a/>
								<br>
								<span>Reportero: </span>
								<a class="txtAutorNV" href="{{ route('perfil',$noti->idUsuario) }}">{{ utf8_decode($noti->autor) }}</a>
								<span>Última actualización: </span>
								<span class="txtFechaNV">{{ $noti->fecha }}</span>
							</div>
						</li>
						@else
						@if($noti->idUsuario == $dataId)
						<li class="elementLista">
							<div class="divElementNoti">
								<a class="txtTituloNV"  href="{{ route('editar',$noti->idNoticia) }}">{{ utf8_decode($noti->titulo) }}<a/>
									<br>
									<span>Reportero: </span>
									<a class="txtAutorNV" href="{{ route('perfil',$noti->idUsuario) }}">{{ utf8_decode($noti->autor) }}</a>
									<span>Última actualización: </span>
									<span class="txtFechaNV">{{ utf8_decode($noti->fecha) }}</span>
								</div>
							</li>
							@endif
							@endif
							@endforeach
							@endif
							@endif
						</ul>
					</div>
				</div>			
			</div>
		</div>
		@include('footer')