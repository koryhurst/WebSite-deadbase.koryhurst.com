import csv
import mysql.connector
import sys
sys.path.append('../../Python-FunctionLibrary')
import BeautifulSoupFunctions

DatabaseDetails = ["localhost","root","","dbtestgrateful"]

mydb = mysql.connector.connect(
  host=DatabaseDetails[0],
  user=DatabaseDetails[1],
  passwd=DatabaseDetails[2],
  database=DatabaseDetails[3]
  )

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM tblsetlist order by setlistid")
myresult = mycursor.fetchall()

#NewSetList = open("NewSetList.csv", "w+")
#NewSetList = open("NewSetList.csv", "a")
sqlInsert = "INSERT INTO tbljam (SetListID, JamNr, JamText) VALUES (%s, %s, %s)"

ShowID = 0
LinesAddedToThisShow = 0

for OrigLine in myresult:
  SetListID = OrigLine[0]
  ShowID = OrigLine[1]
  LineNr = OrigLine[2]
  SetText = OrigLine[3]
  print(OrigLine)
  print(SetListID)
  print(ShowID)
  print(SetText)
  print(SetText.split(","))
  Jams = SetText.split(",")
  JamNr = 1
  for Jam in Jams:
    InsertValues = [str(SetListID), str(JamNr), Jam]
    myCursorInsert = mydb.cursor()
    myCursorInsert.execute(sqlInsert, InsertValues)
    mydb.commit()
    myCursorInsert.close()
    JamNr = JamNr + 1
