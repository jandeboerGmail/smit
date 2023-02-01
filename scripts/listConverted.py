import os,time,shutil

#inpath='/home/jan/media/'
inpath='/mnt/cctv/KLANTEN/DOWNLOAD/'
outpath='/home/jan/results'
processedPath = '/home/jan/Processed'

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
i = 0
for root, dirs, files in os.walk(inpath, topdown=True):
  
        for name in files:
            filename = os.path.join(root, name)
            # print("Files :",os.path.join(root, name))
            if "Converted" in filename:
                #print('infile   :',filename)
                if ".MP4" in filename or ".mp4" in filename and "._" not in filename:
                    i+=1
                    print('Converted ',i , filename) 
                    after = substring_after(filename,"/") 
            
                    if (os.path.getsize(filename)) > 0:
                        #print('After :',after)
    
                        request = after[0:after.find("/")]
                        #print('request:',request)
                        newDir = os.path.join(outpath,request)
                        #if not os.path.isdir(newDir):
                        #    os.mkdir(newDir)
            
                        outFile = os.path.join(outpath,after)
               
                        outFile = outFile.replace(".mp4", ".webm")
                        outFile = outFile.replace(".MP4", ".webm")

                        outFile = outFile.replace(" ", "\ ")
                        inFile = filename.replace(" ", "\ ")


                        #print('Converting:  ',inFile, 'to', outFile) 
                        #print ("Out location:", outFile)
                   
                        #print('Request: ',request)
                        # extract bedrijf
                        bedrijf = substring_after(inFile, inpath)
                        bedrijf = substring_before(bedrijf, "/")
                        #print ("Bedrijf: ", bedrijf)
                        #extract locatie
                        locatie = substring_after(inFile, bedrijf + '/')
                        locatie = substring_before(locatie, "/")
                        #print ("Locatie: ", locatie)
                    
                        #extract Naaam
                        s = outFile
                        while substring_after(s, "/"):
                                s = substring_after(s, "/")
                                #print ("s" ,s)
                        naam = substring_before(s, ".webm")
                        #print ("Naam:    ",naam)

                        #extract camera
                        camera= substring_before(naam, "_2")
                        #print ("Camera:  ", camera)

                        # extract recorded from till
                        recTill = naam
                        while substring_after(recTill, "_"):
                                recTill = substring_after(recTill, "_")
                                #print("recTill: ",recTill)

                        #extract recorded from
                        recFrom = substring_before(naam, recTill)
                        recFrom = substring_after(recFrom,camera + "_")
                        recFrom = substring_before(recFrom,"_")

                        #print ("recFrom: " , recFrom)
                        #print ("RecTill: " , recTill)
                        #print ("Codec:    vb9\n\n")


