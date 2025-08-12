FROM dtcooper/raspberrypi-os:bookworm

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install minimal useful tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        bash \
        cmake \
        build-essential \
        tzdata

# RUN apt-get install -y --no-install-recommends \
#         libboost-all-dev
# RUN apt-get install -y --no-install-recommends \
#         qtbase5-dev
# RUN apt-get install -y --no-install-recommends \
#         qttools5-dev-tools
# RUN apt-get install -y --no-install-recommends \
#         qtmultimedia5-dev
# RUN apt-get install -y --no-install-recommends \
#         librtaudio-dev
# RUN apt-get install -y --no-install-recommends \
#         libomxil-bellagio-dev
# RUN apt-get install -y --no-install-recommends \
#         libasound2-dev
# RUN apt-get install -y --no-install-recommends \
#         qtmultimedia5-dev
# RUN apt-get install -y --no-install-recommends \
#         qtconnectivity5-dev
# RUN apt-get install -y --no-install-recommends \
#         protobuf-compiler
# RUN apt-get install -y --no-install-recommends \
#         libprotobuf-dev
# RUN apt-get install -y --no-install-recommends \
#         openssl
# RUN apt-get install -y --no-install-recommends \
#         libssl-dev
# RUN apt-get install -y --no-install-recommends \
#         cmake libusb-1.0-0-dev libssl-dev
# RUN apt-get install -y --no-install-recommends \
#         libprotobuf-dev protobuf-c-compiler protobuf-compiler
# RUN apt-get install -y --no-install-recommends \
#         libboost-log1.83 libboost-test1.83 libboost-thread1.83 libboost-date-time1.83
# RUN apt-get install -y --no-install-recommends \
#         libboost-chrono1.83 libboost-atomic1.83 libboost-all-dev
# RUN apt-get install -y --no-install-recommends \
#         libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 qtmultimedia5-dev
# RUN apt-get install -y --no-install-recommends \
#         libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev
# RUN apt-get install -y --no-install-recommends \
#         librtaudio-dev librtaudio6 pulseaudio-module-bluetooth
# RUN apt-get install -y --no-install-recommends \
#         libpulse-mainloop-glib0 libfontconfig1 libinput10 libxkbcommon0
# RUN apt-get install -y --no-install-recommends \
#         fbi libts-dev libts0t64 wiringpi watchdog pulseaudio evtest
# RUN apt-get install -y --no-install-recommends \
#         libusb-1.0.0-dev libssl-dev cmake libprotobuf-dev protobuf-c-compiler protobuf-compiler pulseaudio librtaudio-dev libgps-dev 
# RUN apt-get install -y --no-install-recommends \
#         libblkid-dev libtag1-dev libgles2-mesa-dev
# RUN apt-get install -y --no-install-recommends \
#         libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev
RUN apt-get install -y --no-install-recommends libboost-all-dev libusb-1.0.0-dev libssl-dev cmake libprotobuf-dev protobuf-c-compiler protobuf-compiler git
RUN apt-get -y -f install --no-install-recommends build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libsqlite3-dev libssl-dev libglib2.0-dev bluez libbluetooth-dev   libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev  libxkbcommon-dev libwayland-dev  libasound2-dev build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev  libglib2.0-dev libraspberrypi-dev libxcb1-dev libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev libts-dev pulseaudio libpulse-dev librtaudio-dev librtaudio-dev libraspberrypi-bin libraspberrypi-dev bluez libbluetooth-dev libdbus-c++-dev libdouble-conversion-dev '^libxcb.*-dev' libxcb-xinerama0-dev libproxy-dev libjpeg-dev libjpeg62-turbo-dev libbluetooth-dev bluez libsctp-dev libxkbcommon-x11-dev libgles2-mesa-dev libgbm-dev libegl1-mesa-dev libgbm-dev libgles2-mesa-dev mesa-common-dev 
RUN apt-get -y install --no-install-recommends rpi-update
RUN apt-get install -y --no-install-recommends pulseaudio librtaudio-dev libtag1-dev libblkid-dev
RUN apt-get -y install --no-install-recommends pv unzip kpartx zerofree qemu-user-static binfmt-support
RUN apt-get install -y --no-install-recommends libraspberrypi-dev

RUN rm -rf /var/lib/apt/lists/*

# Set a working directory
WORKDIR /home/ubuntu

# Copy application files into container (optional)
COPY entrypoint.sh /home/ubuntu

# Default command (change as needed)
# CMD [ "bash" ]
ENTRYPOINT ["/home/ubuntu/entrypoint.sh"]
