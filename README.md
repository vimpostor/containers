# Containers

Repository of all my container images. Prebuilt images are available at [Docker Hub](https://hub.docker.com/u/vimpostor) in the `vimpostor` namespace.

Instructions to push a new image:

```bash
podman build -t imagename .
podman login
podman push imagename:latest vimpostor/imagename:latest
```
