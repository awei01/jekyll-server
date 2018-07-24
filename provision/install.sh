#!/usr/bin/env bash

# if [ ! $DIR ]; then
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# fi

cat <<STOP
|--------------------------
| Start provisioning
|--------------------------
STOP

# prevent dpkg-reconfigure: unable to re-open stdin: No file or directory
# Reference: https://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory
# export DEBIAN_FRONTEND=noninteractive

. "$DIR/update-upgrade.sh"
. "$DIR/install-git.sh"
. "$DIR/install-ruby.sh"
. "$DIR/install-jekyll.sh"
