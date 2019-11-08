#!/usr/bin/env bash

if [ "${TRAVIS_OS_NAME}" = linux ]; then # Ubuntu Linux

  if [ "${TRAVIS_DIST}" = xenial ]; then # Ubuntu 16.04 Xenial Xerus
    sudo apt-get -qq update
    sudo apt-get -qq install -y gfortran wget m4
    sudo apt-get -y install openmpi-bin libopenmpi-dev
    sudo apt-get -y install libpetsc3.6 libpetsc3.6.2-dbg libpetsc3.6.2-dev
    sudo apt-get -y install libslepc3.6 libslepc3.6.1-dbg libslepc3.6.1-dev
    sudo apt-get -y install libhdf5-openmpi-dev
    sudo apt-get -y install libparpack2-dev
    sudo apt-get -y install libboost-all-dev
    sudo apt-get -y install libeigen3-dev
    sudo apt-get -y install libnlopt-dev
    gcc --version

  elif [ "${TRAVIS_DIST}" = bionic ]; then # Ubuntu 18.04 Bionic Beaver
    sudo apt-get -qq update
    sudo apt-get -qq install -y gfortran wget m4
    sudo apt-get -y install openmpi-bin libopenmpi-dev
    sudo apt-get -y install libpetsc3.7.7 libpetsc3.7.7-dbg libpetsc3.7.7-dev
    sudo apt-get -y install libslepc3.7.4 libslepc3.7.4-dev
    sudo apt-get -y install libhdf5-openmpi-dev
    sudo apt-get -y install libparpack2-dev
    sudo apt-get -y install libboost-all-dev
    sudo apt-get -y install libeigen3-dev
    sudo apt-get -y install libnlopt-dev
    gcc --version

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