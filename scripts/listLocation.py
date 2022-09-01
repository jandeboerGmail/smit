# !/usr/bin/python3
import os

inpath='/home/jan/video/'

for root, dirs, files in os.walk(inpath, topdown = False):
   #for name in files:
      #print('Name:',os.path.join(root, name))
   for name in dirs:
      print('Dirs ',os.path.join(root, name))