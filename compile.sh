#!/usr/bin/env bash

FIRMWARE_DIR="$PWD/qmk.git"
KEYMAPS_DIR="$PWD/keymaps/"

docker run \
    -w /qmk_firmware \
    -v "$FIRMWARE_DIR":/qmk_firmware \
    -v "$KEYMAPS_DIR":/qmk_firmware/keymaps \
    --rm -it qmk-dockerized \
    compile --clean "$@"
