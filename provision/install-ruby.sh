#!/usr/bin/env bash

cat <<STOP
*** Install Ruby ***
STOP

# install git if it isn't already installed
hash ruby 2>/dev/null 2>&1 && {
  echo 'Ruby already installled'
} || {
  echo 'Installing...'
  sudo apt-get install -y ruby ruby-dev build-essential
}

# see if we're on a vagrant box and determine the home file
HOME_FOLDER=/home/vagrant

if [ ! -d $HOME_FOLDER ]; then
  echo "The home directory [ $HOME_FOLDER ] does not exist"
  return 2>/dev/null || exit 1
fi

ALIAS_FILE=$HOME_FOLDER/.bash_profile
if [ ! -f $ALIAS_FILE ]; then
  sudo -u vagrant touch "$ALIAS_FILE"
  echo "Created [ $ALIAS_FILE ]"
fi

GEM_ALIAS='export GEM_HOME=$HOME/gems'
if grep -Fxq "$GEM_ALIAS" $ALIAS_FILE; then
  echo 'GEM_HOME already exists'
else
  sudo -u vagrant echo $GEM_ALIAS >> "$ALIAS_FILE"
  echo 'Added [GEM_HOME]'
  sudo -u vagrant -s source "$ALIAS_FILE"
fi

PATH_ALIAS='export PATH=$GEM_HOME/bin:$PATH'
if grep -Fxq "$PATH_ALIAS" $ALIAS_FILE; then
  echo 'PATH already exported'
else
  sudo -u vagrant echo $PATH_ALIAS >> "$ALIAS_FILE"
  echo 'Added [PATH]'
  sudo -u vagrant -s source "$ALIAS_FILE"
fi
