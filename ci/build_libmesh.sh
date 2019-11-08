#!/usr/bin/env bash

cd ${HOME}
cd libmesh-1.3.1
mkdir build
cd build
pwd

if [ "${TRAVIS_OS_NAME}" = linux ]; then # Ubuntu Linux

  if [ "${TRAVIS_DIST}" = xenial ]; then # Ubuntu 16.04 Xenial Xerus
    PETSC_DIR=/usr/lib/petscdir/3.6.2/x86_64-linux-gnu-real \
    SLEPC_DIR=/usr/lib/slepcdir/3.6.1/x86_64-linux-gnu-real \
    HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi \
    ../configure --prefix=${HOME}/libmesh --with-methods="opt dbg" --enable-perflog --enable-petsc-required --disable-examples --with-nlopt-include=/usr/include --with-nlopt-lib=/usr/lib/x86_64-linux-gnu

  elif [ "${TRAVIS_DIST}" = bionic ]; then # Ubuntu 18.04 Bionic Beaver
    PETSC_DIR=/usr/lib/petscdir/3.7.7/x86_64-linux-gnu-real \
    SLEPC_DIR=/usr/lib/slepcdir/3.7.4/x86_64-linux-gnu-real \
    HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/openmpi \
    ../configure --prefix=${HOME}/libmesh --with-methods="opt dbg" --enable-perflog --enable-petsc-required --disable-examples --with-nlopt-include=/usr/include --with-nlopt-lib=/usr/lib/x86_64-linux-gnu
  
  else
    echo "INVALID LINUX DISTRO: ${TRAVIS_DIST}"
    exit 1
  fi

elif [ "${TRAVIS_OS_NAME}" = osx ]; then # macOS 10.14, XCode 11.2
  echo "Hello From OSX"

else
  echo "INVALID OS: ${TRAVIS_OS_NAME}"
  exit 1
fi

make -j 2
#make install