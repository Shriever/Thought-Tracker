import sys
import sqlite3

if len(sys.argv) != 2:
    print("Usage: python3 getThought.py <Email Address>")
    exit(1)

user_email = sys.argv[1]
query = 'SELECT * FROM thoughts WHERE email=(?)'
con = sqlite3.connect('thoughts.db')
cur = con.cursor()

for row in cur.execute(query, [user_email]):
    print(row)

con.close()