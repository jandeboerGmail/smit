INPUT="$1"
for i in *265*.* ; do
    #10-bit/12-bit HEVC to 8-bit H.264
    ffmpeg -i '$i' -map 0 -c:v libx264 -crf 18 -vf format=yuv420p -c:a copy "$i1.mp4"
    #10-bit/12-bit HEVC to 10-bit H.264
    ffmpeg -i '$i' -map 0 -c:v libx264 -crf 18 -c:a copy "$i2.mp4"
    #test
    ffmpeg -i "$i" -bsf:v h264_mp4toannexb -sn -map 0:0 -map 0:1 -vcodec libx264 "$i3.mp4"
    #fast
    ffmpeg -i "$i" -c:v libx264 -crf 51 -preset ultrafast -c:a aac "$i4.mp4"
done