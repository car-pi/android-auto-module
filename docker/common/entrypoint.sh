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
make install

# Patch OpenAuto
sed -i \
    -e 's|set(AASDK_INCLUDE_DIRS "/usr/local/include")|set(AASDK_INCLUDE_DIRS "/home/ubuntu/aasdk/include")|' \
    -e 's|set(AASDK_LIBRARIES "/usr/local/lib/libaasdk.so")|set(AASDK_LIBRARIES "/home/ubuntu/aasdk/lib/libaasdk.so")|' \
    -e 's|set(AASDK_PROTO_INCLUDE_DIRS "/usr/local/include")|set(AASDK_PROTO_INCLUDE_DIRS "/home/ubuntu/aasdk/build")|' \
    -e 's|set(AASDK_PROTO_LIBRARIES "/home/mccv/aasdk_rpi5/lib/libaasdk_proto.so")|set(AASDK_PROTO_LIBRARIES "/home/ubuntu/aasdk/lib/libaasdk_proto.so")|' \
    "/home/ubuntu/openauto/CMakeLists.txt"

# Build Openauto
cd /home/ubuntu
cd openauto
# rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j8

while true; do
  sleep 1
  echo "Spinning"
done
