import MySQLdb


def connectDb():
    db = MySQLdb.connect(host="localhost",
                         user="kazafix",
                         passwd="kazafix",
                         db="Kazafix",
                         charset='utf8')
    cur = db.cursor()
    return db, cur

def getJobs():
    db, cur = connectDb()
    cur.execute("SELECT UID,Name FROM Jobs")
    rows = cur.fetchall()
    r = []
    for row in rows:
        d = {"uid": row[0], "name": row[1]}
        r.append(d)
    db.close()   
    return r


def addNewJob(request):
    db, cur = connectDb()
    name = request.form['Nom']
    print name
    cur.execute("INSERT INTO Jobs (name) VALUES(%s)", [name])
    db.commit()
    print "added"
    db.close()
    return True    
    