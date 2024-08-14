## setup

### QMK Repo

Ahead of using the Docker container, first create a fork of the QMK repo as described in the QMK
docs. Once the fork is created, clone it locally.

Clone the QMK git repo

```
git clone --recurse-submodules <repo> qmk.git
```

### docker

Build the Docker container:

```
docker build -t qmk-dockerized -f Dockerfile .
```

## compiling

Place the keymap JSON exports from the QMK Configurator into the `keymaps/` directory in the root of
this repo. Then, run the `compile.sh` script and pass it the path to the keymap you want to build,
relative to the root of this directory.

```
./compile.sh keymaps/test_keymap.json
```

This will compile the keymap within the docker container, mounting the QMK repo directory within
to make the files available. Once complete, the new firmware file will be found at the top of the
QMK repo directory.

## other commands

The `qmk.sh` script can be used to run any other subcommands provided by the QML cli tool.
