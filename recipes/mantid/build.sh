#!/usr/bin/env bash
set -ex

mkdir build
cd build

cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -GNinja \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DENABLE_PRECOMMIT=OFF \
  -DOpenSSL_ROOT=$PREFIX \
  -DHDF5_ROOT=$PREFIX \
  -DPython_ROOT_DIR=$PREFIX \
  ../

ninja
ninja install

# move mantid
mv $PREFIX/lib/mantid ${SP_DIR}
mv $PREFIX/lib/mantid-*-py*.egg-info ${SP_DIR}

# move other workbench related libraries
mv $PREFIX/lib/mantidqt ${SP_DIR}
mv $PREFIX/lib/workbench ${SP_DIR}