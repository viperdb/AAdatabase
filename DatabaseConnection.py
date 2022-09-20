__author__ = 'dante (Daniel Montiel)'
import mysql.connector

dbHost="127.0.0.1"
#dbHost="172.29.236.74"
dbUser="abdesign"
dbPassw ="dt90uiy$"
dbDb="ab_design"

def connect():
     db1 = mysql.connector.connect(host=dbHost, # your host, usually localhost
                         user=dbUser, # your username
                         passwd=dbPassw, # your password
                         db=dbDb) # name of the data base


     return db1;

def executeOperation(sql):
    db1 = connect()
    cur1 = db1.cursor()
    cur1.execute(sql)
    db1.commit()
    cur1.close()
    db1.close()

def executeManyOperation(sql,data):
    db1 = connect()
    cur1 = db1.cursor()
    cur1.executemany(sql,data)
    db1.commit()
    cur1.close()
    db1.close()

def getDataFromAQuerry(sql):
    db1 = connect()
    cur1 = db1.cursor()

    # Use all the SQL you like

    cur1.execute(sql)

    # print all the first cell of all the rows

    rows =cur1.fetchall()

    cur1.close()
    db1.close()
    return rows

def getDataFromAQuerry_descrip(sql):
    db1 = connect()
    cur1 = db1.cursor()

    # Use all the SQL you like

    cur1.execute(sql)

    # print all the first cell of all the rows

    rows =cur1.fetchall()
    field_names = [i[0] for i in cur1.description]
    cur1.close()
    db1.close()
    return rows,field_names