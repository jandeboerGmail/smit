# List to Converted Files
import os,time

#videoPath='/home/jan/video/'
videoPath='/mnt/cctv/KLANTEN/DOWNLOAD/Stadgenoot' 

i = 0

for root, dirs, files in os.walk(videoPath, topdown=True):
  
        for name in files:
            filename = os.path.join(root, name)
            print("Files :",os.path.join(root, name))
            if "2Convert" in filename:
                if ".MP4" in filename or ".mp4" in filename:
                    if (os.path.getsize(filename)) > 0:
                        startTime = time.time()
                        i = i+1
                        print('To Convert [' , str(i),']:', filename) 
                        file_stats = os.stat(filename)
                        #print(file_stats)
                        file_size = file_stats.st_size / (1024 * 1024)
                        message = "Converted " + filename + " " + str(file_size) + " MB"
                        print("Mess ",message)
                        #time.sleep(5)
                        endTime = time.time()
                        elapsedTime = endTime- startTime
                        #final_res = elapsedTime / 60
                        #print('Execution time:', final_res, 'minutes')
                        message = time.strftime("%H:%M:%S", time.gmtime(elapsedTime))
                        print ("Message " + message)
                        #print('Execution time:', time.strftime("%H:%M:%S", time.gmtime(elapsed_time)))


print('\n   Total  [', str(i),']')
print('Execution time:', elapsedTime, 'seconds')
