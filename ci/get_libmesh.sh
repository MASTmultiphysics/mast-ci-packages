#!/usr/bin/env bash

cd ${HOME}
rm -rf libmesh*

if [ "${LIBMESH_VERSION}" = "1.3.1" ]; then

  wget https://github.com/libMesh/libmesh/releases/download/v1.3.1/libmesh-1.3.1.tar.gz
  tar -xf libmesh-1.3.1.tar.gz
  mv libmesh-1.3.1 libmesh
  
elif [ "${LIBMESH_VERSION}" = "1.4.1" ]; then

  wget https://github.com/libMesh/libmesh/releases/download/v1.4.1/libmesh-1.4.1.tar.gz
  tar -xf libmesh-1.4.1.tar.gz
  mv libmesh-1.4.1 libmesh

elif [ "${LIBMESH_VERSION}" = "1.5.0" ]; then

  wget https://github.com/libMesh/libmesh/releases/download/v1.5.0/libmesh-1.5.0.tar.gz
  tar -xf libmesh-1.5.0.tar.gz
  mv libmesh-1.5.0 libmesh

else

  echo "INVALID LIBMESH VERSION: LIBMESH_VERSION=${LIBMESH_VERSION}"

fi