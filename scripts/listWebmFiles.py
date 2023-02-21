# Probe to Converted Files
import os,time

videoPath='/home/jan/media/'
#videoPath='/mnt/cctv/KLANTEN/DOWNLOAD/Stadgenoot' 

i = 0

for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            filename = os.path.join(root, name)
            #print("Files :",os.path.join(root, name))
            #if "2Convert" in filename:
            if ".WEBM" in filename or ".webm" in filename:
                    if (os.path.getsize(filename)) > 0 and "._" not in filename:
                        file_stats = os.stat(filename)
                        file_size = round(file_stats.st_size / (1024 * 1024))
                        i+=1
                        print ("% 5d" % i,'-',"% 6d" % file_size, ' MB ->',filename)