#!/bin/bash
echo "RUNNING modules/android-auto-module/install/common/common.sh"
export MODULE_ROOT="$ROOT/modules/android-auto-module"

# Installing deps
sudo apt install -y --no-install-recommends \
  cmake build-essential

sudo apt install -y --no-install-recommends \
  libboost-all-dev libusb-1.0-0-dev libssl-dev cmake libprotobuf-dev protobuf-c-compiler protobuf-compiler

sudo apt install -y --no-install-recommends \
  qtbase5-dev qttools5-dev-tools  qtmultimedia5-dev libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev qtwayland5

sudo apt install -y --no-install-recommends \
  libasound2-dev libbluetooth-dev libdbus-1-dev libdbus-c++-dev libdouble-conversion-dev libegl1-mesa-dev libfontconfig1-dev libfreetype6-dev libgbm-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libglib2.0-dev libicu-dev libinput-dev libjpeg-dev libproxy-dev libpulse-dev libsqlite3-dev libsctp-dev libssl-dev libts-dev libwayland-dev libx11-dev libx11-xcb-dev libxext-dev libxfixes-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev libxrender-dev libxcb1-dev libxcb-glx0-dev libxcb-xinerama0-dev mesa-common-dev pulseaudio librtaudio-dev libtag1-dev libgps-dev gpsd '^libxcb.*-dev'

sudo apt install -y --no-install-recommends \
  gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools
  
# Build aasdk
cd /opt/car-pi/modules/android-auto-module/src/aasdk
# rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release .. 
make -j8

# Build Openauto
cd /opt/car-pi/modules/android-auto-module/src/openauto
# # rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release \
  -DNOPI=ON \
  -DAASDK_INCLUDE_DIR=/opt/car-pi/modules/android-auto-module/src/aasdk/include \
  -DAASDK_LIB_DIR=/opt/car-pi/modules/android-auto-module/src/aasdk/build/lib/libaasdk.so \
  -DAAP_PROTOBUF_INCLUDE_DIR=/opt/car-pi/modules/android-auto-module/src/aasdk/build/protobuf \
  -DAAP_PROTOBUF_LIB_DIR=/opt/car-pi/modules/android-auto-module/src/aasdk/build/lib/libaap_protobuf.so ..
make -j8
