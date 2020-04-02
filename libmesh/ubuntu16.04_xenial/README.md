# libMesh - Ubuntu 16.04 (Travis CI)
This directory contains a script for creating a `.deb` package that can be installed on Ubuntu 16.04 (Xenial) (or possibly another Debian-based Linux distribution). The resulting package will work on the default **Travis CI** *xenial* runner. At this point, all dependencies are installed using Ubuntu's standard package manager.

## Building on Ubuntu 16.04
On a Ubuntu 16.04 system, simply run the script `build_libmesh_deb.sh`. This script will:

1. Install required dependencies with the standard package manager and Ubuntu repositories.
2. Fetch the libMesh v1.3.1 release from GitHub.
3. Unpack, compile, and install libMesh libraries and headers to `/usr/local`.
4. Create the package `libmesh-1.3.1-1.deb`.

## Building with Ubuntu 16.04 Docker image
The `libmesh-1.3.1-1.deb` package can also be generated using a Ubuntu 16.04 Docker image. From within the current directory call `run_with_docker.sh`, which will drop you inside an interactive Docker container. Note that the current directory (containing this file) is mapped to `/package` inside the container.

Next, run 

```
apt-get update
apt-get install sudo
cd /package
```

The build script can then be run as `build_libmesh_deb.sh` and the resulting `libmesh-1.3.1-1.deb` will be available outside the Docker container in the current directory.

## References
The following links contain references related to making binary packages on Ubuntu.
- https://ubuntuforums.org/showthread.php?t=910717
- https://askubuntu.com/questions/1345/what-is-the-simplest-debian-packaging-guide
- https://www.debian.org/doc/debian-policy/ch-controlfields.html
