#!/usr/bin/python
from migrate.versioning import api
from config import SQLALCHEMY_DATABASE_URI
from config import SQLALCHEMY_MIGRATE_REPO
from app import db, models
u = models.Worker(FirstName='Walid',LastName='Debbichi',PhoneNumber='20242128-70728159',LegalID='07402288',Address='29 Rue Khaled Ibn Alwalid LAouina',RetrievalRule='20',Comments='On n a pas travaille avec lui')
db.session.add(u)
u
db.session.commit()

