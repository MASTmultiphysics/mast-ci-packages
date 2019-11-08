#!/usr/bin/env bash

#if [ "${LIBMESH_VERSION}" = linux ]

cd ${HOME}
wget https://github.com/libMesh/libmesh/releases/download/v1.3.1/libmesh-1.3.1.tar.gz
tar -xf libmesh-1.3.1.tar.gz
cd libmesh-1.3.1
pwd
