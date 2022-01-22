# Video Scripts
Scripts to make working with large video files easier. Specifically VHS tape importing and chapter inserting.

Does not work if ruby is not installed on your system. Still need to tweak how the docker ruby works. May have to dockerize ruby + ffmpeg together

## generate-mp4-chapter-metadata
Given a normal text file with timestamps in it:

```
00:00:30 Start
00:13:12 Halloween Party 1994
00:27:32 Christmas 1994
00:43:16 Birthday Party with Grandparents
00:55:42 End
```
Create an FFMETADATAFILE file based on https://ffmpeg.org/ffmpeg-formats.html (search for "FFMETADATA").
That FFMETADATAFILE file can be used to insert chapters into mp4 files that programs like Plex can read.

## set-mp4-chapter-metadata
Given an MP4 file, it uses the current directory's FFMETADATAFILE to insert chapter data into the mp4 file.
It outputs the new file with `-chapters` appended to the name (e.g "My Movie.mp4" becomes "My Movie-chapters.mp4")
