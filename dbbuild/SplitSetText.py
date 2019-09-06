import csv

NewSetList = open("NewSetList.csv", "a+")
OldSetList = open("setlist.csv", "r")

SplitPoints = ["1.5:","2:","2.5:","E:","E1:","E2:"]
ShowID = 0
LinesAddedToThisShow = 0
OldFileLines = OldSetList.readlines()
for OrigLine in OldFileLines:
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
    # I think this automatically only finds ones after the first one
    if SetText.find(SplitPoint) > 1:
      print("SplitPoint: " + str(SetText.find(SplitPoint)))
      ThisSplitPoint = SplitPoint
      #print(OrigLine)
      print("Found Split Point")
      #is it not at the start of the set text
      if OrigLine.find(SplitPoint) != len(ShowID) + len(LineNr) + 3:
        print(len(ShowID) + len(LineNr) + 3)
        OldLinePart1 = OrigLine[0:OrigLine.find(ThisSplitPoint)-1] + '"\\r\\n'
        print("OldLinePart1: " + OldLinePart1)
        OldLinePart2 = ShowID + ',' + str((int(LineNr) + 1)) + ',"' + OrigLine[OrigLine.find(ThisSplitPoint):len(OrigLine)]
        print("OldLinePart2: " + OldLinePart2)
        LinesAddedToThisShow = LinesAddedToThisShow + 1
        NewSetList.write(OldLinePart1)
        NewSetList.write(OldLinePart2)
        wait = input("PRESS ENTER TO CONTINUE")
    else:
      NewSetList.write(ShowID + "," + str(int(LineNr) + LinesAddedToThisShow) + "," + SetText)
  
  
#      1.5:
#      2:
#      2.5:
#      E:
#      E1:
#      E2:

