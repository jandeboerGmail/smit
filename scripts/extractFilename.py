'''
filename = Remijden\ 1_ch8_20190304104502_20190304112000.mp4

- Locatie    Remijden 1
- Camera     ch8
- van datum  20190304104502 
- tot datum  20190304112000
- extensie   mp4 (265/264)

'''
def substring_after(s, delim):
        return s.partition(delim)[2]

def substring_before(s, delim):
        return s.split(delim)[0]

def extractFilename(name):
    print ("filename : ",name)
    location = substring_before(name, "_ch")  
    print ("location : ",location)

    remainder = substring_after(name, location)
    remainder = remainder[1:] # strip "_"
    #print ("remainder: ",remainder)
    camera = substring_before(remainder, "_") 
    print ("camera   : ",camera)

    remainder = substring_after(name, camera)
    remainder = remainder[1:] # strip "_"
    #print ("remainder: ",remainder)
    timeFrom =  substring_before(remainder, "_") 
    print ("timeFrom : ",timeFrom)

    remainder = substring_after(remainder, timeFrom)
    remainder = remainder[1:] # strip "_"
    #print ("remainder: ",remainder)
    timeTill =  substring_before(remainder, ".") 
    print ("timeTill : ",timeTill)

    remainder = substring_after(remainder, timeTill)
    #print ("remainder: ",remainder)
    extension =  remainder = substring_after(remainder, ".")
    print ("extension: ",extension)

#main
filename = "Remijden\ 1_ch8_20190304104502_20190304112000.mp4"
extractFilename(filename)
filename = "Buitenwijk1\ 1_ch108_20190306104502_20190306112000.mp4"
extractFilename(filename)
   
   