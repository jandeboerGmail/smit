# List to Converted Files
import os,time

inpath='/home/jan/video/'

i = 0
for root, dirs, files in os.walk(inpath, topdown=True):
  
        for name in files:
            filename = os.path.join(root, name)
            # print("Files :",os.path.join(root, name))
            if "2CONVERT" in filename or "2convert"  in filename:
                if ".MP4" in filename or ".mp4" in filename:
                    if (os.path.getsize(filename)) > 0:
                        i = i+1
                        print('To Convert [' , str(i),']:', filename) 

print('\nTotal  [', str(i),']')