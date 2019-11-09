docker rm libmesh-141-pkg-build-ubuntu-16.04
docker run -it --entrypoint /bin/bash --name libmesh-141-pkg-build-ubuntu-16.04 -v ${PWD}:/package ubuntu:16.04