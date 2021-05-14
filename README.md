# Containers

Repository of all my container images. Prebuilt images are available at Docker Hub in the `vimpostor` namespace.

Instructions to push a new image:

```bash
podman built -t imagename .
podman login
podman push imagename:latest vimpostor/imagename:latest
```
