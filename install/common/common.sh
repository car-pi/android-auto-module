#!/bin/bash
echo "RUNNING modules/android-auto-module/install/common/common.sh"
export MODULE_ROOT="$ROOT/modules/android-auto-module"

# --- CONFIGURATION ---
MODULE_NAME=$(basename "$MODULE_ROOT")   # infer module name from dir name
MODULE_CLASS="common"
MODULE_ID=$MODULE_NAME-$MODULE_CLASS
DOCKERFILE_PATH="$MODULE_ROOT/docker/$MODULE_CLASS/Dockerfile"
SERVICE_SRC="$MODULE_ROOT/install/common/$MODULE_ID.service"
SERVICE_DST="/etc/systemd/system/$MODULE_ID.service"
IMAGE_NAME="$MODULE_ID:latest"

# # --- BUILD IMAGE ---
echo "Building Docker image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE_PATH" "$MODULE_ROOT/docker/common"

# # --- Build openauto (remove line if ITransport error)
docker run --rm -it -v $MODULE_ROOT/src/aasdk:/home/ubuntu/aasdk -v $MODULE_ROOT/src/openauto:/home/ubuntu/openauto android-auto-module-common:latest

# # --- Install runtime deps
sudo apt-get install -y --no-install-recommends ca-certificates curl
sudo apt-get install -y --no-install-recommends bash build-essential tzdata
sudo apt-get install -y --no-install-recommends libboost-all-dev libusb-1.0.0-dev libssl-dev
sudo apt-get install -y --no-install-recommends cmake libprotobuf-dev protobuf-c-compiler protobuf-compiler git
sudo apt-get install -y -f --no-install-recommends build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libsqlite3-dev libssl-dev libglib2.0-dev bluez libbluetooth-dev   libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev  libxkbcommon-dev libwayland-dev  libasound2-dev build-essential libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev  libglib2.0-dev libraspberrypi-dev libxcb1-dev libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev libts-dev pulseaudio libpulse-dev librtaudio-dev librtaudio-dev libraspberrypi-bin libraspberrypi-dev bluez libbluetooth-dev libdbus-c++-dev libdouble-conversion-dev '^libxcb.*-dev' libxcb-xinerama0-dev libproxy-dev libjpeg-dev libjpeg62-turbo-dev libbluetooth-dev bluez libsctp-dev libxkbcommon-x11-dev libgles2-mesa-dev libgbm-dev libegl1-mesa-dev libgbm-dev libgles2-mesa-dev mesa-common-dev 
sudo apt-get install -y --no-install-recommends rpi-update libraspberrypi-dev
sudo apt-get install -y --no-install-recommends pulseaudio librtaudio-dev libtag1-dev libblkid-dev
sudo apt-get install -y --no-install-recommends pv unzip kpartx zerofree qemu-user-static binfmt-support
sudo apt-get install -y --no-install-recommends qtbase5-dev qttools5-dev-tools  qtmultimedia5-dev libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev
sudo apt-get install -y --no-install-recommends gstreamer1.0-tools gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-alsa gstreamer1.0-pulseaudio gstreamer1.0-gl gstreamer1.0-x

# # --- INSTALL SYSTEMD SERVICE ---
echo "Installing systemd service: $SERVICE_DST"
sudo cp "$SERVICE_SRC" "$SERVICE_DST"
sudo chmod 644 "$SERVICE_DST"

# # Reload systemd to pick up new/changed service file
echo "Reloading systemd daemon"
sudo systemctl daemon-reload

# # --- ENABLE & START SERVICE ---
echo "Enabling $MODULE_ID.service"
sudo systemctl enable "$MODULE_ID.service"

echo "Starting $MODULE_ID.service"
# sudo systemctl restart "$MODULE_ID.service"

echo "Deployment complete for module: $MODULE_ID"

