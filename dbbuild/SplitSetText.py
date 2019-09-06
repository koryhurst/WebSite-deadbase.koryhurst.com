import csv

NewSetList = open("NewSetList.csv", "w+")
OldSetList = open("setlist.csv", "r")

SplitPoints = ["1.5:","2:","2.5:","E:","E1:","E2:"]

OldFileLines = OldSetList.readlines()
for OrigLine in OldFileLines:
  ShowID = OrigLine[0:OrigLine.find(",")]
  LineNr = OrigLine[OrigLine.find(",")+1:OrigLine.find(",",OrigLine.find(",")+1)] #weird way of finding the second one.
  print("-------------")
  print(OrigLine)
  print(ShowID)
  print(LineNr)
  for SplitPoint in SplitPoints:
    if OrigLine.find(SplitPoint) > 0:
      ThisSplitPoint = SplitPoint
      #print(OrigLine)
      print("Found Split Point")
      OldLinePart1 = OrigLine[0:OrigLine.find(ThisSplitPoint)] + '"'
      print("OldLinePart1: " + OldLinePart1)
      OldLinePart2 = ShowID + ',' + str((int(LineNr) + 1)) + ',' + OrigLine[OrigLine.find(ThisSplitPoint):len(OrigLine)]
      print("OldLinePart2: " + OldLinePart2)
      wait = input("PRESS ENTER TO CONTINUE")
  
  
#      1.5:
#      2:
#      2.5:
#      E:
#      E1:
#      E2:

