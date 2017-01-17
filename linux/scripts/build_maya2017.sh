#!/usr/bin/env bash

#What is this?
set -e

mkdir -p $TMP_DIR

mkdir -p $MAYA_INSTALL_LOCATION

#----------------------------------------------
# Checkout, build and install USD
# TODO: use a zipped version of AL_USDMaya to have a more consistant run
#----------------------------------------------

cd $TMP_DIR && \
    echo "Starting" && \
    mkdir Maya2017devkit && \
    cd Maya2017devkit && \
      tar -xvzf $MAYA_DOCKER_PATH && \
      tar xf $MAYA_DEVKIT_DOCKER_PATH
cd $MAYA_INSTALL_LOCATION && \
      rpm2cpio $TMP_DIR/Maya2017devkit/Maya2017_64-2017.0-28.x86_64.rpm | cpio -idmv && \
      ln -s $MAYA_LOCATION/bin/maya2017 $MAYA_LOCATION/bin/maya
      echo "Symlink maya2017 -> maya"
      echo "Staring devKit extracting"
      cp -R $TMP_DIR/Maya2017devkit/devkitBase/devkit $MAYA_LOCATION

rm -rf $TMP_DIR