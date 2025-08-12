FROM ubuntu:24.04

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

RUN apt-get install -y --no-install-recommends \
        libboost-all-dev
RUN apt-get install -y --no-install-recommends \
        qtbase5-dev
RUN apt-get install -y --no-install-recommends \
        qttools5-dev-tools
RUN apt-get install -y --no-install-recommends \
        qtmultimedia5-dev
RUN apt-get install -y --no-install-recommends \
        librtaudio-dev
RUN apt-get install -y --no-install-recommends \
        libomxil-bellagio-dev
RUN apt-get install -y --no-install-recommends \
        libasound2-dev
RUN apt-get install -y --no-install-recommends \
        qtmultimedia5-dev
RUN apt-get install -y --no-install-recommends \
        qtconnectivity5-dev
RUN apt-get install -y --no-install-recommends \
        protobuf-compiler
RUN apt-get install -y --no-install-recommends \
        libprotobuf-dev
RUN apt-get install -y --no-install-recommends \
        openssl
RUN apt-get install -y --no-install-recommends \
        libssl-dev
RUN apt-get install -y --no-install-recommends \
        cmake libusb-1.0-0-dev libssl-dev
RUN apt-get install -y --no-install-recommends \
        libprotobuf-dev protobuf-c-compiler protobuf-compiler
RUN apt-get install -y --no-install-recommends \
        libboost-log1.83 libboost-test1.83 libboost-thread1.83 libboost-date-time1.83
RUN apt-get install -y --no-install-recommends \
        libboost-chrono1.83 libboost-atomic1.83 libboost-all-dev
RUN apt-get install -y --no-install-recommends \
        libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 qtmultimedia5-dev
RUN apt-get install -y --no-install-recommends \
        libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev
RUN apt-get install -y --no-install-recommends \
        librtaudio-dev librtaudio6 pulseaudio-module-bluetooth
RUN apt-get install -y --no-install-recommends \
        libpulse-mainloop-glib0 libfontconfig1 libinput10 libxkbcommon0
RUN apt-get install -y --no-install-recommends \
        fbi libts-dev libts0t64 wiringpi watchdog pulseaudio evtest
RUN apt-get install -y --no-install-recommends \
        libusb-1.0.0-dev libssl-dev cmake libprotobuf-dev protobuf-c-compiler protobuf-compiler pulseaudio librtaudio-dev libgps-dev 
RUN apt-get install -y --no-install-recommends \
        libblkid-dev libtag1-dev libgles2-mesa-dev
RUN apt-get install -y --no-install-recommends \
        libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev
RUN apt-get install -y --no-install-recommends \
        libraspberrypi-dev

RUN rm -rf /var/lib/apt/lists/*

# Set a working directory
WORKDIR /home/ubuntu

# Copy application files into container (optional)
COPY entrypoint.sh /home/ubuntu

# Default command (change as needed)
# CMD [ "bash" ]
ENTRYPOINT ["/home/ubuntu/entrypoint.sh"]
