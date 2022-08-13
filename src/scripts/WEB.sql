	-- INIT DATABASE
	DROP DATABASE IF EXISTS covidtrack;
	CREATE DATABASE covidtrack;
	USE covidtrack;

	DROP TABLE IF EXISTS user;
		CREATE TABLE user(
							
							username varchar(255) NOT NULL,
							password varchar(255) NOT NULL, 
							email varchar(255) NOT NULL,
							privilages INT(9),
							primary key(username)
		)Engine=InnoDB;
	

	-- admins
	INSERT INTO user (username,password,email,privilages) VALUES ('Xaris','123qwe!@#QWE','xaris@mail.com',1);
	INSERT INTO user (username,password,email,privilages) VALUES ('Giannis','A123123U','giannis@mail.com',1);

	DROP TABLE IF EXISTS Poi;

	CREATE TABLE Poi(
						id varchar(255) NOT NULL,
						name varchar(255) default " " NOT NULL,
						types JSON,
						address varchar(255) default "" NOT NULL,
						lat FLOAT(50),
						lng FLOAT(50),
						rating  float(3,1),
						rating_n smallint(4),
						
						primary key(id)
		)Engine=InnoDB;



	DROP TABLE IF EXISTS popularity;
	CREATE TABLE popularity(
						popID varchar(255) NOT NULL,
						day varchar(255) default "" NOT NULL,
						data  JSON,
						primary key(popID,day),
						constraint POIST
						foreign key (popID) references Poi(id)
						ON DELETE CASCADE ON UPDATE CASCADE
		)Engine=InnoDB;





	DROP TABLE IF EXISTS place;
	CREATE TABLE place(
						visitID INT(11) AUTO_INCREMENT,
						poiID varchar(255) default " " NOT NULL,
						userID varchar(255) default " " NOT NULL,
						tmstmp DATETIME default CURRENT_TIMESTAMP,
						numofp INT(10) default NULL,
						primary key(visitID),
						constraint PlacePOI
						
						foreign key(poiID) references Poi(id)
						ON DELETE CASCADE ON UPDATE CASCADE,
						constraint PlaceUser
						foreign key(userID) references user(username)
						ON DELETE CASCADE ON UPDATE CASCADE
				)Engine=InnoDB;


	DROP TABLE IF EXISTS log;
	CREATE TABLE log(
						views INT(11) AUTO_INCREMENT,
						userID varchar(255),
						tmstmp DATETIME,
						primary key(views)
				)Engine=InnoDB;

	INSERT INTO log VALUES();

	DROP TABLE IF EXISTS hasCovid;
	CREATE TABLE hasCovid(
						reg INT(11) AUTO_INCREMENT,
						id varchar(255) NOT NULL,
						covid DATE,
						status varchar(255) NOT NULL,
						primary key(reg,id),
						constraint Hcovid
						foreign key(id) references user(username)
						ON DELETE CASCADE ON UPDATE CASCADE
						
		)Engine=InnoDB;