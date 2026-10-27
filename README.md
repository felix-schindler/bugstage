# BugStage Docker image

Multi-arch image built from the official BugStage release zips at https://ganigeorgiev.com.

The workflow runs daily, picks the latest release, and pushes the image to `ghcr.io/<owner>/<repo>`. It skips the build if that version's image already exists.

```sh
docker run -p 8080:8080 -v bugstage_data:/app/pb_data ghcr.io/<owner>/<repo>:latest
```

Build locally:

```sh
docker build --build-arg VERSION=0.1.0-rc.1 -t bugstage .
```
