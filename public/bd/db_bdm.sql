CREATE DATABASE  IF NOT EXISTS `basebdm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `basebdm`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: basebdm
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `allsecciones`
--

DROP TABLE IF EXISTS `allsecciones`;
/*!50001 DROP VIEW IF EXISTS `allsecciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `allsecciones` AS SELECT 
 1 AS `idSeccion`,
 1 AS `nombreSeccion`,
 1 AS `idUsuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allseccionesconnoticias`
--

DROP TABLE IF EXISTS `allseccionesconnoticias`;
/*!50001 DROP VIEW IF EXISTS `allseccionesconnoticias`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `allseccionesconnoticias` AS SELECT 
 1 AS `nombreSeccion`,
 1 AS `idSeccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(600) CHARACTER SET latin1 NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombreUsuario` varchar(100) CHARACTER SET latin1 NOT NULL,
  `correoUsuario` varchar(100) CHARACTER SET latin1 NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idNoticia` int(11) NOT NULL,
  `idComentarioPapa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `fk_comentario_usuario_idx` (`idUsuario`),
  KEY `fk_comentario_noticia_idx` (`idNoticia`),
  CONSTRAINT `fk_comentario_noticia` FOREIGN KEY (`idNoticia`) REFERENCES `noticia` (`idNoticia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (4,'Yo! nigguh sup?','2017-04-21 23:52:38','Daario Vald II','ruben_miklo@hotmail.com',0,19,0),(5,'Mayonesa macornic wee!','2017-05-15 15:03:26','Pedrito SolÃ¡','pedrito.sola@hotmail.com',0,19,0),(6,'Me gustan las feministas :v','2017-05-15 16:11:36','Francisco Moralet Lee','morales_garzagg@hotmail.com',4,19,0),(7,'Valiendo versh mi dinero!! :C','2017-05-15 18:20:11','Francisco Moralet Lee','morales_garzagg@hotmail.com',4,15,0),(8,'Ches morros, a las escuela kbrunes.','2017-05-15 18:22:40','Francisco Moralet Lee','morales_garzagg@hotmail.com',4,16,0),(9,'Stos mancos jaja','2017-05-15 18:27:02','Francisco Moralet Lee','morales_garzagg@hotmail.com',4,16,0),(10,'Mamalon!','2017-05-19 03:21:07','Pepe Alaman Vestuto','vestuto_pepe@hotmail.com',3,15,0),(11,'Ya me podre graduar yeeeey!!','2017-05-19 03:22:00','Pepe Alaman Vestuto','vestuto_pepe@hotmail.com',3,20,0),(12,'Prueba prueba prueba','2018-05-31 03:03:55','Darius Vald II','ruben_miklo@hotmail.com',0,20,0);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `idLike` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idNoticia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLike`),
  KEY `fk_like_noticia_idx` (`idNoticia`),
  KEY `fk_like_usuario_idx` (`idUsuario`),
  CONSTRAINT `fk_like_noticia` FOREIGN KEY (`idNoticia`) REFERENCES `noticia` (`idNoticia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,0,19),(2,0,20),(7,4,15),(8,4,19),(9,4,4),(10,3,19),(11,3,15);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimedia` (
  `idMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `idNoticia` int(11) NOT NULL,
  `urlMedia` varchar(100) NOT NULL,
  `tipoMedia` enum('VID','IMG') NOT NULL,
  PRIMARY KEY (`idMultimedia`),
  KEY `fk_multimedia_noticia_idx` (`idNoticia`),
  CONSTRAINT `fk_multimedia_noticia` FOREIGN KEY (`idNoticia`) REFERENCES `noticia` (`idNoticia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
INSERT INTO `multimedia` VALUES (1,7,'berserkanime1492467532.jpeg','IMG'),(2,7,'berserk_guts_sad1492467533.jpg','IMG'),(3,7,'berserk_guts_angry1492467533.jpg','IMG'),(5,15,'steam_comic1492485877.jpg','IMG'),(6,15,'gaben_nudes1492485485.jpg','IMG'),(7,15,'Gabe_newell1492486032.jpg','IMG'),(8,16,'cod_squad1492643805.jpg','IMG'),(9,16,'cod-players1492643805.jpg','IMG'),(10,16,'','IMG'),(11,16,'','VID'),(12,16,'','VID'),(13,16,'','VID'),(14,17,'jony_kun1492725632.jpg','IMG'),(15,17,'1527760042.jpg','IMG'),(16,17,'','IMG'),(17,17,'','VID'),(18,17,'','VID'),(19,17,'','VID'),(20,18,'','IMG'),(21,18,'','IMG'),(22,18,'','IMG'),(23,18,'','VID'),(24,18,'','VID'),(25,18,'','VID'),(26,14,'a_huevo_triunfo_el_mal_thyak1492802054.jpg','IMG'),(27,14,'ahorcado1492802109.jpg','IMG'),(28,14,'bronze_4ever1492802109.jpg','IMG'),(29,14,'','VID'),(30,14,'','VID'),(31,14,'','VID'),(32,19,'feminazi_triggered1492815906.jpg','IMG'),(33,19,'','IMG'),(34,19,'','IMG'),(35,19,'bruh_ma_weed1492815430.mp4','VID'),(36,19,'pirata_de_culiacan1492815431.mp4','VID'),(37,19,'','VID'),(38,20,'conspiracion_keanu1494889091.jpg','IMG'),(39,20,'rana_pepe_meme1494889091.jpg','IMG'),(40,20,'','IMG'),(41,20,'bruh_ma_weed1494889103.mp4','VID'),(42,20,'','VID'),(43,20,'','VID'),(44,21,'','IMG'),(45,21,'','IMG'),(46,21,'','IMG'),(47,21,'','VID'),(48,21,'','VID'),(49,21,'','VID'),(50,22,'','IMG'),(51,22,'','IMG'),(52,22,'','IMG'),(53,22,'','VID'),(54,22,'','VID'),(55,22,'','VID'),(56,23,'','IMG'),(57,23,'','IMG'),(58,23,'','IMG'),(59,23,'','VID'),(60,23,'','VID'),(61,23,'','VID'),(62,24,'','IMG'),(63,24,'','IMG'),(64,24,'','IMG'),(65,24,'','VID'),(66,24,'','VID'),(67,24,'','VID');
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `newultimasnoticiasvalidadas`
--

DROP TABLE IF EXISTS `newultimasnoticiasvalidadas`;
/*!50001 DROP VIEW IF EXISTS `newultimasnoticiasvalidadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `newultimasnoticiasvalidadas` AS SELECT 
 1 AS `idNoticia`,
 1 AS `titulo`,
 1 AS `descripcion`,
 1 AS `idSeccion`,
 1 AS `isEspecial`,
 1 AS `cintillo`,
 1 AS `seccion`,
 1 AS `imgNoti`,
 1 AS `autor`,
 1 AS `fechaReciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticia` (
  `idNoticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `texto` varchar(1300) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idSeccion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `isPublica` int(11) NOT NULL,
  `seccion` varchar(45) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `isEspecial` int(1) DEFAULT '0',
  `cintillo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idNoticia`),
  KEY `fk_usuario_idx` (`idUsuario`),
  KEY `fk_seccion_noticia_idx` (`idSeccion`),
  CONSTRAINT `fk_seccion_noticia` FOREIGN KEY (`idSeccion`) REFERENCES `seccion` (`idSeccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_noticia` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` VALUES (4,'Dark Souls a 14 pesos!','Dark Souls 3 a 14 pesos en Steam!!','Parece que los ingenieros de Steam la cagaron porque pusieron el videojuego de Dark Souls 3, el nuevecito papaw a tan solo 14 pesos omg! Apurense prros que se acaba pronto la promo de lo contrario gg no juegan Dark Souls 3 pero saben que? mejor no, no lo compren, este juego es para prros old school modafuckers de antaÃ±o y no para sucios niÃ±os rata virgenes leprosos como usted. Vayase al infierno con todo y familia, sangre sucia.','2017-04-12 13:42:57',5,0,1,'Videojuegos','Dario Val II',0,NULL),(5,'Wey de LMAD afirma haber sido el creador de Zelda BotW','Tipico puÃ±eton de LMAD cree que Nintendo le robaron sus ideas originales.','De nueva cuenta un wey random de la carrera de Multimedia y Animacion de la Fakiultad de Fisico y Mate cree y afirma que la empresa nipona de videojuegos Nintendo le robaron su idea conceptual para la creación del nuevo Zelda Brif of Di Walt porque el fue el primero en pensar en un Zelda de mundo abierto y porque se parece mucho a Skyrim.','2017-04-12 13:48:08',5,0,1,'Videojuegos','Dario Val II',0,NULL),(6,'Comunidad LMAD se une al movimiento de proteccion de waifus','-Protegan a las waifus-: es el lema del contingente.','Al parecer estos seres de dos dimensiones son altamente apreciados por integrantes de la carrera de LMAD, sectores de otros rubros y/o actividades como gamers, furrys, pokemones, amantes del k-pop se unen al movimiento de proteccion y cuidado de las waifus porque consideran que la expresion de amor a Ã©stos esta siendo fuertemente atacada por otros sectores de corriente conservadora-neonazi. La primera ministra de Gran BretaÃ±a ya dio sus primeras declaraciones sobre la postura audaz pero alarmante de la comunidad LMAD en la UANL: -El Brexit fue ocasionado principalmente porque los valores britanicos estan en sincronia con las waifus del mundo, a nombre de Inglaterra y reinos adyacentes estamos en fuerte amistad con la comunidad de LMAD por su valiente postura prowaifu. Mis respetos prros :v-.','2017-04-12 13:49:20',2,0,1,'FCFM','Dario Val II',0,NULL),(7,'El hiatus para el siguiente manga de Berserk es de 3 aÃ±os','Continua leyendo y te decimos quÃ© hacer durante el hiatus.','El dia de ayer se confirmo que el nuevo hiatus para el lanzamiento del siguiente capitulo del manga de Berserk sera de nada mas y nada menos que de 3 aÃ±os y medio! Y aqui te decimos que hacer en su espera:\r\n\r\n- Relee el manga de Berserk.\r\n- Vuelve a ver el anime de berserk.\r\n- Lee teorias locas en la seccion de Berserk en Reddit.\r\n- Crea teorias locas de Berserk en Reddit.\r\n- Vuelve a ver las cinco temporadas de Game Of Thrones.\r\n- Presiona a George Martin a que termine Vientos de Invierno.\r\n- Juega Dark Souls (porque si te gusta Berserk te tiene que gustar la saga Souls a huevo).\r\n- Lee el lore completo de Dark Souls y entiendele (no se como pero le vas a entender).\r\n- Hazte la paja cada 5 horas maximo, alivia el estres por la espera.\r\n- Estudia y pasa en primeras tus materias :).\r\n- Sigue tus sueÃ±os.','2017-04-21 15:29:36',1,0,1,'Internacional','Daario Vald II',1,'REPORTAJE ESPECIAL'),(8,'Golpe de Estado en FCFM','El Ingeniero y coordinador de la carrera de Multimedia y Animacion Digital ha consumado un golpe de Estado.','El Ingeniero y coordinador de la carrera de Multimedia y Animacion Digital ha consumado un golpe de Estado en contra del actual director de la FCFM Sergio Sepulveda a las 16:45 hrs hora del Pacifico. SegÃºn los ultimos informes reportan al menos 20 muertos en la envestida del coordinador de LMAD. Se espera mas noticias, mantenganse informado.\r\n\r\nACTUALIZACION\r\n\r\n*Rosas declara director y soberano de la facultad.\r\n\r\n*Los golpistas logran impedir el asalto de los refuerzos.\r\n\r\n*Muere dos integrantes de lmad en el tiroteo.\r\n\r\n*Se lleva a cabo fuerte tiroteo entre fuerzas del orden y los golpistas. Probablemente haya al menos 10 heridos y un muerto.\r\n\r\n*LLegan guardias de las facultades aledaÃ±as como refuerzo para contener y reprimir a los golpistas.\r\n\r\n*Se realizan las primeras detonaciones de arma de fuego. No hay heridos.\r\n\r\n*Guardias de la facultad se atrincheran en sus oficinas. Se presume que estan retenidos en contra de su voluntad por los golpistas.\r\n\r\n*Los golpistas realizan saqueos y violencia arbitraria por toda la facu, se presume que estan armados.\r\n\r\n* Rosas junto con su camarilla de lmads organizaron una manifestacion en el pozo.','2017-04-12 18:20:13',2,0,0,'FCFM','Dario Val II',0,NULL),(9,'Por robakill mato a su amigo','Un par de weyes que jugaban al famoso videojuego en linea League of Legends tuvieron un conflicto que termino en tragedia.','Dos fieles amigos que estaban jugando League of Legends como premade en rankeds, tuvieron un altercado que derivo en la muerte del otro por que el ahora occiso se fue de troll con Sona en botlane con el agresor y le robo el penta del Ãºltimo. El agresor confeso a las autoridades que este hecho le encabrono mucho porque era su penta y ademas ranked, al parecer, esto es un acto imperdonable con pena capital para la comunidad rata gamer del mundo occidental por lo que el agresor de nombre Carlos Raton tomo la batuta para ajusticiar a su amigo auspiciado por las autoridades morales de RIOT y la comunidad de League of Legends.','2017-04-12 18:36:05',5,0,0,'Videojuegos','Dario Val II',0,NULL),(10,'Nueva toeria de GoT afirma que Jon Snow no es quien dice ser','En efecto, un usuario del fandom de la popular serie de George Martin afirma que Jon Snow no es Jon Snow.','Un usuario de un grupo de facebook que debate teorias sin sustento de la popular serie Juego de Tronos producida por George RR Martin, afirma que Jon Snow no es Jon Snow sino que es ni nada mas ni nada menos que el Rey Loco, osea el wey que reinaba antes de Robert B. (omitimos el nombre de dicho rey porque no tiene caso si al cabo todo el mundo lo conoce como el Rey Loco, ni su nombre saben zoquetes). SegÃºn el usuario que se hace llamar -Khalessi- tiene fuertes argumentos para ligar al Rey Loco con Jon Snow, una de esas afirmaciones es que el Rey Loco no murio sino un doble que tenia en caso de que Jaime Lannister lo quisiera matar, escapo a traves del mar hasta Braavos y ahi se entreno como Hombre Sin Rostro y regreso a Westeros con el rostro de Jon Snow. Tiene bastante sentido, veda?','2017-04-12 18:47:02',1,0,0,'Internacional','Dario Val II',0,NULL),(11,'PeÃ±a Nieto se declara pansexual','El presidente de Mexico Enrique Pena Nieto se declara abiertamente pansexual.','El presidente de Mexico Enrique Pena Nieto se declara abiertamente pansexual despues de que abrio una cuenta de tumblr con la finalidad de tener mas acercamiento a la comunidad hipster-progesista-kitsh pro capitalismoStarbucks de Mexico y asi ha expresado en su comunicado: -Bueno ssste, quise abrirme una cuenta en la red social de tumblr que me dijeron que era como Facebook pero mas aca, mas elitista. Bueno y sste, la abri y al dia siguiente senti que, como que... no era yo, no me sentia yo realmente y luego vi en un post de alguien que se declaraba pansexual y me senti completamente identificado con el. Fue una bonita experiencia intrapersonal asi como la que tuvo Jesus en la cruz. Estuvo chido we (Y)-.\r\n\r\nLos pansexuales del pais que no saben que lo son pero de todos modos se dicen serlo han expresado su admiracion por la valentia del presidente mexicano en un mundo oprimido por multinacionales que quieren experimentar con el elote.','2017-04-13 12:56:54',3,0,1,'Nacional','Dario Val II',0,NULL),(12,'La nueva pelicula del payaso Eso se ve conmadre','La nueva pelicula de Eso el payaso como lo conocen en Hispanoamerica llegarÃ¡ a los cines en Septiembre','Los criticos de cine de Twitter han asegurado que la nueva pelicula del payaso Eso (de hecho se llama Pennywise pero la audiencia ignorante le sigue diciendo Eso porque no leen libros) se viene conmadre. Sus declaraciones de la nueva peli tienen altas expectativas porque dicen que ahora si que es mas fiel al libro aunque el libro sea mejor y para fines del bien comun leyeramos la novela para no quedar como pendejos en el cine diciendole Eso al payaso cuando es Pennywise (se pronuncia Peniuais).','2017-04-12 19:09:16',1,0,0,'Internacional','Dario Val II',0,NULL),(14,'RITO anuncia el fin de League Of Legends','La compaÃ±Ã­a que desarrollÃ³ el popular juego de LoL anunciÃ³ esta tarde el fin del desarrollo de League Of Legends y la cancelacion de todo material del fandom a partir del 18 de marzo de 2018. ','La copia de Blizzard por fin dio a conocer la fecha del fin de su opus magnus del videojuego League Of Legends producto de las recientes quejas y demandas de la OMS que acusa a la compaÃ±ia de videojuegos de crear y expander un peligroso y contagioso virus tÃ³xico que afecta principalmente a niÃ±os convirtiendoles en ratas toxicas de mal vocabulario. Sus acusaciones estan sustentadas primeramente por el elevado indice de reprobados en kinder y escuelas primarias y desercion escolar en Universidades donde jovenes adultos dejan sus estudios pagado por sus padres para convertirse en jugadores de LoL profesional y llegar a Corea (no del norte) a escuchar su banda favorita de Imagine Dragons. Este anunciÃ³ provoco el suicido masivo de niÃ±os en escuelas, el mas reciente hecho se suscitÃ³ en una escuela de Michigan. Estados Unidos donde un morro acompaÃ±ado de otro chamaco se suicidaron a pajadas en la casa de uno. Se cree que eran duo bot y tenian elo alto.','2017-04-21 14:20:00',5,0,1,'Videojuegos','Daario Vald II',1,'ÃšLTIMA HORA'),(15,'Ofertas de Steam provoca la caida de bolsas de Europa y Asia','Steam lanzo ofertas de Verano de hasta 300% de descuento.','Las ofertas de verano de Steam causaron el desplome de la bolsas mas importantes del mundo como Wall Street, New Jones y la que tiene siglas parecidas a la NASCAR. Sus ofertones chidoris de hasta 300 por ciento de descuento hicieron furor en los usuarios de las redes que saturaron la pagina y actualmente esta caida. Expertos en materia economica especulan que esto provoque una burbuja digital similar a la inmobiliaria pero digital, o sea, dentro de la compu, que diera paso a una nueva crisis economica de 1929 y 2008 donde gobiernos del mundo tuvieron que inyectar capital a sus economias para revitalizarlas y no caer en recesion.','2017-04-20 16:54:52',1,0,1,'Internacional','Darion Vald II',0,NULL),(16,'Jugadores de CoD se dicen listos para la Tercera Guerra Mundial','Miles de jugadores de la popular saga de Call Of Duty dicen estar listos para la Tercera Guerra Mundial.','Los recientes conflictos entre Washington y el Kremlin a su vez con sus contrapartes de China y Corea del Norte han puesto a miles de niÃ±os rata, digo, jugadores de Call Of Duty a prepararse ante una nueva guerra mundial aka a la WW2 como se juega en CoD: World at War. Estos valientes niÃ±os... jugadores semiprofesionales aseguran que las miles de horas jugadas en el juego les han dado suficiente experiencia militar para entrar en un ambiente de combate real y a gran escala con solo dos cargadores para rifle M4, un cuchillo, una linea de comunicacion por Teamspeak y ademÃ¡s, no scope. Ellos creen que una nueva guerra mundial entre USA y Rusia/Corea del Norte es el modo mÃ¡s dificil que puedan jugar en un CoD y esperan ganar el logro que tiene como recompensa por pasar la mision y mejorar sus stats en la comunidad de Call of Duty.','2017-04-19 18:17:17',5,0,1,'Videojuegos','Darion Vald II',0,NULL),(17,'Nueva carrera de FCFM: Antropologo de anime y manga','La nueva carrera de la Facultad de Fisico Matematicas se ve prometedora.','FCFM a la vanguardia! Consciente de la fascinaciÃ³n (enajenacion) de muchos jovenes por la cultura del anime y manga que sin duda esta llevando a la autodestruccion de esta generacion y un retroceso intelectual de por lo menos 300 aÃ±os la facultad mas querida de la UANL inauguro el 15 de abril su nueva carrera de estudios de la cultura del anime y manga llamada: Antropologia aplicada de anime y manga. Con duracion de 2 aÃ±os y medio.','2017-04-19 00:25:06',2,4,0,'FCFM','Francisco Moralet Lee',0,NULL),(18,'Chairo formula una nueva version del comunismo a partir de la mafia del poder','Chairo de la UNAM formulo una version mejorada del comunismo stalinista a partir de la mafia del poder.','Nuevamente el comunismo y la Guerra Fria esta en boca de todos despues de que un chairo de 2 semestre de la carrera de Filosofia de la UNAM formulo una nueva teorÃ­a comunista mejor que la de Stalin, Mao y Castro juntos, la llamo: comunismo libertario anticapitalista machista opresor viva Putin. Esta version da impulso a la economia del hogar donde la comida del desayuno y cena es de produccion colectiva, el baÃ±o del pueblo y el internet privado a publico libre de contraseÃ±a de wifi. Un comunismo con mujerzuelas y juegos de mesa :v','2017-04-19 00:20:02',3,4,0,'Nacional','Francisco Moralet Lee',0,NULL),(19,'Feminista dice que la ropa es un invento del patriarcado','Una feminazi del colectivo feminazi contra el patriarcado opresor machista sucio derechista lo asegura.','Uan feminazi random con pelo en pecho y axilas pintadas aseguro el dÃ­a de hoy por la tarde que la ropa es un invento del patriarcado para oprimir la sexualidad de la mujer y Ã©stas no presuman su cuerpo a otras mujeres para evitar que caigan en actividades lÃ©sbicas. Eso explica el porque el colectivo Femmen siempre protesta con las tetas al aire, el exhibicionismo es parte de la naturaleza de la mujer, esas fueron las palabras de la feminazi.','2017-04-21 18:14:04',1,0,1,'Internacional','Daario Vald II',0,'NONE'),(20,'Regresan las 5tas infinitas a FCFM','Ahora podrÃ¡s cursas tus quintas cuantas veces quieras.','Al parecer la DirecciÃ³n de FCFM comienza a proponerse a que las famosas quintas infinitas regresen a la facu en vista que muchos alumnos de la instituciÃ³n estan han reprobado mayor cantidad de veces despuÃ©s de que se eliminÃ³ esta peculiaridad.','2017-05-16 14:48:18',2,4,1,'FCFM','Francisco Moralet Lee',0,'NONE'),(21,'Noticia prueba','Lorem Ipsum','Bla bla bla','2018-05-28 23:46:46',4,0,0,'','Darius Vald II',0,'NONE'),(22,'Otra prueba','Lorem Ipsum','Hajklsklsjkljklasdadasd','2018-05-31 00:24:52',7,0,0,'','Darius Vald II',0,'NONE'),(23,'Mas prueba editado','Lololololo yhjasjdjhsdsd','Yeeeeeeeeeeeeeeey Amos Monterrey','2018-05-31 03:48:32',10,0,0,'Local','Darius Vald II',1,'ÚLTIMA HORA'),(24,'Mas prueba','Lololololo','Yeeeeeeeeeeeeeeey','2018-05-31 00:27:26',10,0,0,'','Darius Vald II',1,'ÚLTIMA HORA');
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insertMultimediaReferences AFTER INSERT ON noticia
FOR EACH ROW BEGIN 
	INSERT INTO multimedia(idMultimedia, idNoticia, urlMedia, tipoMedia)
    VALUES (null, new.idNoticia, '', 2), (null, new.idNoticia, '', 2), (null, new.idNoticia, '', 2),
    (null, new.idNoticia, '', 1), (null, new.idNoticia, '', 1), (null, new.idNoticia, '', 1);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigDeleteMultimediaReferences BEFORE DELETE ON noticia
FOR EACH ROW BEGIN
	DELETE FROM multimedia WHERE idNoticia = old.idNoticia;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `noticiasvalidadas`
--

DROP TABLE IF EXISTS `noticiasvalidadas`;
/*!50001 DROP VIEW IF EXISTS `noticiasvalidadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `noticiasvalidadas` AS SELECT 
 1 AS `idNoticia`,
 1 AS `titulo`,
 1 AS `descripcion`,
 1 AS `idSeccion`,
 1 AS `nombreSeccion`,
 1 AS `autor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccion` (
  `idSeccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreSeccion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idSeccion`),
  KEY `fk_usuario_idx` (`idUsuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (1,'Internacional',0),(2,'FCFM',0),(3,'Nacional',0),(4,'Universidad',0),(5,'Videojuegos',0),(7,'Local',0),(8,'Mamadas',0),(10,'Mundo mundial',4),(11,'Prueba',0);
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trig_borrarRefSeccion BEFORE DELETE ON seccion
FOR EACH ROW BEGIN
	DELETE FROM noticia WHERE idSeccion = old.idSeccion;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;

--
-- Temporary view structure for view `ultimasnoticiasnovalidadas`
--

DROP TABLE IF EXISTS `ultimasnoticiasnovalidadas`;
/*!50001 DROP VIEW IF EXISTS `ultimasnoticiasnovalidadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ultimasnoticiasnovalidadas` AS SELECT 
 1 AS `idNoticia`,
 1 AS `titulo`,
 1 AS `idSeccion`,
 1 AS `seccion`,
 1 AS `fecha`,
 1 AS `idUsuario`,
 1 AS `autor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ultimasnoticiasvalidadas`
--

DROP TABLE IF EXISTS `ultimasnoticiasvalidadas`;
/*!50001 DROP VIEW IF EXISTS `ultimasnoticiasvalidadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ultimasnoticiasvalidadas` AS SELECT 
 1 AS `idNoticia`,
 1 AS `titulo`,
 1 AS `descripcion`,
 1 AS `idSeccion`,
 1 AS `isEspecial`,
 1 AS `cintillo`,
 1 AS `seccion`,
 1 AS `autor`,
 1 AS `FechaReciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `apellidos` varchar(100) CHARACTER SET latin1 NOT NULL,
  `correo` varchar(70) CHARACTER SET latin1 NOT NULL,
  `contrasenia` varchar(100) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `fechaNacimiento` varchar(35) CHARACTER SET latin1 NOT NULL,
  `tipoUsuario` varchar(45) CHARACTER SET latin1 NOT NULL,
  `imgAvatar` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `imgPortada` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'Darius','Vald II','ruben_miklo@hotmail.com','anillo123','83795634','01-01-2017','Administrador','mago_deal_with_it1492824536.png','1527742779.png'),(1,'Jorge','Malparido','nigga69@hotmail.com','holamundo123','','23-07-1992','Normal',NULL,NULL),(2,'Lucas','Manpower Almeida','luquitasjeje@hotmail.com','elucas009','','15-10-1987','Normal',NULL,NULL),(3,'Pepe','Alaman Vestuto','vestuto_pepe@hotmail.com','pepe1023','','26-12-1993','Normal',NULL,NULL),(4,'Francisco','Moralet Lee','morales_garzagg@hotmail.com','f0ac65476b47ee2ff2e6975d012f188e','8374662684','17-08-1988','Reportero','doge1495653787.jpg','50_shades_of_sasha_grey1492560647.jpg'),(5,'Juan','De la Garza Villanueva','villanueva.lameraverga@hotmail.com','villaverga','8378737398','9-Julio-1987','Normal',NULL,NULL),(6,'Roberto S.','Negrete','negrget843743@gmail.com','00000011111','','11-Octubre-1980','Normal',NULL,NULL),(7,'Mario','Valedor Gay','gay_69@hotmail.com','gayjaja69','','17-Abril-1960','Normal',NULL,NULL),(8,'Justo','Almaguer Sierra','sierrarox33@hotmail.com','sierra100','','22-Diciembre-1958','Reportero',NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigDeleteNoticiasFromUser BEFORE DELETE ON usuario
FOR EACH ROW BEGIN
	DELETE FROM noticia WHERE idUsuario = old.idUsuario AND isPublica = 0;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaNacimiento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoUsuario` enum('Administradror','Reportero','Normal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Normal',
  `imgAvatar` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgPortada` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'basebdm'
--

--
-- Dumping routines for database 'basebdm'
--
/*!50003 DROP PROCEDURE IF EXISTS `busquedaNoticias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `busquedaNoticias`(IN cadena varchar(100))
BEGIN
SELECT NOTI.idNoticia, NOTI.titulo, NOTI.descripcion, NOTI.fecha, CONCAT(USER.nombre, ' ', USER.apellidos) AS autor, 
NOTI.idUsuario, SECC.nombreSeccion AS seccion, NOTI.idSeccion, NOTI.isPublica
FROM noticia NOTI
INNER JOIN usuario USER ON NOTI.idUsuario = USER.idUsuario
INNER JOIN seccion SECC ON NOTI.idSeccion = SECC.idSeccion
WHERE NOTI.titulo LIKE CONCAT('%', cadena, '%') OR autor LIKE CONCAT('%', cadena, '%') AND NOTI.isPublica = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `busquedaNoticiasPorFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `busquedaNoticiasPorFecha`(
IN fechaFrom varchar(50), 
IN fechaTo varchar(50))
BEGIN
SELECT NOTI.idNoticia, NOTI.titulo, NOTI.descripcion, NOTI.fecha, SECC.nombreSeccion AS seccion, NOTI.idSeccion, 
CONCAT(USER.nombre, ' ', USER.apellidos) AS autor, NOTI.idUsuario
FROM noticia NOTI 
INNER JOIN usuario USER ON NOTI.idUsuario = USER.idUsuario
INNER JOIN seccion SECC ON NOTI.idSeccion = SECC.idSeccion
WHERE isPublica = 1 AND fecha BETWEEN fechaFrom AND fechaTo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteComentario`(IN idCome int)
BEGIN
DELETE FROM comentario
WHERE idCome = idComentario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteLike` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteLike`(IN id int)
BEGIN
DELETE FROM basebdm.like
WHERE id = idLike;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteNoticia` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteNoticia`(IN id int)
BEGIN
DELETE FROM noticia
WHERE id = idNoticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteSeccion` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSeccion`(IN id int)
BEGIN
DELETE FROM seccion
WHERE id = idSeccion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteUsuario` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUsuario`(IN id int)
BEGIN
DELETE FROM usuario
WHERE id = idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `insertComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertComentario`(
IN textt varchar(600),
IN nombre varchar(100),
IN correo varchar(100),
IN idusuario int,
IN idnoticia int,
IN idpapa int)
BEGIN
INSERT INTO comentario(idComentario, texto, fecha, nombreUsuario, correoUsuario, idUsuario, idNoticia, idComentarioPapa)
VALUES (null, textt, NOW(), nombre, correo, idusuario, idnoticia, idpapa);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLike` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLike`(
IN idusuario int, 
IN idnoticia int)
BEGIN
INSERT INTO basebdm.like(idLike, idUsuario, idNoticia)
VALUES(null, idusuario, idnoticia);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertMultimedia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMultimedia`(
IN idNoti int, 
IN url varchar(100), 
IN tipo varchar(10))
BEGIN
INSERT INTO multimedia(idMultimedia, idNoticia, urlMedia, tipoMedia)
VALUES (null, idNoti, url, tipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertNoticia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertNoticia`(
IN title varchar(100), 
IN summary varchar(300),
IN textcomplete varchar(1300),
IN idseccion int,
IN seccion varchar(45),
IN idusuario int,
IN reportero varchar(100),
IN ispublica int,
IN isespecial int,
IN cinti varchar(50))
BEGIN
INSERT INTO noticia(
idNoticia, titulo, descripcion,
texto, fecha, idSeccion, idUsuario,
isPublica, seccion, autor, isEspecial, cintillo)
VALUES(null, title, summary, textcomplete, NOW(), idseccion, idusuario, ispublica, seccion, reportero, isespecial, cinti);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSeccion` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSeccion`(
IN titulo varchar(70),
IN idUser int)
BEGIN
INSERT INTO seccion(idSeccion, nombreSeccion, idUsuario)
VALUES (null, titulo, idUser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUsuario` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUsuario`(
IN nombre varchar(100),
IN apellidos varchar(100),
IN correo varchar(100),
IN contra varchar(100),
IN telefon varchar(30),
IN fechaNac varchar(50),
IN tipo varchar(50))
BEGIN
INSERT INTO usuario(
idUsuario, 
nombre, 
apellidos, 
correo, 
contrasenia, 
telefono,
fechaNacimiento,
tipoUsuario)
VALUES (null, nombre, apellidos, correo, contra, telefon, fechaNac, tipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerComentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerComentarios`(IN idNoti int)
BEGIN
SELECT COMEN.idComentario, COMEN.texto, COMEN.fecha, CONCAT(COMEN.nombreUsuario, ' ') AS autor, COMEN.idUsuario, USER.imgAvatar
FROM comentario COMEN
INNER JOIN usuario USER ON USER.idUsuario = COMEN.idUsuario
WHERE COMEN.idComentarioPapa = 0 AND COMEN.idNoticia = idNoti;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerComentariosMixtos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerComentariosMixtos`(IN idNoti int)
BEGIN
IF EXISTS (SELECT COMEN.idComentario, COMEN.texto, COMEN.fecha, CONCAT(USER.nombre, ' ', USER.apellidos) AS autor, COMEN.idUsuario, USER.imgAvatar
FROM comentario COMEN INNER JOIN usuario USER ON USER.idUsuario = COMEN.idUsuario
WHERE COMEN.idComentarioPapa = 0 AND COMEN.idNoticia = idNoti) THEN
SELECT COMEN.idComentario, COMEN.texto, COMEN.fecha, CONCAT(USER.nombre, ' ', USER.apellidos) AS autor, COMEN.idUsuario, USER.imgAvatar
FROM comentario COMEN INNER JOIN usuario USER ON USER.idUsuario = COMEN.idUsuario
WHERE COMEN.idComentarioPapa = 0 AND COMEN.idNoticia = idNoti;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerDatosLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDatosLogin`(IN `nombreIn` VARCHAR(100), IN `contraIn` VARCHAR(100))
SELECT idUsuario, nombre, apellidos, correo, tipoUsuario, imgAvatar
FROM usuario
WHERE nombreIn = correo AND contraIn = contrasenia ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerDatosUsuario` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDatosUsuario`(
IN id int)
BEGIN
SELECT idUsuario, nombre, apellidos, fechaNacimiento, telefono, tipoUsuario, correo, contrasenia, imgAvatar, imgPortada
FROM usuario
WHERE id = idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerLikesByNoti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerLikesByNoti`(IN idNoti int)
BEGIN
SELECT idLike, idNoticia, idUsuario
FROM basebdm.like
WHERE idNoticia = idNoti;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerMultimediaById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerMultimediaById`(IN idNoti int)
BEGIN
SELECT idMultimedia, idNoticia, urlMedia, tipoMedia
FROM multimedia
WHERE idNoticia = idNoti;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerNoticiaCompletaById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNoticiaCompletaById`(IN id int)
BEGIN
SELECT NOTI.idNoticia, NOTI.titulo, NOTI.texto, NOTI.idUsuario, 
SECC.nombreSeccion AS seccion, NOTI.idSeccion, CONCAT(USUA.nombre,' ', USUA.apellidos) AS autor, 
NOTI.fecha, NOTI.descripcion, NOTI.isPublica, NOTI.isEspecial, NOTI.cintillo
FROM noticia NOTI, seccion SECC, usuario USUA
WHERE id = NOTI.idNoticia AND NOTI.idUsuario = USUA.idUsuario
LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerNoticias` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNoticias`()
BEGIN
SELECT idNoticia, titulo, descripcion, fecha
FROM noticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerNoticiasBySeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNoticiasBySeccion`(IN idSecc int)
BEGIN
SELECT NOTI.idNoticia, NOTI.titulo, NOTI.descripcion, 
SECC.nombreSeccion AS seccion, NOTI.idSeccion, MAX(NOTI.fecha) AS 'fechaReciente', CONCAT(USER.nombre,' ', USER.apellidos) AS autor, MTM.urlMedia AS imgNoti
FROM noticia NOTI
INNER JOIN usuario USER ON NOTI.idUsuario = USER.idUsuario
INNER JOIN seccion SECC ON NOTI.idSeccion = SECC.idSeccion
INNER JOIN multimedia MTM ON NOTI.idNoticia = MTM.idNoticia
WHERE isPublica = 1 AND NOTI.idSeccion = idSecc
GROUP BY fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerNoticiasConMasComens` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNoticiasConMasComens`()
BEGIN
SELECT idNoticia, titulo, Cantidad, descripcion, fechaReciente, autor, idUsuario, idSeccion, seccion, isEspecial, cintillo, imgNoti
FROM
  (SELECT
	NOTI.idNoticia AS idNoticia, NOTI.titulo AS titulo, COUNT(COM.idNoticia) AS Cantidad, 
    NOTI.descripcion AS descripcion, NOTI.fecha AS fechaReciente, CONCAT(USER.nombre, ' ', USER.apellidos) AS autor, 
    NOTI.idSeccion AS idSeccion, NOTI.idUsuario AS idUsuario, SECC.nombreSeccion AS seccion, 
    NOTI.isEspecial AS isEspecial, NOTI.cintillo AS cintillo, MTM.urlMedia AS imgNoti
    FROM 
       comentario COM
       INNER JOIN noticia NOTI ON COM.idNoticia = NOTI.idNoticia
       INNER JOIN seccion SECC ON NOTI.idSeccion = SECC.idSeccion
       INNER JOIN usuario USER ON NOTI.idUsuario = USER.idUsuario
       INNER JOIN multimedia MTM ON NOTI.idNoticia = MTM.idNoticia
    GROUP BY 
        NOTI.idNoticia
  ) AS grp
GROUP BY Cantidad DESC, idNoticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerNoticiasConMasLikes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNoticiasConMasLikes`()
BEGIN
SELECT idNoticia, titulo, Cantidad, descripcion, fechaReciente, autor, idUsuario, idSeccion, seccion, isEspecial, cintillo, imgNoti
FROM
  (SELECT
	LIK.idLike AS idLike, LIK.idNoticia AS idNoticia, NOTI.titulo AS titulo, COUNT(LIK.idNoticia) AS Cantidad, 
    NOTI.descripcion AS descripcion, NOTI.fecha AS fechaReciente, CONCAT(USER.nombre, ' ', USER.apellidos) AS autor, 
    NOTI.idSeccion AS idSeccion, NOTI.idUsuario AS idUsuario, SECC.nombreSeccion AS seccion, 
    NOTI.isEspecial AS isEspecial, NOTI.cintillo AS cintillo, MTM.urlMedia AS imgNoti
    FROM 
       basebdm.like LIK
       INNER JOIN noticia NOTI ON LIK.idNoticia = NOTI.idNoticia
       INNER JOIN usuario USER ON LIK.idUsuario = USER.idUsuario
       INNER JOIN seccion SECC ON NOTI.idSeccion = SECC.idSeccion
       INNER JOIN multimedia MTM ON NOTI.idNoticia = MTM.idNoticia 
    GROUP BY 
        NOTI.idNoticia
  ) AS grp
GROUP BY Cantidad DESC, idNoticia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerNoticiasNOValidadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNoticiasNOValidadas`()
BEGIN
SELECT idNoticia, titulo, fecha, idSeccion, seccion, idUsuario, autor
FROM noticia
WHERE isPublica = 0
GROUP BY fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerNoticiasValidadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerNoticiasValidadas`()
BEGIN
SELECT idNoticia, titulo, descripcion, fecha
FROM noticia
WHERE isPublica = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerSeccionById` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerSeccionById`(IN id int)
BEGIN
SELECT nombreSeccion
FROM seccion
WHERE idSeccion = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerSecciones` */;
ALTER DATABASE `basebdm` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerSecciones`()
BEGIN
SELECT idSeccion, nombreSeccion, idUsuario
FROM seccion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `basebdm` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerUltimasNoticiasValidadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerUltimasNoticiasValidadas`()
BEGIN
SELECT idNoticia, titulo, descripcion, seccion, MAX(fecha) AS 'FechaReciente'  
FROM noticia
WHERE isPublica = 1
GROUP BY fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateMultimediaById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMultimediaById`(
IN idMulti int,
IN idNoti int,
IN url varchar(100),
IN tipo varchar(20))
BEGIN
UPDATE multimedia
SET urlMedia = url,
tipoMedia = tipo
WHERE idMultimedia = idMulti AND idNoticia = idNoti;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateNoticia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateNoticia`(
IN idNoti int,
IN title varchar(100), 
IN summary varchar(300),
IN textcomplete varchar(1300),
IN idseccion int,
IN seccionVar varchar(45),
IN idusuario int,
IN reportero varchar(100),
IN ispublica int,
IN isespecial int,
IN cinti varchar(50))
BEGIN
UPDATE noticia
SET titulo = title,
descripcion = summary, 
texto = textcomplete,
idSeccion = idseccion,
seccion = seccionVar,
idUsuario = idusuario,
autor = reportero,
isPublica = ispublica,
isEspecial = isespecial,
cintillo = cinti
WHERE idNoticia = idNoti;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSeccion`(
IN idSec int,
IN title varchar(100))
BEGIN
UPDATE seccion
SET nombreSeccion = title
WHERE idSeccion = idSec;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUsuarioById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUsuarioById`(
IN id int,
IN nombreU varchar(100),
IN apellidosU varchar(100),
IN correoU varchar(100),
IN contraU varchar(100),
IN telefonoU varchar(30),
IN fechaNacU varchar(50),
IN tipoU varchar(50),
IN imgAva varchar(100),
IN imgPort varchar(100))
BEGIN
UPDATE usuario
SET nombre = nombreU,
apellidos = apellidosU, 
correo = correoU,
contrasenia = contraU,
telefono = telefonoU,
fechaNacimiento = fechaNacU,
tipoUsuario = tipoU,
imgAvatar = imgAva,
imgPortada = imgPort
WHERE idUsuario = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `allsecciones`
--

