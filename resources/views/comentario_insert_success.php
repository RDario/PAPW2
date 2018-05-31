<?php
use DB;
use Session;
use View;

include("conexionBD.php");
$connection = conectarBD();
$txtIdNoticia = (int) $_POST['txtIdNoti']; ?>
<?php
$campoNombre = $_POST['txtNombre'];
$campoEmail = $_POST['txtEmail'];
$textoUser = $_POST['txtMessage'];
$txtIdUser = (int) $_POST['txtId'];
$txtIdCommentPapa = (int) $_POST['txtIdComentPapa'];

if ($textoUser != '' && $textoUser != ' ') {
	$queryInsert = "CALL insertComentario(
	'$textoUser',
	'$campoNombre',
	'$campoEmail',
	'$txtIdUser',
	'$txtIdNoticia',
	'$txtIdCommentPapa')";
	$resultQuery = mysqli_query($connection, $queryInsert) or die (mysqli_error($connection));
	mysqli_close($connection);
	echo "<br><br>Se añadió comentario exitosamente. Redirigiendose a"; ?>
	<a href="noticiaDetalle.php?id=<?php echo $txtIdNoticia; ?>">Noticia</a>
<?php } else {
	echo "Por favor ingresa un texto válido e inténtelo de nuevo. Gracias!";
} ?>