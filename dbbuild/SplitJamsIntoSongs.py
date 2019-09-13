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
myCursorInsert = mydb.cursor()


#NewSetList = open("NewSetList.csv", "w+")
#NewSetList = open("NewSetList.csv", "a")
sqlInsert = "INSERT INTO tblsong (SongID, JamID, SongNr, SongText, JammedOutOf) VALUES (%s, %s, %s, %s, %s)"

SongID = 1
for OrigLine in myresult:
  JamID = OrigLine[0]
  JamText = OrigLine[3]
  #print(OrigLine)
  #print(JamID)
  #print(JamText)
  #print(JamText.split(">"))
  Songs = JamText.split(">")
  SongNr = 1
  #print(len(Songs))
  SongsLen = len(Songs) - 1
  for Index, SongText in enumerate(Songs):
    if SongsLen == 0 or Index == SongsLen:
      JammedOutOf = "" 
    else:
      JammedOutOf = ">"
    #wait = input("PRESS ENTER TO CONTINUE")    
    InsertValues = [SongID, JamID, Index + 1, SongText, JammedOutOf]
    SongID = SongID + 1    
    myCursorInsert.execute(sqlInsert, InsertValues)

mydb.commit()
myCursorInsert = mydb.cursor()

