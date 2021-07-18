import sys
import sqlite3

con = sqlite3.connect('thoughts.db')
cur = con.cursor()

user_email = sys.argv[1]
query = 'SELECT * FROM thoughts WHERE email=(?)'
for row in cur.execute(query, [user_email]):
    print(row)

con.close()