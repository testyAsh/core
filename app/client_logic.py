import MySQLdb


def connectDb():
    db = MySQLdb.connect(host="localhost",
                         user="kazafix",
                         passwd="kazafix",
                         db="Kazafix",
                         charset='utf8')
    cur = db.cursor()
    return db, cur


def getClients():
    db, cur = connectDb()
    cur.execute(
        "SELECT UID,FirstName,LastName,PhoneNumber,PreferredContact,Address,Comments FROM Clients")
    rows = cur.fetchall()
    r = []
    for row in rows:
        d = {
            "uid": row[0],
            "firstname": row[1],
            "lastname": row[2],
            "phonenumber": row[3],
            "preferredcontact": row[4],
            "address": row[5],
            "comments": row[6],
        }
        print d
        r.append(d)
    db.close()
    return r   
     

def addNewClient(request):
    db, cur = connectDb()
    lastname = request.form['Nom']
    firstname = request.form['Prenom']
    phonenumber = request.form['Numero']
    preferredcontact = request.form['ContactVia']
    address = request.form['Addresse']
    comments = request.form['Commentaires']
    print firstname, lastname, phonenumber, preferredcontact, address, comments
    fields = (firstname, lastname, phonenumber,
              preferredcontact, address, comments)
    query = "INSERT INTO Clients (FirstName,LastName,PhoneNumber,PreferredContact,Address,Comments) VALUES (%s,%s,%s,%s,%s,%s)"
    cur.execute(query, fields)
    db.commit()
    print "Registered"
    db.close()
    return True

def Findclientrecord(lastname,firstname):
    db, cur = connectDb()
    cur.execute("SELECT UID,FirstName,LastName,PhoneNumber,PreferredContact,Address,Comments FROM Clients WHERE (FirstName = %s OR LastName = %s OR FirstName = %s OR LastName = %s)",
                (firstname, firstname, lastname, lastname))
    rows = cur.fetchall()
    r = []
    for row in rows:
        d = {
            "uid": row[0],
            "firstname": row[1],
            "lastname": row[2],
            "phonenumber": row[3],
            "preferredcontact": row[4],
            "address": row[5],
            "comments": row[6],
        }
        print d
        r.append(d)
    return r


def FindclientInfos(idclient):
    db, cur = connectDb()
    print idclient
    cur.execute("SELECT UID,FirstName,LastName,PhoneNumber,PreferredContact,Address,Comments FROM Clients WHERE (UID = %s)",(idclient,))
    rows = cur.fetchall()
    r = []
    for row in rows:
        d = {
            "uid": row[0],
            "firstname": row[1],
            "lastname": row[2],
            "phonenumber": row[3],
            "PreferredContact": row[4],
            "address": row[5],
            "comments": row[6],
        }
        print d
        r.append(d)
    return r