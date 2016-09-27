DROP DATABASE Kazafix;
CREATE DATABASE Kazafix;
USE Kazafix;
CREATE TABLE Workers (
  UID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FirstName varchar(20) NOT NULL,
  LastName varchar(20),
  PhoneNumber varchar(50),
  LegalID varchar(20),
  Address varchar(255),
  City varchar(30),
  Job varchar(255),
  Score int,
  RetrievalRule varchar(255),
  Comments mediumtext
);
CREATE TABLE Clients (
  UID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FirstName varchar(20) NOT NULL,
  LastName varchar(20),
  PhoneNumber varchar(20),
  ContactThrough varchar(20),
  Address varchar(255),
  City varchar(30),
  Score int,
  Comments mediumtext
);
CREATE TABLE Bookings (
  UID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  State varchar(20) NOT NULL,
  ClientID int,
  WorkerID int,
  InsertionDate DATETIME,
  ExecutionDate DATETIME,
  ClientPaidFees double,
  ReportedPaidFees double,
  RetrievalReceived double,
  ClientScore int,
  WorkerScore int,
  FOREIGN KEY (ClientID) REFERENCES Clients(UID),
  FOREIGN KEY (WorkerID) REFERENCES Workers(UID)
);
CREATE TABLE Jobs (
  UID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(50)
);
CREATE TABLE WorkersJobs (
  JobUID int,
  WorkerUID int,
  FOREIGN KEY (JobUID) REFERENCES Jobs(UID),
  FOREIGN KEY (WorkerUID) REFERENCES Workers(UID)
);



INSERT INTO Jobs (name) VALUES ("Alarmes");
INSERT INTO Jobs (name) VALUES ("Aluminium");
INSERT INTO Jobs (name) VALUES ("Bâtiment");
INSERT INTO Jobs (name) VALUES ("Camera");
INSERT INTO Jobs (name) VALUES ("Chaudière");
INSERT INTO Jobs (name) VALUES ("Chauffage");
INSERT INTO Jobs (name) VALUES ("Climatisation");
INSERT INTO Jobs (name) VALUES ("Couture");
INSERT INTO Jobs (name) VALUES ("Décoration");
INSERT INTO Jobs (name) VALUES ("Electricité");
INSERT INTO Jobs (name) VALUES ("Forgeron");
INSERT INTO Jobs (name) VALUES ("Informatique");
INSERT INTO Jobs (name) VALUES ("Jardinier");
INSERT INTO Jobs (name) VALUES ("Kiné");
INSERT INTO Jobs (name) VALUES ("Lustrage M");
INSERT INTO Jobs (name) VALUES ("Ménage");
INSERT INTO Jobs (name) VALUES ("Menuiserie Alu");
INSERT INTO Jobs (name) VALUES ("Menuiserie Bois");
INSERT INTO Jobs (name) VALUES ("Parabole");
INSERT INTO Jobs (name) VALUES ("Peinture");
INSERT INTO Jobs (name) VALUES ("Piscine");
INSERT INTO Jobs (name) VALUES ("Plastique");
INSERT INTO Jobs (name) VALUES ("Plexiglass");
INSERT INTO Jobs (name) VALUES ("Plomberie");
INSERT INTO Jobs (name) VALUES ("Pompe à Chaleur");
INSERT INTO Jobs (name) VALUES ("Réparation éléctroménager");
INSERT INTO Jobs (name) VALUES ("Rideaux");
INSERT INTO Jobs (name) VALUES ("Serrurier");
INSERT INTO Jobs (name) VALUES ("Stores");
INSERT INTO Jobs (name) VALUES ("Tout");
INSERT INTO Jobs (name) VALUES ("Ventilateur");
INSERT INTO Jobs (name) VALUES ("Verre");


INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Walid","Debbichi","20 242 128 - 70 728 159","07402288","29 Rue Khaled Ibn Alwalid","L'Aouina","20%","On n'a pas travaillé avec lui");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Adel","Hadchi","23,473,864","05408828","Rue Khaled Ibn Alwalid, Les Palmeraies","L'Aouina","20%","Client a dit qu'il est cher");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Abdessalem","Ben Ammar","54,356,565","05445994","20 Rue Kelibia","L'Aouina","20%","Client a dit qu'il est cher");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Anis","Chemkhi","24,552,733","07933188","Cité Les Palmeraies","L'Aouina","20%","Client a dit qu'il est cher");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Hassene","Ben Saleh","50,900,648","05369441","Route de L'Aéroport","Sfax","20%","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ali","Ansi","23,339,040","09950718","Cité Bourak","L'Aouina","20%","Lazy");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Mansour","Ouerghi","98,661,881","08045863","93 Rue Khaled Ibn Alwalid","L'Aouina","20%","Prend son temps");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Najoua","Charfi","22,319,659","01340547","Cité Les Palmeraies, Rés Essaada","L'Aouina","20%","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Mohamed","Ben Ghanmi","96,562,838","00328664","6 Rue de l'ecole","L'Aouina","20%","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Mohamed","Abdouli","51,061,520","","Ain Zaghouan","L'Aouina","20%","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ayoub","Ayari","58,630,018","04839389","Av Louis Braille","Tunis","20%","Istallation seulement");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Bassem / Zouhair","Houidi","21,326,515","","Cité Les Palmeraies","L'Aouina","20%","Sérieux");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Oussama","Hilaty","97 724 651 - 24 576 039","04825117","LSI - 16 Av Habib Bourguiba Bardo","Bardo","20%","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Amin","Safi","21 757 355 - 55 116 281","08194421","Rue Carthage N 27","L'Aouina","20%","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ines","","23,774,471","","","","","à enlever");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Kamel","Derouiche","50 623 686 - 28 752 693","","","","","à enlever Il a raté un RDV et ne décroche pas le téléphone");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Taieb","","","","","","","à enlever");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Bernadette","","N/A","","","","","à enlever");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ramzi","Ghesmi","53,528,043","","","L'Aouina","20%","Contrat à faire - contact direct sans passer par Chokri");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Hichem","","52,254,321","","","L'Aouina","20%","Lazy");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Saber","Yaakoubi","27 452 773 - 22 841 406","","","L'Aouina","20%","disponbile a partir de juin");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Habib Aimen","Bin Aoun","44 306 497 - 24 597 665","","","L'Aouina","","Sérieux et dispo");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Sylvie","","52 866 826","","","L'Aouina","","à enlever");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ezzeddine","","22 616 425","","","L'Aouina","","à enlever");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Tarek","","27 474 701 - 22 804 654","","","L'Aouina","","Pas très disponible");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ami Oumayma","","20 016 774","","","Megrine","","à enlever");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Solange","","94 366 065","","","","","à enlever");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Taieb","Charni","97 248 211 - 97 248 212","","","L'Aouina","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Moez","Charni","97 248 211 - 97 248 212","","","L'Aouina","","Sérieux mais cher pour petits traveaux");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Béchir - Abdessattar","","92 767 197 - 54 477 427","","","L'Aouina","20%","celui qui a raté 3600");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ammar","Barhoumi","22 762 124 - 54 762 124","","Av Khaled ibn Walid, Cité Mongi Slim","L'Aouina","20%","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Naceur","","22 038 166","","","L'Aouina","20%","Sérieux sauf pour petit traveaux");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Amor","Gdhifi","96 235 139 - 20 584 081","","","L'Aouina","20%","Sérieux");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Sabrine","Ben Hadji","22 414 190","","","Le Kram","","Sérieux");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Elisa","","94 366 065","","","","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Linda","","50 667 087","","","","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Alida","","55 737 210","","","","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Abdallah","","22 685 680","","","Soukra","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Maï","","54 725 708","","","","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Sami","Kaddoussi","23 919 204","","","Khaznadar","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Yacine","","52 372 811","","","","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Alice","","50 635 686","","","","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Salwa","","21 777 143","","","Magro Ariana","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Fathi","Nouioui","94 285 137","","","Zouhour","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Thuraya","","","","","Dar Fadhal","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Amelie","","58 152 626","","","Bhar Lazrag","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Dalila","","27 894 414","","","Borj Louzir","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Nebil","Brahmi","53 251 490","","","","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Slim","Masmoudi","98 531 357","07010705","25 Rue Khmaies Hajri 1008","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Zied","Ben Ammar","20 558 168 / 98 558 168","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Mariam 1","","50 10 24 48","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Ami","","54 96 40 32","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Mandi","","54 964 037","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Valérie","","53 617 795","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Mariam 2","","53 441 596","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Fabienne","","25 601 039","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Awa","","58 661 067","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Anne","","52 736 197","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Natasha","","52 060 412","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Mosleh","","97 437 544","","","Tunis","","");
INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,City,RetrievalRule,Comments) Values("Wissem","","22 896 766","","","Tunis","","");





INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Walid" AND LastName="Debbichi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Parabole") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Walid" AND LastName="Debbichi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Adel" AND LastName="Hadchi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Aluminium") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Adel" AND LastName="Hadchi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Verre") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Adel" AND LastName="Hadchi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Stores") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdessalem" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Plomberie") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdessalem" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Chauffage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdessalem" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdessalem" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Pompe à Chaleur") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdessalem" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ventilateur") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdessalem" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Chaudière") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdessalem" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Piscine") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Anis" AND LastName="Chemkhi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Plomberie") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Anis" AND LastName="Chemkhi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Hassene" AND LastName="Ben Saleh") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Lustrage M") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ali" AND LastName="Ansi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Peinture") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ali" AND LastName="Ansi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Decoration") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mansour" AND LastName="Ouerghi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Electricité") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Najoua" AND LastName="Charfi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Couture") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Najoua" AND LastName="Charfi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Rideaux") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mohamed" AND LastName="Ben Ghanmi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Peinture") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mohamed" AND LastName="Abdouli") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Alarmes") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mohamed" AND LastName="Abdouli") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Camera") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ayoub" AND LastName="Ayari") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Bassem / Zouhair" AND LastName="Houidi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Electricité") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Oussama" AND LastName="Hilaty") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Informatique") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Amin" AND LastName="Safi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Serrurier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ines" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Kamel" AND LastName="Derouiche") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Taieb" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Piscine") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Bernadette" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ramzi" AND LastName="Ghesmi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Peinture") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ramzi" AND LastName="Ghesmi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Décoration") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Hichem" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Peinture") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Hichem" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Décoration") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Saber" AND LastName="Yaakoubi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Menuiserie Bois") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Saber" AND LastName="Yaakoubi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Menuiserie Alu") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Habib Aimen" AND LastName="Bin Aoun") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Habib Aimen" AND LastName="Bin Aoun") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Chaudière") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Habib Aimen" AND LastName="Bin Aoun") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Plomberie") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Sylvie" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ezzeddine" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Tarek" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ami Oumayma" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Solange" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Taieb" AND LastName="Charni") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Moez" AND LastName="Charni") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Plomberie") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Béchir - Abdessattar" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Menuiserie bois") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ammar" AND LastName="Barhoumi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Menuiserie bois") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Naceur" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Plexiglass") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Naceur" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Plastique") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Amor" AND LastName="Gdhifi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Forgeron") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Sabrine" AND LastName="Ben Hadji") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Kiné") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Elisa" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Linda" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Alida" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Abdallah" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Maï" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Sami" AND LastName="Kaddoussi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Bâtiment") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Sami" AND LastName="Kaddoussi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Yacine" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Alarmes") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Alice" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Salwa" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Fathi" AND LastName="Nouioui") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Tout") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Thuraya" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Amelie" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Dalila" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Nebil" AND LastName="Brahmi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Jardinier") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Slim" AND LastName="Masmoudi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Slim" AND LastName="Masmoudi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Chaudière") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Slim" AND LastName="Masmoudi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Plomberie") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Slim" AND LastName="Masmoudi") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Réparation éléctroménager") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Zied" AND LastName="Ben Ammar") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mariam 1" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Ami" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mandi" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Valérie" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mariam 2" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Fabienne" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Awa" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Anne" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Natasha" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Ménage") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mosleh" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Electricité") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Mosleh" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Wissem" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Electricité") AS j;
INSERT INTO
  WorkersJobs (JobUID,WorkerUID)
SELECT
  j.UID, w.UID
FROM
  (SELECT UID from Workers where FirstName="Wissem" AND LastName="") AS w
CROSS JOIN
  (SELECT UID from Jobs where Name="Climatisation") AS j;
  