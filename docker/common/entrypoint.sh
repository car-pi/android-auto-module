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
