FROM ubuntu:latest

# These argmuents can be used to get the target cpu architecture
# which can be helpful buring the build process
ARG TARGETARCH
ARG TARGETOS