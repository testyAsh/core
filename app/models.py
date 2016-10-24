from app import db
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy.inspection import inspect

# def to_json(inst, cls):
#     """Jsonify the sql alchemy query result."""
#     convert = dict()
#     # add your coversions for things like datetime's 
#     # and what-not that aren't serializable.
#     d = dict()
#     for c in cls.__table__.columns:
#         v = getattr(inst, c.name)
#         if c.type in convert.keys() and v is not None:
#             try:
#                 d[c.name] = convert[c.type](v)
#             except:
#                 d[c.name] = "Error:  Failed to covert using ", str(convert[c.type])
#         elif v is None:
#             d[c.name] = str()
#         else:
#             d[c.name] = v
#     return json.dumps(d)

class Serializer(object):

    def serialize(self):
        return {c: getattr(self, c) for c in inspect(self).attrs.keys()}

    @staticmethod
    def serialize_list(l):
        return [m.serialize() for m in l]


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

    @property
    def serialize(self):
       # """Return object data in easily serializeable format"""
        return {
           'id'         : self.id,
           'FirstName'         : self.FirstName,
           'LastName'         : self.LastName, 
           'PhoneNumber'         :  self.PhoneNumber,
           'LegalID'         : self.LegalID,
           'Address'         : self.Address,
           'RetrievalRule'         : self.RetrievalRule,
           'Comments'         : self.Comments, 
       }

    # @property
    # def serialize_many2many(self):
    #    # """ Return object's relations in easily serializeable format.
    #    # NB! Calls many2many's serialize property. """
    #    return [ item.serialize for item in self.worker]    


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

    # @property
    # def serialize(self):
    #    # """Return object data in easily serializeable format"""
    #     return {
    #        'id'         : self.id,
    #        'State'         : self.State,
    #        'Contactthrough'         : self.Contactthrough, 
    #        'InsertionDate'         :  self.InsertionDate,
    #        'ExecutionDate'         : self.ExecutionDate,
    #        'ClienPaidFees'         : self.ClienPaidFees,
    #        'ReportedPaidFees'         : self.ReportedPaidFees,
    #        'RetrievalReceived'         : self.RetrievalReceived,
    #        'Client_id'         : self.serialize_many2many,
    #        'Worker_id'         : self.serialize_many2many,
    #        'Comments'         : self.Comments, 
    #    }

    # @property
    # def serialize_many2many(self):
    # """ Return object's relations in easily serializeable format.
    # NB! Calls many2many's serialize property. """
    #    return [ item.serialize for item in self.many2many]

class Job(db.Model, Serializer):
    id = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(64), index=True, unique=False)
    WorkerJobs = db.relationship('WorkerJob', backref='job', lazy='dynamic')

    def __repr__(self):
        return '<% r Job %r>' % (self.id, self.Name)

    @property
    def serialize(self):
       # """Return object data in easily serializeable format"""
        return {
           'id'         : self.id,
           'Name'       : self.Name,
       }

    # @property
    # def serialize_many2many(self):
    #    # """ Return object's relations in easily serializeable format.
    #    # NB! Calls many2many's serialize property. """
    #    return [ item.serialize for item in self.Job]      
 

class WorkerJob(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    Job_id = db.Column(db.Integer, db.ForeignKey('job.id'))
    Worker_id = db.Column(db.Integer, db.ForeignKey('worker.id'))

    def __repr__(self):
       return '<WorkerJob %r %r %r>' % (self.id, self.Worker_id, self.Job_id)

    @property
    def serialize(self):
       # """Return object data in easily serializeable format"""
        return {
           'id'         : self.id,
           'Job_id'         : self.job,
           'Worker_id'         : self.worker, 
       }

    # @property
    # def serialize_many2many(self):
    #    # """ Return object's relations in easily serializeable format.
    #    # NB! Calls many2many's serialize property. """
    #    return [ item.serialize for item in self.WorkerJob]        



