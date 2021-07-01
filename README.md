# About
Repository contains Dockerfile to build deb package nxlog-ce for ubuntu focal. All dependensis install in image, and deb package build.

Steps to build:
1. Download Dockerfile ```wget https://raw.githubusercontent.com/ilkarataev/build_nxlog-ce_focal/main/Dockerfile```
2. Build image ```docker build -t build-nxlog-ce-focal ./```
3. Run container ```docker run -d --name build-nxlog-ce-focal  build-nxlog-ce-focal```
4. deb packages will be create in the /root/ dir(nxlog-ce_2.10.7_amd64.deb).
5. Yoy can copy in another console ```docker cp build-nxlog-ce-focal:/root/nxlog-ce_2.10.7_amd64.deb ./```
6. Delete container ```docker rm -f build-nxlog-ce-focal``` and image docker image rm build-nxlog-ce-focal
