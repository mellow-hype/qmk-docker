FROM debian:bookworm
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    bzip2 \
    git-core \
    gzip \
    clang-format-14 \
    gawk \
    lzop \
    python3 \
    python3-lzo \
    python3-pip \
    python3-setuptools \
    python3-dev \
    squashfs-tools \
    tar \
    unzip \
    perl \
    rsync \
    fakeroot \
    ccache \
    gettext \
    git \
    libbsd0 \
    libclang-cpp14 \
    libedit2 \
    libelf1 \
    libftdi1 \
    libhidapi-libusb0 \
    libllvm14 \
    libnewlib-dev \
    libstdc++-arm-none-eabi-dev \
    libstdc++-arm-none-eabi-newlib \
    libusb-0.1-4 \
    libusb-1.0-0 \
    libz3-4 \
    liblzma-dev \
    liblzo2-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libssl-dev \
    rsync \
    subversion \
    pkg-config \
    pipx \
    wget \
    sudo \
    cpio \
    bc \
    vim \
    zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# add non-root user required for buildroot
RUN useradd -m builder &&\
    echo 'builder ALL=NOPASSWD: ALL' > /etc/sudoers.d/builder
USER builder

# copy qmk config file
RUN mkdir -p /home/builder/.config/qmk
COPY ./qmk.ini /home/builder/.config/qmk/qmk.ini

# install qmk
RUN pipx install qmk && pipx ensurepath
RUN git config --global --add safe.directory /qmk_firmware

# create the working directory
WORKDIR /qmk_firmware
ENTRYPOINT [ "/home/builder/.local/bin/qmk" ]
# ENTRYPOINT [ "/bin/bash" ]
