#!/usr/bin/python
# -*- coding: utf-8 -*-
from migrate.versioning import api
from config import SQLALCHEMY_DATABASE_URI
from config import SQLALCHEMY_MIGRATE_REPO
from app import db, models
# db.session.add(models.Worker(FirstName='Walid',LastName='Debbichi',PhoneNumber='20242128-70728159',LegalID='07402288',Address='29 Rue Khaled Ibn Alwalid LAouina',RetrievalRule='20',Comments=unicode('On n a pas travaillé avec lui','UTF-8')))
# db.session.add(models.Worker(FirstName='Adel',LastName='Hadchi',PhoneNumber='23473864',LegalID='05408828',Address='Rue Khaled Ibn Alwalid, Les Palmeraies LAouina',RetrievalRule='20',Comments='Client a dit qu il est cher'))
# db.session.add(models.Worker(FirstName='Abdessalem',LastName='Ben Ammar',PhoneNumber='54356565',LegalID='05445994',Address='20 Rue Kelibia LAouina',RetrievalRule='20',Comments='Client a dit quil est cher'))
# db.session.add(models.Worker(FirstName='Anis',LastName='Chemkhi',PhoneNumber='24,552,733',LegalID='07933188"',Address=unicode('Cité Les Palmeraies LAouina','UTF-8'),RetrievalRule='20',Comments='Client a dit quil est cher'))
# db.session.add(models.Worker(FirstName='Hassene',LastName='Ben Saleh',PhoneNumber='50,900,648',LegalID='05369441',Address=unicode('Route de L aéroport Sfax','UTF-8'),RetrievalRule='20',Comments='  '))
# db.session.add(models.Worker(FirstName='Ali',LastName='Ansi',PhoneNumber='23,339,040',LegalID='09950718',Address=unicode('Cité Bourak LAouina','UTF-8'),RetrievalRule='20',Comments='Lazy'))
# db.session.add(models.Worker(FirstName='Mansour',LastName='Ouerghi',PhoneNumber='08045863',LegalID='07402288',Address='93 Rue Khaled Ibn Alwalid LAouina',RetrievalRule='20',Comments='Prend son temps'))
# db.session.add(models.Job(Name='Alarmes'))
# db.session.add(models.Job(Name='Aluminium'))
# db.session.add(models.Job(Name=unicode('Bâtiment','UTF-8')))
# db.session.add(models.Job(Name='Camera'))
# db.session.add(models.Job(Name=unicode('Chaudière','UTF-8')))
# db.session.add(models.Job(Name='Chauffage'))
# db.session.add(models.Job(Name='Climatisation'))
# db.session.add(models.Job(Name='Couture'))
# db.session.add(models.Job(Name=unicode('Décoration','UTF-8')))
# db.session.add(models.Job(Name=unicode('Electricité','UTF-8')))
# db.session.add(models.Job(Name='Forgeron'))
# db.session.add(models.Job(Name='Informatique'))
# db.session.add(models.Job(Name='Jardinier'))
# db.session.add(models.Job(Name=unicode('Kiné','UTF-8')))
# db.session.add(models.Job(Name='Lustrage M'))
# db.session.add(models.Job(Name=unicode('Ménage','UTF-8')))
# db.session.add(models.Job(Name='Menuiserie Alu'))
# db.session.add(models.Job(Name='Menuiserie Bois'))
# db.session.add(models.Job(Name='Parabole'))
# db.session.add(models.Job(Name='Peinture'))
# db.session.add(models.Job(Name='Piscine'))
# db.session.add(models.Job(Name='Plastique'))
# db.session.add(models.Job(Name='Plexiglass'))
# db.session.add(models.Job(Name='Plomberie'))
# db.session.add(models.Job(Name=unicode('Pompe à Chaleur','UTF-8')))
# db.session.add(models.Job(Name=unicode('Réparation éléctroménager','UTF-8')))
# db.session.add(models.Job(Name='Rideaux'))
# db.session.add(models.Job(Name='Serrurier'))
# db.session.add(models.Job(Name='Stores'))
# db.session.add(models.Job(Name='Tout'))
# db.session.add(models.Job(Name='Ventilateur'))
# db.session.add(models.Job(Name='Verre'))
db.session.add(models.WorkerJob(job=models.Job.query.get(19),worker=models.Worker.query.get(1)))
db.session.add(models.WorkerJob(job=models.Job.query.get(7),worker=models.Worker.query.get(1)))
db.session.add(models.WorkerJob(job=models.Job.query.get(2),worker=models.Worker.query.get(2)))
db.session.add(models.WorkerJob(job=models.Job.query.get(32),worker=models.Worker.query.get(2)))
db.session.add(models.WorkerJob(job=models.Job.query.get(29),worker=models.Worker.query.get(2)))
db.session.add(models.WorkerJob(job=models.Job.query.get(24),worker=models.Worker.query.get(3)))
db.session.add(models.WorkerJob(job=models.Job.query.get(6),worker=models.Worker.query.get(3)))
db.session.add(models.WorkerJob(job=models.Job.query.get(7),worker=models.Worker.query.get(3)))
db.session.add(models.WorkerJob(job=models.Job.query.get(25),worker=models.Worker.query.get(3)))
db.session.add(models.WorkerJob(job=models.Job.query.get(31),worker=models.Worker.query.get(3)))
db.session.add(models.WorkerJob(job=models.Job.query.get(5),worker=models.Worker.query.get(3)))
db.session.add(models.WorkerJob(job=models.Job.query.get(21),worker=models.Worker.query.get(3)))
db.session.add(models.WorkerJob(job=models.Job.query.get(24),worker=models.Worker.query.get(4)))
db.session.add(models.WorkerJob(job=models.Job.query.get(7),worker=models.Worker.query.get(4)))
db.session.add(models.WorkerJob(job=models.Job.query.get(15),worker=models.Worker.query.get(5)))
db.session.add(models.WorkerJob(job=models.Job.query.get(20),worker=models.Worker.query.get(6)))
db.session.add(models.WorkerJob(job=models.Job.query.get(9),worker=models.Worker.query.get(6)))
db.session.add(models.WorkerJob(job=models.Job.query.get(10),worker=models.Worker.query.get(7)))
db.session.commit()

