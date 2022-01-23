#!/bin/sh
# This is an example file.
# It came from running: create-clips --dry-run --from_file=timestamps_file.txt VHS/2022-01-12 18-48-07 Emilys Kindergarten.mp4 Clips/

/bin/ffmpeg -i "VHS/2022-01-12 18-48-07 Emilys Kindergarten.mp4" -ss 00:00:05 -to 00:21:07 -map_chapters -1 -avoid_negative_ts 1 -y "Clips/2022-01-12 18-48-07 Emilys Kindergarten.Emily Kindergarten Graduation.clip.mp4"
/bin/ffmpeg -i "VHS/2022-01-12 18-48-07 Emilys Kindergarten.mp4" -ss 00:21:07 -to 00:24:17 -map_chapters -1 -avoid_negative_ts 1 -y "Clips/2022-01-12 18-48-07 Emilys Kindergarten.Its Over!.clip.mp4"
/bin/ffmpeg -i "VHS/2022-01-12 18-48-07 Emilys Kindergarten.mp4" -ss 00:24:17 -to 00:25:53 -map_chapters -1 -avoid_negative_ts 1 -y "Clips/2022-01-12 18-48-07 Emilys Kindergarten.Outside after Graduation.clip.mp4"
/bin/ffmpeg -i "VHS/2022-01-12 18-48-07 Emilys Kindergarten.mp4" -ss 00:25:53 -to 00:29:43 -map_chapters -1 -avoid_negative_ts 1 -y "Clips/2022-01-12 18-48-07 Emilys Kindergarten.Back Home Blowing Bubbles.clip.mp4"
/bin/ffmpeg -i "VHS/2022-01-12 18-48-07 Emilys Kindergarten.mp4" -ss 00:29:43 -to 00:30:33 -map_chapters -1 -avoid_negative_ts 1 -y "Clips/2022-01-12 18-48-07 Emilys Kindergarten.Anne Stalks the Neighbors.clip.mp4"
