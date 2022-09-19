
import os,time,shutil

inpath='/home/jan/video/'
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

for root, dirs, files in os.walk(inpath, topdown=True):
  
        for name in files:
            filename = os.path.join(root, name)
            # print("Files :",os.path.join(root, name))
            if "2Convert" in filename or "2convert"  in filename:
                #print('inFile :',filename)
                if ".MP4" in filename or ".mp4" in filename and "._" not in filename:
                    after = substring_after(filename,"2Convert/") or substring_after(filename,"2convert/")
            
                    if (after and size_changed(filename,5)) and (os.path.getsize(filename)) > 0:
                        #print('After :',after)
    
                        request = after[0:after.find("/")]
                        print('request:',request)
                        newDir = os.path.join(outpath,request)
                        #if not os.path.isdir(newDir):
                        #    os.mkdir(newDir)
            
                        outFile = os.path.join(outpath,after)
               
                        outFile = outFile.replace(".mp4", ".webm")
                        outFile = outFile.replace(".MP4", ".webm")

                        outFile = outFile.replace(" ", "\ ")
                        inFile = filename.replace(" ", "\ ")


                        print('Converting :' ,inFile, 'to', outFile) 
    
                        command = "ffmpeg  -i " + inFile 
                        command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile
                        #print('Command :',command) 
                        #os.system(command)

                        #ffile_isize
                        #file_stats = os.stat(filename)
                        #print(file_stats)
                        #print(f'File Size in Bytes is {file_stats.st_size}')
                        #print('File Size in MegaBytes is {file_stats.st_size / (1024 * 1024)}')
            
                        #move the original file
                        #destFile = filename.replace("2convert","done")
                        #destFile = destFile.replace("2CONVERT","done")

                        #make/check output dir before move
                        #destDir = substring_before(destFile, "done") + "done/"
                        #print('destDir :',destDir)
                        #if not os.path.isdir(destDir):
                         #   os.mkdir(destDir)
                        #destDir = destDir + request
                        #if not os.path.isdir(destDir):
                         #   os.mkdir(destDir)
                        #print('Dest :',destFile)
                        #shutil.move(filename,destFile)

                        s = outFile
                        while substring_after(s, "/"):
                                s = substring_after(s, "/")
                                print ("s" ,s)
                        naam = substring_before(s, ".webm")

                        print ("Naam: ",naam)
                        print ("Request: ",request)
                        print ("Location: ", outFile)
                        print ("Codec: vb9")
                        '''
                        
                       
                        print ("Recordingfrom: " , recordingFrom)
                        print ("RecordingTo: " , recordingTo)
                
                        print ("Codec: vb9")


                        
                        '''
                       
                
                





