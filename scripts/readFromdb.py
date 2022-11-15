import mysql.connector
from mysql.connector import Error

try:
    conn = mysql.connector.connect(host='localhost',
                                         database='smitvideo_dev',
                                         user='django',
                                         password='Django2020Pwd!')
    if conn.is_connected():
        cursor = conn.cursor()

        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to MariaDB: ", record)
       
        # sql = "select * from camera_video;"
        sql = "select videoPath from camera_parameter;"
        cursor.execute(sql)

        videoPath = cursor.fetchone()[0]
        videoPath = cursor.fetchone()['videoPath']
        
        #row = cursor.fetchone()
        #print ("row :",row)
        #videoPath = row['videoPath']

        #result = cursor.fetchall()
        print ("videoPATH :",videoPath)

except Error as e:
    print("Error while connecting to MariaDB", e)
finally:
        cursor.close()
        conn.close()
        print("MariaDB conn is closed")


