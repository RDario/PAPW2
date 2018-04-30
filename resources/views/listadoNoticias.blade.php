<?php
include("conexionBD.php");
require_once "DVNoticia.php";
$connection = conectarBD();
$idUserM = $_GET['id'];
$tipoUserM = $_GET['tipo'];
error_reporting(E_ALL);
$querySelect = "SELECT idNoticia, titulo, seccion, idSeccion, fecha, autor, idUsuario FROM ultimasnoticiasnovalidadas;";
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
} ?>
@include('header')
<div class="panelEdicion">
	<div class="container">
		<div class="divColumn">
			<h3>Noticias pendientes de publicar</h3>
			<br>
			<div class="listaNoticias">
				<ul class="ulListaNoticias">
					<?php
					for ($i=0; $i < count($arrayNoticias); $i++) {
						$elemento = $arrayNoticias[$i]; 
						if ($tipoUserM == 'Administrador') { ?>
						<li class="elementLista">
							<div class="divElementNoti">
								<a class="txtTituloNV"  href="editarNoticia.php?id=<?php echo $elemento->idNoticia; ?>"><?php echo $elemento->titulo; ?><a/>
									<br>
									<span>Reportero: </span>
									<a class="txtAutorNV" href="perfil.php?id=<?php echo $elemento->idUsuario; ?>"><?php echo $elemento->autor; ?></a>
									<span>Última actualización: </span>
									<span class="txtFechaNV"><?php echo $elemento->fecha; ?></span>
								</div>
							</li>
							<?php } else {
								if ($elemento->idUsuario == $idUserM) { ?>
								<li class="elementLista">
									<div class="divElementNoti">
										<a class="txtTituloNV"  href="editarNoticia.php?id=<?php echo $elemento->idNoticia; ?>"><?php echo $elemento->titulo; ?><a/>
											<br>
											<span>Reportero: </span>
											<a class="txtAutorNV" href="perfil.php?id=<?php echo $elemento->idUsuario; ?>"><?php echo $elemento->autor; ?></a>
											<span>Última actualización: </span>
											<span class="txtFechaNV"><?php echo $elemento->fecha; ?></span>
										</div>
									</li>
									<?php }
								}
							} ?>
						</ul>
					</div>
				</div>			
			</div>
		</div>