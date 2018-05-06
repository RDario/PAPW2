@php
include("conexionBD.php");
require_once "DVNoticia.php";
$connection = conectarBD();

$txtDiaFrom = $_POST['txtDiaFrom'];
$txtMesFrom = $_POST['txtMesFrom'];
$txtAnioFrom = $_POST['txtAnioFrom'];
$txtDiaTo = (int) $_POST['txtDiaTo'];
$txtMesTo = $_POST['txtMesTo'];
$txtAnioTo = $_POST['txtAnioTo'];
$txtDiaTo ++;
$fechaFrom = $txtAnioFrom."-".$txtMesFrom."-".$txtDiaFrom;
$fechaTo = $txtAnioTo."-".$txtMesTo."-".(string) $txtDiaTo;

$fechaFrom = str_replace(" ", "", $fechaFrom);
$fechaTo = str_replace(" ", "", $fechaTo);

$querySelect = "CALL busquedaNoticiasPorFecha('$fechaFrom', '$fechaTo')";
$resultQuery = mysqli_query($connection, $querySelect) or die (mysqli_error($connection));
mysqli_close($connection);

if ($resultQuery->num_rows) {
	$rows = $resultQuery->fetch_all(MYSQLI_ASSOC);
	$arrayNoticias = array();
	foreach ($rows as $row) {
		$arrayNoticias[count($arrayNoticias)] = new DVNoticia(
			$row['idNoticia'],
			$row['titulo'],
			'',
			$row['seccion'],
			$row['idSeccion'],
			$row['fecha'],
			'',
			$row['autor'],
			$row['idUsuario'],
			'',
			'',
			'');
	}
}
@endphp

@include('header')
<div class="panelEdicion">
	<div class="container">
		<div class="divColumn">
			<h3>Resultados de la búsqueda</h3>
			<br>
			<div class="listaNoticias">
				<ul class="ulListaNoticias">
					@php
					for ($i=0; $i < count($arrayNoticias); $i++) {
						$elemento = $arrayNoticias[$i]; @endphp
						<li class="elementLista">
							<div class="divElementNoti">
								<a class="txtTituloNV"  href="noticiaDetalle.php?id=@php echo $elemento->idNoticia; @endphp">@php echo $elemento->titulo; @endphp<a/>
									<br>
									<span>Reportero: </span>
									<a class="txtAutorNV" href="perfil.php?id=@php echo $elemento->idUsuario; @endphp">@php echo $elemento->autor; @endphp</a>
									<span>Fecha de publicación: </span>
									<span class="txtFechaNV">@php echo $elemento->fecha; @endphp</span>
								</div>
							</li>
							@php } @endphp
						</ul>
					</div>
				</div>
			</div>
		</div>
		@include('footer')