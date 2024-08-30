# nersc-container-build-template

This template repo can be used to build images compatible with NERSC systems running x86_64 like Spin and Perlmutter as well as work on newer Apple laptops with M series arm processors.

After making your template copy in your code and Dockerfile and the the workflow file will automatically build the `Dockerfile` in the repos main directory. After the build process, images are automatically uploaded to the github registry associalted with your copy of the template.


## Multi-arch builds and TARGETARCH

Sometimes your code may need to know which cpu architecture it is building for, or may need to download a specific binary based on the architecture. Inside your `Dockerfile` you can use the options from the table below to get the correct parts into your build. Make sure to add the varible as an `ARG` to your `Dockerfile` for the argument to be availble duing the build process. More information on multi platform builds can be found from [this doc](https://www.docker.com/blog/faster-multi-platform-builds-dockerfile-cross-compilation-guide/).

```
BUILDPLATFORM — matches the current machine. (e.g. linux/amd64)

BUILDOS — os component of BUILDPLATFORM, e.g. linux

BUILDARCH — e.g. amd64, arm64, riscv64

BUILDVARIANT — used to set ARM variant, e.g. v7

TARGETPLATFORM — The value set with --platform flag on build

TARGETOS - OS component from --platform, e.g. linux

TARGETARCH - Architecture from --platform, e.g. arm64
```

As an example of downloading a version of `go` compatible with your target image.
```Dockerfile
FROM ubuntu:latest

ARG GOVERSION=1.14.2
# Download the go binary for the correct TARGETOS and TARGETARCH
ARG TARGETARCH
ARG TARGETOS
RUN wget https://dl.google.com/go/go${GOVERSION}.${TARGETOS}-${TARGETARCH}.tar.gz \
    tar -xvf  go${GOVERSION}.${TARGETOS}-${TARGETARCH}.tar.gz
```