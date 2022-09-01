# Convert 265 Video files to 264
from operator import eq
import os,time,shutil

videoPath='/home/jan/video/'

def removeFile(fileName):
   if os.path.exists(fileName):
        os.remove(fileName)
        print('Removed File :',fileName)

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

for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            filename = os.path.join(root, name)
            # print("Files :",os.path.join(root, name))
            if "2Convert" in filename:
                #print('inFile :',filename)
                if ".MP4" in filename or ".mp4" in filename:
                    after = substring_after(filename,"2Convert/") 
            
                    if (after and size_changed(filename,5)) and (os.path.getsize(filename)) > 0:
                        #print('After :',after)
                        request = after[0:after.find("/")]
                        print('request:',request)
                        
                        #make/check output dir
                        destDir = substring_before(filename, "2Convert") + "Converted/" 
                       
                        print('destDir :',destDir)
                        if not os.path.isdir(destDir):
                            os.mkdir(destDir)
                
                        outFile = os.path.join(destDir,after)
               
                        outFile = outFile.replace(".mp4", ".webm")
                        outFile = outFile.replace(".MP4", ".webm")

                        outFile = outFile.replace(" ", "\ ")
                        inFile = filename.replace(" ", "\ ")

                        print('Converting :' ,inFile, 'to', outFile)

                        #command 
                        #command = "cp " + inFile + " " + outFile 

                        command = "ffmpeg  -i " + inFile 
                        #vb9 onepass
                        #command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                        #vb9 twopass
                        command = command + " -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && ffmpeg -i " + inFile 
                        command = command + " -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus "  + outFile

                        print('Command :',command) 
                        removeFile(outFile)
                        result = os.system(command)

                        print('Result :',result)
                        if result ==  0: # 256 error
                            print('Infile:',inFile)
                            #removeFile(inFile)
                             
                        