#!/bin/bash
echo "Running Android Auto Module"

# Build AASDK
cd /home/ubuntu
cd aasdk
# rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release .. 
make -j8
# make install

# Build Openauto
cd /home/ubuntu
cd openauto
# # rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release \
  -DNOPI=ON \
  -DAASDK_INCLUDE_DIR=/home/ubuntu/aasdk/include \
  -DAASDK_LIB_DIR=/home/ubuntu/aasdk/build/lib/libaasdk.so \
  -DAAP_PROTOBUF_INCLUDE_DIR=/home/ubuntu/aasdk/build/protobuf \
  -DAAP_PROTOBUF_LIB_DIR=/home/ubuntu/aasdk/build/lib/libaap_protobuf.so ..
make -j8

# while true; do
#   sleep 1
#   echo "Spinning"
# done
export QT_QPA_PLATFORM=wayland
bash
