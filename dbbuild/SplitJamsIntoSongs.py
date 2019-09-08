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
mycursor.execute("SELECT * FROM tbljam order by jamid")
myresult = mycursor.fetchall()

#NewSetList = open("NewSetList.csv", "w+")
#NewSetList = open("NewSetList.csv", "a")
sqlInsert = "INSERT INTO tblsong (JamID, SongNr, Song) VALUES (%s, %s, %s)"

for OrigLine in myresult:
  JamID = OrigLine[0]
  JamText = OrigLine[1]
  print(JamID)
  print(JamText)
  print(JamText.split(">"))
  Songs = SetText.split(">")
  SongNr = 1
  for Song in Songs:
    InsertValues = [str(JamID), str(SongNr), Song]
    myCursorInsert = mydb.cursor()
    myCursorInsert.execute(sqlInsert, InsertValues)
    mydb.commit()
    myCursorInsert.close()
    SongNr = SongNr + 1
