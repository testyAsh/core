import MySQLdb


def connectDb():
    db = MySQLdb.connect(host="localhost",
                         user="kazafix",
                         passwd="kazafix",
                         db="Kazafix",
                         charset='utf8')
    cur = db.cursor()
    return db, cur


def getWorkers():
    db, cur = connectDb()
    cur.execute("SELECT UID,FirstName,LastName,PhoneNumber,LegalID,"
                "Address,Job,RetrievalRule,Comments FROM Workers")
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
    db.close()
    return r


def getWorkersSpecialised(serviceID):
    db, cur = connectDb()
    cur.execute("SELECT Workers.UID, Workers.Firstname, Workers.Lastname, "
                "Workers.PhoneNumber, Workers.LegalID,Workers.Address, "
                "Workers.RetrievalRule, Workers.Comments "
                "FROM WorkersJobs "
                "INNER JOIN Workers "
                "ON Workers.UID = WorkersJobs.WorkerUID "
                "INNER JOIN Jobs "
                "ON Jobs.UID=WorkersJobs.JobUID "
                "WHERE Jobs.UID=%s;" % (str(serviceID)))
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
        r.append(d)
    db.close()
    return r


def addNewWorker(request):
    db, cur = connectDb()
    firstname = request.form['Nom']
    lastname = request.form['Prenom']
    phonenumber = request.form['Numero']
    legalid = request.form['CIN']
    address = request.form['Addresse']
    retrievalrule = request.form['Recouvrement']
    comments = request.form['Commentaires']
    print(firstname, lastname, phonenumber,
          legalid, address, retrievalrule, comments)
    fields = (firstname, lastname, phonenumber,
              legalid, address, retrievalrule, comments)
    query = ("INSERT INTO Workers (FirstName,LastName,PhoneNumber"
             ",LegalID,Address,RetrievalRule,Comments) VALUES "
             "(%s,%s,%s,%s,%s,%s,%s)")
    cur.execute(query, fields)
    db.commit()
    print "Registered"
    db.close()
    return True
