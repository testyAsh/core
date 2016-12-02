from flask import session
import MySQLdb



def connectDb():
    db = MySQLdb.connect(host="localhost",
                         user="kazafix",
                         passwd="kazafix",
                         db="Kazafix",
                         charset='utf8')
    cur = db.cursor()
    return db, cur


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
    db.close()
    return r

def createOrderContinue1(request):
    session['ClientLastname'] = request.form.getlist('inputLastName')[0]
    session['ClientFirstname'] = request.form.getlist('inputFirstName')[0]
    return True   

def createOrderContinue2(request):
    session['ClientId'] = request.form.getlist('inputClient')[0]
    return True      

def createOrderContinue(request):
    session['ContactDate'] = request.form.getlist('inputContactDate')[0]
    session['ExecutionDate'] = request.form.getlist('inputExecutionDate')[0]
    session['ContactWay'] = request.form.getlist('inputContactWay')[0]
    return True

   

def createOrderContinue3(request):
    session['ServiceId'] = request.form.getlist('inputService')[0]
    return True

def createOrderContinue4(request):
    session['WorkerId'] = request.form.getlist('inputWorker')[0]
    return True

def getRecap():
    db, cur = connectDb() 
    cur.execute("SELECT FirstName,LastName,PhoneNumber,Address FROM Clients WHERE (UID = %s)",(session['ClientId'],))
    rows = cur.fetchall()
    for row in rows:
            prenom = row[0]
            nom = row[1]
            numero = row[2]
            address = row[3]
    cur.execute("SELECT name FROM Jobs WHERE (UID = %s)",(session['ServiceId'],))
    rows = cur.fetchall()
    for row in rows:
            service = row[0]
    cur.execute("SELECT FirstName,LastName,PhoneNumber FROM Workers WHERE (UID = %s)",(session['WorkerId'],))
    rows = cur.fetchall()  
    for row in rows:
            prenomouv = row[0]
            nomouv = row[1]
            numeroouv = row[2]
                   
    r = {}
    r["Clientprenom"] = prenom
    r["clientnom"] = nom
    r["telclient"] = numero
    r["Adressclient"] = address
    r["ContactDate"] = session['ContactDate']
    r["ExecutionDate"] = session['ExecutionDate']
    r["ContactWay"] = session['ContactWay']
    r["Service"] = service
    r["Workerprenom"] = prenomouv
    r["Workernom"] = nomouv
    r["Workertel"] = numeroouv
    print r
    db.close()
    return r      