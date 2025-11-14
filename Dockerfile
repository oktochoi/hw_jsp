FROM ubuntu:latest
LABEL authors="chick"

ENTRYPOINT ["top", "-b"]