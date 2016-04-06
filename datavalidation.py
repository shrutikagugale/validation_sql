import os,sys

#filename=sys.argv[1]

fp=open(sys.argv[1],"r")
while 1:
    line = fp.readline()
    if line=="\n":
        continue
    if not line:
        break
    #print line
    line=line[0:-3]
    line=line.split("(")
    line2=line[0].split()
    print line2[2]
    line1=line[1].split(",")
    #for j in range (0,len(line1)):
     #   print line1[j]