/*!50001 DROP VIEW IF EXISTS `allsecciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allsecciones` AS select `secc`.`idSeccion` AS `idSeccion`,`secc`.`nombreSeccion` AS `nombreSeccion`,`secc`.`idUsuario` AS `idUsuario` from `seccion` `secc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allseccionesconnoticias`
--

/*!50001 DROP VIEW IF EXISTS `allseccionesconnoticias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allseccionesconnoticias` AS select distinct `secc`.`nombreSeccion` AS `nombreSeccion`,`secc`.`idSeccion` AS `idSeccion` from (`seccion` `secc` join `noticia` `noti` on((`secc`.`idSeccion` = `noti`.`idSeccion`))) where (`noti`.`isPublica` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `newultimasnoticiasvalidadas`
--

/*!50001 DROP VIEW IF EXISTS `newultimasnoticiasvalidadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `newultimasnoticiasvalidadas` AS select `noti`.`idNoticia` AS `idNoticia`,`noti`.`titulo` AS `titulo`,`noti`.`descripcion` AS `descripcion`,`noti`.`idSeccion` AS `idSeccion`,`noti`.`isEspecial` AS `isEspecial`,`noti`.`cintillo` AS `cintillo`,`secc`.`nombreSeccion` AS `seccion`,`mult`.`urlMedia` AS `imgNoti`,concat(`user`.`nombre`,' ',`user`.`apellidos`) AS `autor`,max(`noti`.`fecha`) AS `fechaReciente` from (((`noticia` `noti` join `usuario` `user`) join `seccion` `secc`) join `multimedia` `mult`) where ((`user`.`idUsuario` = `noti`.`idUsuario`) and (`secc`.`idSeccion` = `noti`.`idSeccion`) and (`mult`.`idNoticia` = `noti`.`idNoticia`) and (`noti`.`isPublica` = 1)) group by `noti`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `noticiasvalidadas`
--

/*!50001 DROP VIEW IF EXISTS `noticiasvalidadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `noticiasvalidadas` AS select `noti`.`idNoticia` AS `idNoticia`,`noti`.`titulo` AS `titulo`,`noti`.`descripcion` AS `descripcion`,`noti`.`idSeccion` AS `idSeccion`,`secc`.`nombreSeccion` AS `nombreSeccion`,concat(`user`.`nombre`,' ',`user`.`apellidos`) AS `autor` from ((`noticia` `noti` join `usuario` `user`) join `seccion` `secc`) where ((`user`.`idUsuario` = `noti`.`idUsuario`) and (`secc`.`idSeccion` = `noti`.`idSeccion`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ultimasnoticiasnovalidadas`
--

/*!50001 DROP VIEW IF EXISTS `ultimasnoticiasnovalidadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ultimasnoticiasnovalidadas` AS select `noti`.`idNoticia` AS `idNoticia`,`noti`.`titulo` AS `titulo`,`noti`.`idSeccion` AS `idSeccion`,`secc`.`nombreSeccion` AS `seccion`,`noti`.`fecha` AS `fecha`,`noti`.`idUsuario` AS `idUsuario`,concat(`user`.`nombre`,' ',`user`.`apellidos`) AS `autor` from ((`noticia` `noti` join `usuario` `user`) join `seccion` `secc`) where ((`user`.`idUsuario` = `noti`.`idUsuario`) and (`secc`.`idSeccion` = `noti`.`idSeccion`) and (`noti`.`isPublica` = 0)) group by `noti`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ultimasnoticiasvalidadas`
--

/*!50001 DROP VIEW IF EXISTS `ultimasnoticiasvalidadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ultimasnoticiasvalidadas` AS select `noti`.`idNoticia` AS `idNoticia`,`noti`.`titulo` AS `titulo`,`noti`.`descripcion` AS `descripcion`,`noti`.`idSeccion` AS `idSeccion`,`noti`.`isEspecial` AS `isEspecial`,`noti`.`cintillo` AS `cintillo`,`secc`.`nombreSeccion` AS `seccion`,concat(`user`.`nombre`,' ',`user`.`apellidos`) AS `autor`,max(`noti`.`fecha`) AS `FechaReciente` from ((`noticia` `noti` join `usuario` `user`) join `seccion` `secc`) where ((`user`.`idUsuario` = `noti`.`idUsuario`) and (`secc`.`idSeccion` = `noti`.`idSeccion`) and (`noti`.`isPublica` = 1)) group by `noti`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-11 18:36:20
