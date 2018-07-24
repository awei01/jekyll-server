#!/usr/bin/env bash

cat <<STOP
*** Update/Upgrade ***
STOP

sudo apt-get update
sudo apt-get upgrade -y
