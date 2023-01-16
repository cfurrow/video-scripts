# Video Scripts
Scripts to make working with large video files easier. Specifically VHS tape importing and chapter inserting.

## Install

```
git clone https://github.com/cfurrow/video-scripts
cd video-scripts

rake install
```


## Set chapters in mp4

### With docker (once `chapterize` is built)

```
docker run -it --rm -v "$PWD/VHS:/VHS" chapterize "VHS/1996-1997 - birthdays, etc-trimmed.txt" "VHS/1996-1997 - birthdays, etc-trimmed.mp4"
```

That will output VHS/1996-1997 - birthdays, etc-trimmed-chapters.mp4

## Create clips

### With docker (once `create-clips` is built)

```
docker run -it --rm -v "$PWD/VHS:/VHS" -v "$PWD/Clips:/Clips" create-clips -f VHS/1996-1997\ -\ birthdays\,\ etc-trimmed.txt VHS/1996-1997\ -\ birthdays\,\ etc-trimmed.mp4 Clips/
```
That will create clips inside of the `Clips` dir

## Timestamp txt file format
The contents of your txt file in order to make chapters or make clips should be something like this:

```
00:00:00 Some description
00:01:33 Another description
00:45:12 You get the idea
02:55:00 you need to specify the very last clip time or end of the file
```

Note that you will probably want to make sure you've added a timestamp entry for the end of the video to properly create all the clips you want. The scripts make clips using the current line's timestamp up to the next line's timestamp. Essentially it would take the above timestamp file and run these ffmpeg comands:

```
ffmpeg -i input.mp4 -ss 00:00:00 -to 00:01:33 "input - Some description.clip.mp4"
ffmpeg -i input.mp4 -ss 00:01:33 -to 00:45:12 "input - Another description.clip.mp4"
ffmpeg -i input.mp4 -ss 00:45:12 -to 02:55:00 "input - You get the idea.clip.mp4"
ffmpeg -i input.mp4 -ss 02:55:00 "input - you need to specify the very last clip time or end of the file.clip.mp4"
```
