FROM docker.io/library/ubuntu:20.04

ARG DOCKER_QT_VERSION=6.6.0

ENV DEBIAN_FRONTEND=noninteractive
# basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get -y install locales curl wget git ninja-build software-properties-common libfontconfig libxcb-glx0 libx11-xcb1 libxcb-icccm4 libxcb-image0 libxcb-shm0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-sync1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xkb1 libxext6 libxkbcommon-x11-0 libgl1 libgl1-mesa-dev pkg-config python3 python3-pip fuse libxcb-cursor0 && pip3 install --upgrade pip

# fix locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install gcc
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update && apt-get -y install g++-13 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 30

# install cmake
RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.27.7/cmake-3.27.7-linux-x86_64.sh -o cmake-install.sh && chmod +x cmake-install.sh && ./cmake-install.sh --prefix=/usr/local --exclude-subdir && rm cmake-install.sh

# install qt
RUN pip3 install aqtinstall && aqt install-qt -O /opt/qt linux desktop "$DOCKER_QT_VERSION" gcc_64
ENV PATH="/opt/qt/$DOCKER_QT_VERSION/gcc_64/bin:$PATH"
ENV LD_LIBRARY_PATH="/opt/qt/$DOCKER_QT_VERSION/gcc_64/lib:$LD_LIBRARY_PATH"
ENV QMAKE="/opt/qt/$DOCKER_QT_VERSION/gcc_64/bin/qmake"

# install linuxdeployqt
RUN wget -q -nc https://github.com/linuxdeploy/linuxdeploy/releases/latest/download/linuxdeploy-x86_64.AppImage https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage && chmod +x linuxdeploy-*.AppImage && ./linuxdeploy-x86_64.AppImage --appimage-extract && mv squashfs-root /opt/linuxdeploy && ./linuxdeploy-plugin-qt-x86_64.AppImage --appimage-extract && mv squashfs-root /opt/linuxdeploy-plugin-qt && rm linuxdeploy-*.AppImage
ENV PATH="/opt/linuxdeploy/usr/bin:/opt/linuxdeploy-plugin-qt/usr/bin:$PATH"
