# -*- coding: utf-8 -*-
from flask import render_template, jsonify
from app import app, db
import MySQLdb




def connectDb():
    db = MySQLdb.connect(host="localhost",
                         user="kazafix",
                         passwd="kazafix",
                         db="Kazafix",
                         charset='utf8')
    cur = db.cursor()
    return db, cur

@app.route('/')
@app.route('/index')
def index():
    return render_template('bookings.html',
                           title='Home')


# @app.route('/orders')
# def orders():
#     return render_template('orders.html',
#                            title='Home')


# @app.route('/orders/get_orders')
# def getOrders():
#     u = models.Order.query.all()
#     json_list=[unicode(i.serialize) for i in u]
#     return jsonify(json_list)


@app.route('/jobs')
def jobs():
    return render_template('jobs.html',
                           title='Home')


@app.route('/jobs/get_jobs')
def getJobs():
    # u = models.Job.query.all()
    # return jsonify(u=models.Job.serialize_list(u))
    # # return jsonify(json_list)
    db, cur = connectDb()
    cur.execute("SELECT UID,Name FROM Jobs")
    rows = cur.fetchall()
    # rows = models.Job.query.all()
    r = []
    for row in rows:
        d = {"uid": row[0], "name": row[1]}
        r.append(d)
    return jsonify(result=r)
    db.close()


@app.route('/workers')
def workers():
    return render_template('workers.html',
                           title='Home')


@app.route('/workers/get_workers')
def getWorkers():
    # u = models.Worker.query.all()
    # json_list = [i.serialize for i in u]
    # return jsonify(json_list)
    db, cur = connectDb()
    cur.execute(
        "SELECT UID,FirstName,LastName,PhoneNumber,LegalID,Address,Job,RetrievalRule,Comments FROM Workers")
    rows = cur.fetchall()
    r = []
    for row in rows:
        cur.execute("SELECT Jobs.name "
                    "FROM WorkersJobs "
                    "INNER JOIN Workers "
                    "ON Workers.UID = WorkersJobs.WorkerUID "
                    "INNER JOIN Jobs "
                    "ON Jobs.UID=WorkersJobs.JobUID "
                    "WHERE Workers.UID=%s;" % (row[0]))
        rows2 = cur.fetchall()
        jobs = ""
        for row2 in rows2:
            jobs = jobs + " " + row2[0] + ","
        jobs = jobs[:-1]
        jobs = jobs[1:]

        d = {
            "uid": row[0],
            "firstname": row[1],
            "lastname": row[2],
            "phonenumber": row[3],
            "legalid": row[4],
            "address": row[5],
            "job": jobs,
            "retrievalrule": row[7],
            "comments": row[8],
        }
        print d
        r.append(d)
    return jsonify(result=r)
    db.close()

@app.route('/addWorker')
def addWorker():
    return render_template('addworker.html')


@app.route('/addNewWorker', methods=['POST', 'GET'])
def addNewworker():
    firstname = request.form['Nom'];
    lastname = request.form['Prenom'];
    phonenumber = request.form['Numero'];
    legalid = request.form['CIN'];
    address = request.form['Addresse'];
    retrievalrule = request.form['Recouvrement'];
    comments = request.form['Commentaires'];
    db, cur = connectDb()
    cur.execute("INSERT INTO Workers (FirstName,LastName,PhoneNumber,LegalID,Address,RetrievalRule,Comments) Values VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",(firstName,lastName,phoneNumber,legalID,address,retrievalRule,comments))
    # return json.dumps({'status':'OK','user':firstname});
    return redirect('/workers/get_workers')
    db.close()


# @app.route('/workerJobs')
# def workersJobs():
#     return render_template('workerJobs.html',
#                            title='Home')


# @app.route('/workerJobs/get_workerJobs')
# def getWorkersJobs():
#     u = models.Job.query.get(19)
#     workerjob = u.WorkerJobs.all()
#     json_list = [i.serialize for i in workerjob]
#     return jsonify(json_list)