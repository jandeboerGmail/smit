
#import ffmpy
import os

inpath='/home/jan/video/'
outpath='/home/jan/results'
processedPath = '/home/jan/Processed'

def substring_after(s, delim):
    return s.partition(delim)[2]

for root, dirs, files in os.walk(inpath, topdown=True):
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
                newDir = os.path.join(outpath,request)
                if not os.path.isdir(newDir):
                    os.mkdir(newDir)
            
                outFile = os.path.join(outpath,after)
               
                outFile = outFile.replace(".mp4", ".webm")
                outFile = outFile.replace(".MP4", ".webm")
        
                print('Converting :' ,filename, 'to', outFile) 
                #ffmpeg -i %s -crf 30 -threads 2 ./converted/%s\n' %(n, n.replace(".mov", ".mp4"))
        
                #command = "ffmpeg  -i \" + filename + " -c:v libvps-vp9 -b:v 2M \" + outFile +  "/n"
                command = "ffmpeg  -i " + filename 
                command = command + " -c:v libvpx-vp9 -b:v 2M " + outFile +  " >> /home/jan/results/logfile"
                print('Command :',command) 
                os.system(command)
                #os.system("ffmpeg -i {0} -f image2 -vf fps=fps=1 output%d.png".format(filename))
            


