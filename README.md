# BugStage Docker image

Multi-arch image built from the official BugStage release zips at https://ganigeorgiev.com.

The workflow runs daily, picks the latest release, and pushes the image to `ghcr.io/felix-schindler/bugstage`.

```sh
docker run -p 8090:8090 -p 8022:8022 -v bugstage_data:/app/pb_data ghcr.io/felix-schindler/bugstage:latest
```

Drop `-p 8022:8022` if you don't need Git over SSH.
