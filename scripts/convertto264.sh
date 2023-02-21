INPUT="$1"
for i in *265*.* ; do
    #ffmpeg -i "$i" -bsf:v h264_mp4toannexb -sn -map 0:0 -map 0:1 -vcodec libx264 "$i.ts"
    ffmpeg -i "$i" "$i.ts"
    mv "$i.ts" "$i.mp4"
    sleep 3
done
