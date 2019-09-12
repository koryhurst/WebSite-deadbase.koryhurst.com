import csv
import mysql.connector
import sys
sys.path.append('../../Python-FunctionLibrary')
import BeautifulSoupFunctions

DatabaseDetails = ["localhost","root","","dbkhurst"]

mydb = mysql.connector.connect(
  host=DatabaseDetails[0],
  user=DatabaseDetails[1],
  passwd=DatabaseDetails[2],
  database=DatabaseDetails[3]
  )

#NewSetList = open("NewSetList.csv", "w+")
#NewSetList = open("NewSetList.csv", "a")
#OldSetList = open("setlist.csv", "r")

NewSetList = open("NewSetList2ndPass.csv", "w+")
NewSetList = open("NewSetList2ndPass.csv", "a")
OldSetList = open("NewSetList.csv", "r")


SplitPoints = ["Electric-2:", "1.5:","2:","2.5:","E:","E1:","E2:"]
ShowID = 0
LinesAddedToThisShow = 0

OldFileLines = OldSetList.readlines()
for OrigLine in OldFileLines:
  SplitLinesOutput = False
  if OrigLine[0:OrigLine.find(",")] != ShowID:  
    ShowID = OrigLine[0:OrigLine.find(",")]
    LinesAddedToThisShow = 0
  LineNr = OrigLine[OrigLine.find(",")+1:OrigLine.find(",",OrigLine.find(",")+1)] #weird way of finding the second one.
  SetText = OrigLine[len(ShowID) + len(LineNr) + 2:len(OrigLine)]
  print("-------------")
  print("OrigText: " + OrigLine)
  print("ShowID: " + ShowID)
  print("LineNr: " + LineNr)
  print("SetText: " + SetText)
  for SplitPoint in SplitPoints:
    
    
    #first is there a split point in there
    if SetText.find(SplitPoint) > 12:
      print("Found Split Point")
      print("SplitPoint: " + str(SetText.find(SplitPoint)))
      #ThisSplitPoint = SplitPoint
      #print(OrigLine)
      #is it not at the start of the set text
      #if OrigLine.find(SplitPoint) != len(ShowID) + len(LineNr) + 3:



      if SetText[0:len(SplitPoint)] != SplitPoint:
        
        print(SetText[0:len(SplitPoint)])
        OldLinePart1 = OrigLine[0:OrigLine.find(SplitPoint)-2] + '"'
        print("OldLinePart1: " + OldLinePart1)
        OldLinePart2 = ShowID + ',' + str((int(LineNr) + 1)) + ',"' + OrigLine[OrigLine.find(SplitPoint)-1:len(OrigLine)]
        print("OldLinePart2: " + OldLinePart2)
        LinesAddedToThisShow = LinesAddedToThisShow + 1
        NewSetList.write("insert tblsetlist (showid, linenr, settext) values (" + OldLinePart1 + ');\n')
        NewSetList.write("insert tblsetlist (showid, linenr, settext) values (" + OldLinePart2.rstrip() + ');\n')
        
        #wait = input("PRESS ENTER TO CONTINUE")
        
        SplitLinesOutput = True
  if SplitLinesOutput == False:
    NewSetList.write("insert tblsetlist (showid, linenr, settext) values (" + str(ShowID) + "," + str(int(LineNr) + int(LinesAddedToThisShow)) + "," + SetText.rstrip() + ');\n')
    