from app import db

class Worker(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    FirstName = db.Column(db.String(64), index=True, unique=False)
    LastName = db.Column(db.String(64), index=True, unique=False)
    PhoneNumber = db.Column(db.String(64), index=True, unique=False)
    LegalID = db.Column(db.String(64), index=True, unique=False)
    Address = db.Column(db.String(200), index=True, unique=False)
    RetrievalRule = db.Column(db.Float, index=True, unique=False)
    Comments = db.Column(db.String(255), index=True, unique=False)
    Orders = db.relationship('Order', backref='contractor', lazy='dynamic')
    WorkerJobs = db.relationship('WorkerJob', backref='worker', lazy='dynamic')


    def __repr__(self):
        return '<%r Worker %r>' % (self.id, self.FirstName)

class Client(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    FirstName = db.Column(db.String(64), index=True, unique=False)
    LastName = db.Column(db.String(64), index=True, unique=False)
    PhoneNumber = db.Column(db.String(64), index=True, unique=False)
    PreferredContact = db.Column(db.String(64), index=True, unique=False)
    Address = db.Column(db.String(200), index=True, unique=False)
    Comments = db.Column(db.String(255), index=True, unique=False)
    Orders = db.relationship('Order', backref='client', lazy='dynamic')

    def __repr__(self):
         return '<Client %r>' % (self.FirstName)

class Order(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    State = db.Column(db.String(64), index=True, unique=False)
    Contactthrough = db.Column(db.String(64), index=True, unique=False)
    InsertionDate = db.Column(db.DateTime, index=True, unique=False)
    ExecutionDate = db.Column(db.DateTime, index=True, unique=False)
    ClienPaidFees = db.Column(db.Float(64), index=True, unique=False)
    ReportedPaidFees = db.Column(db.Float(64), index=True, unique=False)
    RetrievalReceived = db.Column(db.Float(64), index=True, unique=False)
    Client_id = db.Column(db.Integer, db.ForeignKey('client.id'))
    Worker_id = db.Column(db.Integer, db.ForeignKey('worker.id'))
    Comments = db.Column(db.String(255), index=True, unique=False)

    def __repr__(self):
        return '<Order %r>' % (self.id)

class Job(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(64), index=True, unique=False)
    WorkerJobs = db.relationship('WorkerJob', backref='job', lazy='dynamic')

    def __repr__(self):
        return '<% r Job %r>' % (self.id, self.Name)

class WorkerJob(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    Job_id = db.Column(db.Integer, db.ForeignKey('job.id'))
    Worker_id = db.Column(db.Integer, db.ForeignKey('worker.id'))

    def __repr__(self):
       return '<WorkerJob %r %r>' % (self.id, self.Worker_id)        