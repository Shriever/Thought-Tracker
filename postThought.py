import sys
import sqlite3

con = sqlite3.connect(":memory:")
cur = con.cursor()

cur.execute("CREATE TABLE IF NOT EXISTS thoughts (description TEXT, feeling TEXT, date TEXT, time TEXT)")
values = (sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
cur.execute("INSERT INTO thoughts VALUES (?, ?, ?, ?)", values)

con.commit()
con.close()