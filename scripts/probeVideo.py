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
            if ".MP4" in filename or ".mp4" in filename:
                    if (os.path.getsize(filename)) > 0 and "._" not in filename:
                        command = "ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 " + filename.replace(" ", "\ ") + " > isFormat"
                        #print('Command :',command) 
                        result = os.system(command)
                        with open('isFormat', 'r') as file:
                            formatData= file.read().replace('\n', '')
                    
                       
                        print ('Format :',formatData, '->', filename)


                    