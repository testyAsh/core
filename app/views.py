# -*- coding: utf-8 -*-
from flask import Flask, render_template, jsonify, request, json, redirect, url_for
from app import app, db
import MySQLdb
import worker_logic as wl
import client_logic as cl
import job_logic as jl


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
    return render_template('home.html',
                           title='Home')


@app.route('/jobs')
def jobs():
    return render_template('jobs.html',
                           title='Home')


@app.route('/jobs/get_jobs')
def getJobs():
    result = jl.getJobs()
    return jsonify(result=result)
    db.close()


@app.route('/addjob')
def addjob():
    return render_template('addjob.html')


@app.route('/addNewJob', methods=['POST', 'GET'])
def addNewJob():
    jl.addNewJob(request)
    return json.dumps({"result": "Saved successfully."})


@app.route('/workers')
def workers():
    return render_template('workers.html',
                           title='Home')


@app.route('/workers/get_workers')
def getWorkers():
    result = wl.getWorkers()
    return jsonify(result=result)
    db.close()


@app.route('/addWorker')
def addWorker():
    return render_template('addworker.html')


@app.route('/addNewWorker', methods=['POST', 'GET'])
def addNewworker():
    wl.addNewWorker(request)
    return json.dumps({"result": "Saved successfully."})


@app.route('/clients')
def clients():
    return render_template('clients.html',
                           title='Home')


@app.route('/clients/get_clients')
def getClients():
    result = cl.getClients()
    return jsonify(result=result)
    db.close()


@app.route('/addClient')
def addClient():
    return render_template('addclient.html')


@app.route('/addNewClient', methods=['POST', 'GET'])
def addNewClient():
    cl.addNewClient(request)
    return json.dumps({"result": "Saved successfully."})


@app.route('/Findclient')
def Findclient():
    return render_template('findclient.html')


@app.route('/Findclientrecord', methods=['POST', 'GET'])
def Findclientrecord():
	result = cl.Findclientrecord(request)
	return jsonify(result=result)
    

@app.route('/orders')
def orders():
    return render_template('bookings.html',
                           title='Home')


@app.route('/orders/get_orders')
def getOrders():
    db, cur = connectDb()
    cur.execute(
        "SELECT UID,State,ClientID,WorkerID,Contactthrough,InsertionDate,ExecutionDate,ClientPaidFees,ReportedPaidFees,RetrievalReceived FROM Bookings")
    rows = cur.fetchall()
    r = []
    for row in rows:
        d = {
            "uid": row[0],
            "state": row[1],
            "clientid": row[2],
            "workerid": row[3],
            "contactthrough": row[4],
            "insertiondate": row[5],
            "executiondate": row[6],
            "clientpaidfees": row[4],
            "reportedpaidfees": row[5],
            "retrievalreceived": row[6],
        }
        print d
        r.append(d)
    return jsonify(result=r)
    db.close()

  
@app.route('/CreateOrder')
def CreateOrder():
    return render_template('pendingorder.html')


@app.route('/addNewOrder', methods=['POST', 'GET'])
def addNewOrder():
    db, cur = connectDb()
    # var = request.form['idclient']
    # print var
    name = request.form['texte']
    print name
    cur.execute("SELECT UID,name FROM Jobs WHERE name = %s", (name,))
    rows1 = cur.fetchall()
    print rows1[0]
    for row1 in rows1:
        d = row1[0]
    cur.execute("SELECT Workers.UID, Workers.Firstname, Workers.Lastname, Workers.PhoneNumber, Workers.LegalID,Workers.Address, Workers.RetrievalRule, Workers.Comments  "
                    "FROM WorkersJobs "
                    "INNER JOIN Workers "
                    "ON Workers.UID = WorkersJobs.WorkerUID "
                    "INNER JOIN Jobs "
                    "ON Jobs.UID=WorkersJobs.JobUID "
                    "WHERE Jobs.UID=%s;" % (d)) 
    rows = cur.fetchall()
    r = []
    for row in rows:
        d = {
            "uid": row[0],
            "firstname": row[1],
            "lastname": row[2],
            "phonenumber": row[3],
            "legalid": row[4],
            "address": row[5],
            "retrievalrule": row[6],
            "comments": row[7],
        }
        print d
        r.append(d)
    return jsonify(result=r)
    db.close()
    #     r.append(d)
    # return r
    # return json.dumps({"result": "Saved successfully."})
