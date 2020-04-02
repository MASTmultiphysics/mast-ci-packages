docker rm libmesh-141-pkg-build-ubuntu-18.04
docker run -it --entrypoint /bin/bash --name libmesh-141-pkg-build-ubuntu-18.04 -v ${PWD}:/package ubuntu:18.04