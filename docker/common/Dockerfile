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

RUN apt-get install -y --no-install-recommends libboost-all-dev libusb-1.0.0-dev libssl-dev cmake libprotobuf-dev protobuf-c-compiler protobuf-compiler git
RUN apt-get -y -f install --no-install-recommends build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libsqlite3-dev libssl-dev libglib2.0-dev bluez libbluetooth-dev   libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev  libxkbcommon-dev libwayland-dev  libasound2-dev build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev  libglib2.0-dev libraspberrypi-dev libxcb1-dev libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev libts-dev pulseaudio libpulse-dev librtaudio-dev librtaudio-dev libraspberrypi-bin libraspberrypi-dev bluez libbluetooth-dev libdbus-c++-dev libdouble-conversion-dev '^libxcb.*-dev' libxcb-xinerama0-dev libproxy-dev libjpeg-dev libjpeg62-turbo-dev libbluetooth-dev bluez libsctp-dev libxkbcommon-x11-dev libgles2-mesa-dev libgbm-dev libegl1-mesa-dev libgbm-dev libgles2-mesa-dev mesa-common-dev 
RUN apt-get -y install --no-install-recommends rpi-update libraspberrypi-dev
RUN apt-get install -y --no-install-recommends pulseaudio librtaudio-dev libtag1-dev libblkid-dev
RUN apt-get -y install --no-install-recommends pv unzip kpartx zerofree qemu-user-static binfmt-support
RUN apt-get install -y --no-install-recommends qtbase5-dev qttools5-dev-tools  qtmultimedia5-dev libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev

RUN apt-get -y install --no-install-recommends \
    weston

RUN apt-get -y install --no-install-recommends \
    qtwayland5

RUN apt-get -y install --no-install-recommends \
    xwayland

RUN apt-get -y install --no-install-recommends \
    usbutils

RUN apt-get -y install --no-install-recommends \
    android-tools-adb

RUN apt-get -y install --no-install-recommends \
    bluez dbus

RUN apt-get -y install --no-install-recommends \
    pulseaudio pulseaudio-utils
    
RUN apt-get -y install --no-install-recommends \
    libgps-dev gpsd

RUN apt-get -y install --no-install-recommends \
    xterm

RUN apt-get -y install --no-install-recommends \
    gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools

# RUN usermod -aG pulse,pulse-access root

RUN rm -rf /var/lib/apt/lists/*

# Set a working directory
WORKDIR /home/ubuntu

# Copy application files into container (optional)
COPY entrypoint.sh /home/ubuntu

# Default command (change as needed)
ENTRYPOINT ["/home/ubuntu/entrypoint.sh"]
