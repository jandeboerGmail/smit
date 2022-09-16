# extract information from filename
# ex: Remijden\ 1_ch8_20190304104502_20190304112000.mp4
# - Locatie    Remijden 1
# - Camera     ch8
# - van datum  20190304104502 
# - tot datum  20190304112000
# - extension  mp4
import os,time

def size_changed(fileName,sec):
        b_size = os.path.getsize(fileName)
        time.sleep(sec)
        e_size = os.path.getsize(fileName)
        #print('Sizes :',b_size, e_size)
        return b_size == e_size

def substring_after(s, delim):
        return s.partition(delim)[2]

def substring_before(s, delim):
        return s.split(delim)[0]

def extractFilenameItems(aFileName):
    print("Filename",aFileName)
    return

#main
extractFilenameItems("Remijden\ 1_ch8_20190304104502_20190304112000.mp4)")