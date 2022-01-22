# Generate FFMETADATAFILE to insert chapters into an MP4 file
#
# @see https://ffmpeg.org/ffmpeg-formats.html (search for "FFMETADATA")
#
# == Input file format:
# 00:01:00 Some Title
# 00:03:44 Some other title
# 01:20:29 Another thing
# 01:39:41 The End
# == Examples
# python3 generate_chapters.py ChapterDetails.txt
# 
# == Retrieving current Chapter Information
# ffmpeg -i INPUT -f ffmetadata FFMETADATAFILE
#
# == Inserting new Chapter Information
# ffmpeg -i INPUT -i FFMETADATAFILE -map_metadata 1 -codec copy OUTPUT

import re
import sys

chapters = list()

chapter_file_path = sys.argv[1]

with open(chapter_file_path, 'r') as f:
   for line in f:
      print('Processing line: ' + line)
      x = re.match(r"(\d{1,2}):(\d{2}):(\d{2}) (.*)", line)
      # Go to next line if no match
      if x is None:
         continue
      hrs = int(x.group(1))
      mins = int(x.group(2))
      secs = int(x.group(3))
      title = x.group(4)

      minutes = (hrs * 60) + mins
      seconds = secs + (minutes * 60)
      timestamp = (seconds * 1000)
      chap = {
         "title": title,
         "startTime": timestamp
      }
      chapters.append(chap)

text = """;FFMETADATA1

"""

for i in range(len(chapters)-1):
   chap = chapters[i]
   title = chap['title']
   start = chap['startTime']
   end = chapters[i+1]['startTime']-1
   text += f"""
[CHAPTER]
TIMEBASE=1/1000
START={start}
END={end}
title={title}
"""


with open("FFMETADATAFILE", "a") as myfile:
    myfile.write(text)
