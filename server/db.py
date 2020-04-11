import MySQLdb
import MySQLdb.cursors

# db connection


def connection():
    try:
        conn = MySQLdb.connect(host="localhost", user="root", passwd="12345678",
                               db="movie", cursorclass=MySQLdb.cursors.DictCursor)
    except Exception as e:
        print("Connection error" + str(e))
        return 0

    return conn, conn.cursor()
