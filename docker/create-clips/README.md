# create-clips
Dockerized version of the `create-clips` Ruby script.


## Build
- `cd docker/create-clips`
- `./build.sh`
- `alias docker-create-clips='docker run --rm -it -d --name="create-clips" -v "$PWD/VHS:/VHS" -v "$PWD/Clips:/Clips" create-clips'`

## Run
- `cd your-video-folder`
- `docker-create-clips --from_file=transcripts.txt VHS/INPUT.mp4 Clips/`

