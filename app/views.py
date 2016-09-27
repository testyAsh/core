from flask import render_template, jsonify
from app import app
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


@app.route('/jobs')
def jobs():
    return render_template('jobs.html',
                           title='Home')


@app.route('/jobs/get_jobs')
def getJobs():
    db, cur = connectDb()
    cur.execute("SELECT UID,Name FROM Jobs")
    rows = cur.fetchall()
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
    db, cur = connectDb()
    cur.execute(
        "SELECT UID,FirstName,LastName,PhoneNumber,LegalID,Address,City,Job,Score,RetrievalRule,Comments FROM Workers")
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
            "city": row[6],
            "job": jobs,
            "score": row[8],
            "retrievalrule": row[9],
            "comments": row[10],
        }
        print d
        r.append(d)
    return jsonify(result=r)
    db.close()
