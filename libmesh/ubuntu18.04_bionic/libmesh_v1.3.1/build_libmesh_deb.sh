#!/usr/bin/env bash

# Get # of processors in environment variables.
export NP=$(nproc)
# Store current location as working directory.
export WORK_DIR=${PWD}

# Update packages fromt apt repos.
sudo apt-get update
sudo apt-get -y install build-essential gfortran wget less m4 git cmake
sudo apt-get -y install openmpi-bin libopenmpi-dev
sudo apt-get -y install petsc-dev libpetsc3.7.7-dbg
sudo apt-get -y install slepc-dev
sudo apt-get -y install metis libmetis-dev
sudo apt-get -y install libparpack2-dev
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install libeigen3-dev

# Fetch/build libMesh.
# Note we currently have to use a modified version of the release with some updates to the libMesh
# build to allow for a non-provided, non-PETSc version of metis provided by the Ubuntu repositories.
git clone -b v1.3.1_with_build_updates --single-branch https://github.com/jdeaton/libmesh.git
cd libmesh
mkdir build
cd build
export PETSC_DIR=/usr/lib/petsc
export SLEPC_DIR=/usr/lib/slepc
export HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi
../configure --prefix=/usr/local --with-methods="opt dbg" --disable-metaphysicl --disable-examples --enable-triangle=yes --enable-tetgen=yes --disable-strict-lgpl --with-metis=/usr/lib/x86_64-linux-gnu --with-metis-include=/usr/include
make -j ${NP}
sudo make install

# Organize libMesh include/ and lib/ for packaging.
cd ${WORK_DIR}
export PKG_DIR=libmesh-1.3.1-1
export INST_DIR=${PKG_DIR}/usr/local
mkdir ${PKG_DIR}
mkdir ${PKG_DIR}/usr
mkdir ${PKG_DIR}/usr/local
mkdir ${PKG_DIR}/usr/local/include
mkdir ${PKG_DIR}/usr/local/lib
cp -r /usr/local/include/* ${INST_DIR}/include
cp -r /usr/local/lib/libmesh* ${INST_DIR}/lib
cp -r /usr/local/lib/libnetcdf* ${INST_DIR}/lib

# Copy in DEBIAN/control package configuration file.
cp -r ${WORK_DIR}/DEBIAN ${PKG_DIR}

# Create libMesh .deb package.
dpkg-deb --build libmesh-1.3.1-1
