#!/usr/bin/env bash
set -ex

mkdir build
cd build

cmake \
  --preset=osx \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DENABLE_PRECOMMIT=OFF \
  ../

ninja
ninja install

# move mantid
mv $PREFIX/lib/mantid ${SP_DIR}
mv $PREFIX/lib/mantid-*-py*.egg-info ${SP_DIR}

# move other workbench related libraries
mv $PREFIX/lib/mantidqt ${SP_DIR}
mv $PREFIX/lib/workbench ${SP_DIR}