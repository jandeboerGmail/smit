#import ffmpy
import os

path='/home/jan/video/'

def substring_after(s, delim):
    return s.partition(delim)[2]

for root, dirs, files in os.walk(path, topdown=True):
   for name in files:
     filename = os.path.join(root, name)
     # print("Files :",os.path.join(root, name))
     if "2CONVERT" or "2convert"  in filename :
        #print('inFile :',filename)
        if ".MP4" or ".mp4" in filename:
        
            after = substring_after(filename,"2CONVERT/") or substring_after(filename,"2convert/")
            if after :
                #print('After :',after)
    
                request = after[0:after.find("/")]
                #print('request:',request)
                   
                outFile = filename.replace(" ", "_")
        
                print('Renaming :' ,filename, 'to', outFile) 
                #os.rename(filename,outFile)