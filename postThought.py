import sys
import sqlite3

con = sqlite3.connect("thoughts.db")
cur = con.cursor()

cur.execute("CREATE TABLE IF NOT EXISTS thoughts (description TEXT, feeling TEXT, date TEXT, time TEXT, email TEXT)")
values = (sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5])
cur.execute("INSERT INTO thoughts VALUES (?, ?, ?, ?, ?)", values)

con.commit()
con.close()
print(values)