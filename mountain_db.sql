# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: california_fourteeners
# Generation Time: 2017-12-09 22:05:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table mountains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mountains`;

CREATE TABLE `mountains` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `elevation` int(11) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mountains` WRITE;
/*!40000 ALTER TABLE `mountains` DISABLE KEYS */;

INSERT INTO `mountains` (`id`, `name`, `elevation`, `lat`, `lng`)
VALUES
	(1,'Mount Whitney',14497,36.578602,-118.292999),
	(2,'White Mountain Peak',14246,37.634399,-118.254700),
	(3,'Mount Williamson',14375,36.656101,-118.310303),
	(4,'Mount Shasta',14162,41.410000,-122.195000),
	(5,'North Palisade',14242,37.094101,-118.514397),
	(6,'Starlight Peak',14220,37.095100,-118.514198),
	(7,'Mount Sill',14153,37.094398,-118.501900),
	(8,'Polemonium Peak',14100,37.093601,-118.511101),
	(9,'Mount Russell',14088,36.590801,-118.287804),
	(10,'Split Mountain',14058,37.020802,-118.421402),
	(11,'Mount Langley',14026,36.523300,-118.237999),
	(12,'Mount Tyndall',14018,36.655602,-118.336098),
	(13,'Middle Palisade',14012,37.070000,-118.469200),
	(14,'Mount Muir',14012,36.563900,-118.291100),
	(15,'Thunderbolt Peak',14003,37.098099,-118.516701);

/*!40000 ALTER TABLE `mountains` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mountains_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mountains_routes`;

CREATE TABLE `mountains_routes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `mountain_id` mediumint(9) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `difficulty` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mountain_id` (`mountain_id`),
  CONSTRAINT `mountains_routes_ibfk_1` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mountains_routes` WRITE;
/*!40000 ALTER TABLE `mountains_routes` DISABLE KEYS */;

INSERT INTO `mountains_routes` (`id`, `mountain_id`, `name`, `difficulty`)
VALUES
	(1,1,'Direct East Face','5.10d'),
	(2,1,'East Buttress','5.8'),
	(3,1,'Mountaineer\'s','3'),
	(4,1,'Whitney Trail','1'),
	(5,1,'North Face','3'),
	(6,1,'Hairline','5.1'),
	(7,2,'East Side','2'),
	(8,2,'West Ridge','3'),
	(9,3,'West Face','3'),
	(10,3,'The Long Twisting Rib','5.4'),
	(11,3,'Northeast Ridge','5.6'),
	(12,3,'Southeast Ridge','2'),
	(13,4,'Avalanche Gulch','3'),
	(14,4,'Hotlum Glacier','4'),
	(15,4,'Sargents Ridge','3'),
	(16,4,'Whitney-Bolam Ridge','2'),
	(17,4,'Casaval Ridge','4'),
	(18,4,'Clear Creek','1'),
	(19,4,'Green Butte Ridge','3'),
	(20,5,'U-Notch','5.4'),
	(21,5,'West Chute','4'),
	(22,5,'Starlight Buttress','5.5'),
	(23,6,'Clyde Couloir','5.7'),
	(24,6,'Northwest Chute','4'),
	(25,7,'Swiss Arête','5.6'),
	(26,7,'North Couloir','4'),
	(27,7,'Southwest slope','3'),
	(28,7,'Northwest Face','4'),
	(29,8,'LeConte\'s Revenge','5.7'),
	(30,8,'V Notch Couloir','5'),
	(31,8,'U-Notch','4'),
	(32,9,'East Ridge','3'),
	(33,9,'Fishhook Arête','5.8'),
	(34,9,'Mithral Dihedral','5.10a'),
	(35,9,'West Ridge','4'),
	(36,9,'North Ridge','3'),
	(37,9,'North Face','5.6'),
	(38,10,'East Arete of North Summit','5.10a'),
	(39,10,'North Slope from the East','2'),
	(40,10,'St. Jean Couloir','4'),
	(41,11,'Army Pass','1'),
	(42,11,'Best of Both Worlds','3'),
	(43,11,'Tuttle Creek','4'),
	(44,11,'Rest and Be Thankful','5.9'),
	(45,11,'Northeast Couloir','3'),
	(46,11,'Winter Pass','4'),
	(47,12,'East Face','5.8'),
	(48,12,'North Rib','3'),
	(49,12,'Northwest Ridge','2'),
	(50,13,'Northeast Face','3'),
	(51,13,'Farquhar Route','4'),
	(52,14,'East Buttress','5.9'),
	(53,14,'South Face','5.9'),
	(54,14,'Whitney Trail','3'),
	(55,15,'East Face Zig Zag','5.5'),
	(56,15,'North Couloir','4'),
	(57,15,'Northeast Couloir','4'),
	(58,15,'Southwest Chute','5.9'),
	(59,15,'Underhill Couloir','5.6');

/*!40000 ALTER TABLE `mountains_routes` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
