# -*- coding: utf-8 -*-
from flask import render_template, jsonify, request, json, redirect, url_for, session
from app import app
import MySQLdb
import worker_logic as wl
import client_logic as cl
import job_logic as jl
import order_logic as ol


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


@app.route('/workers/get_workers_specialised')
def getWorkersSpecialised():
    if "ServiceId" in session:
        result = wl.getWorkersSpecialised(session['ServiceId'])
    else:
        result = wl.getWorkers()
    return jsonify(result=result)


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


@app.route('/FindclientInfos', methods=['POST', 'GET'])
def FindclientInfos():
    result = cl.FindclientInfos(request)
    return jsonify(result=result)


@app.route('/orders')
def orders():
    return render_template('bookings.html',
                           title='Home')


@app.route('/orders/get_orders')
def getOrders():
    result = ol.getWorkers()
    return jsonify(result=result)


@app.route('/createorder/')
def createOrder():
    return render_template('createorder.html')


@app.route('/createordercontinue', methods=['POST'])
def createOrderContinue():
    ol.createOrderContinue(request)
    return json.dumps({"result": "success"})


@app.route('/createorder2/')
def createOrder2():
    return render_template('createorder2.html')


@app.route('/createordercontinue2', methods=['POST'])
def createOrderContinue2():
    ol.createOrderContinue2(request) 
    return json.dumps({"result": "success"})


@app.route('/createorder3/')
def createOrder3():
    return render_template('createorder3.html')


@app.route('/createordercontinue3', methods=['POST'])
def createOrderContinue3():
    ol.createOrderContinue3(request)
    return json.dumps({"result": "success"})


@app.route('/createorder4/')
def createOrder4():
    return render_template('createorder4.html')


@app.route('/createordercontinue4', methods=['POST'])
def createOrderContinue4():
    ol.createOrderContinue4(request)
    return json.dumps({"result": "success"})


@app.route('/createorder5/')
def createOrder5():
    return render_template('createorder5.html')


@app.route('/get_recap')
def getRecap():
    result = ol.getRecap()
    return jsonify(result=result)


@app.route('/addNewOrder', methods=['POST', 'GET'])
def addNewOrder():
    db, cur = connectDb()
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
