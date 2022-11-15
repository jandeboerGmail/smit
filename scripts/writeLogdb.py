import mysql.connector
from mysql.connector import Error
from datetime import datetime

def insertLogMessage(conn,cursor,id):
    now = datetime.now()
    strDate = now.strftime('%Y-%m-%d %H:%M:%S')
    strId = "Order" + str(id)
    strMessage = "Message " + strId
        
    sql = "INSERT INTO  camera_log (ordernr, message ,datum_inserted, datum_updated) VALUES (%s, %s, %s, %s)"
    val = (strId ,strMessage,strDate,strDate)
    cursor.execute(sql,val)
    conn.commit()
    print ("Inserted :", strId)

try:
    conn = mysql.connector.connect(host='localhost',
                                         database='smitvideo_dev',
                                         user='django',
                                         password='Django2020Pwd!')
    if conn.is_connected():
        cursor = conn.cursor()

        cursor.execute("select database();")
        record = cursor.fetchone()
        print("connected to MariaDB: ", record)
       
        for x in range(100):
            insertLogMessage(conn,cursor,x)

except Error as e:
    print("Error while connecting to MariaDB", e)
finally:
        cursor.close()
        conn.close()
        print("MariaDB conn is closed")


