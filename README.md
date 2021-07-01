# About
Repository contains Dockerfile to build deb package nxlog-ce for ubuntu focal. All dependensis install in image, and deb package build.

Steps to build:
1. Download Dockerfile
2. docker build -t build-nxlog-ce-focal ./
3. docker run -i -t --rm build-nxlog-ce-focal /bin/bash
4. deb packages will be create in the /root/ dir(nxlog-ce_2.10.7_amd64.deb).
5. Yoy can copy in another console docker cp build-nxlog-ce-focal:/root/nxlog-ce_2.10.7_amd64.deb ./
