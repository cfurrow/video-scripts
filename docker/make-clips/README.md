# make-clips
This docker setup is simply used to run a bunch off ffmpeg commands to extract parts of videos and dump into smaller video files.

You will generate your long list of ffmpeg commands by using the `create-clips` command in "dry mode", which will output all the ffmpeg commands you will need to run. It's best to copy/paste that list of commands and put them in the 'make-clips.sh' file.

Once that is done, you can call ./build.sh and then ./run.sh to start processing your video files.

## Example

On a machine that has Ruby installed

```
create-clips --dry-run --from_file=timestamps_file.txt VHS/2022-01-12 18-48-07 Emilys Kindergarten.mp4 Clips/
```

Copy the results into `make-clips.sh`.
Copy the docker/make-clips directory onto your remote machine that will be doing the encoding.
Run `./build.sh` on that machine
Run `./run.sh` on that machine

This is a very clunky process, and hopefully will be revised as this project evolves
