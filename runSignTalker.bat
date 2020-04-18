#del Gov_Newsom_audio.flac
#del ibm_text.txt
ffmpeg -i Gov_Newsom.mp4 -vn Gov_Newsom_audio.flac
curl -X POST -u "apikey:NIHcwrQ2h3U9lIRi2VbeBo8gDO-gAUxj7q53-oUhLhm3" --header "Content-Type: audio/flac" --data-binary @Gov_Newsom_audio.flac "https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/6f3c35e0-ebb8-4e13-959c-8ef460448f14/v1/recognize" >> ibm_text.txt
SignTalker.exe
del Gov_Newsom_with_Sign.mp4
ffmpeg -f concat -safe 0 -i mylist.txt -c copy Gov_Sign.mp4
ffmpeg -i Gov_Sign.mp4 -vf "setpts=0.9*PTS" Gov_Sign2.mp4
ffmpeg -i Gov_Newsom.mp4 -i Gov_Sign2.mp4 -filter_complex "[0:0][1:0]overlay = 820:80[out]" -shortest -map [out] -map 0:1 -pix_fmt yuv420p -c:a copy -c:v libx264 -crf 18  Gov_Newsom_with_Sign.mp4
del Gov_Sign2.mp4
del Gov_Newsom_audio.flac
del Gov_Sign.mp4
del mylist.txt
del ibm_text.txt
Gov_Newsom_with_Sign.mp4



