#!/usr/bin/env bash

cat <<STOP
*** Install NVM ***
STOP

HOME_FOLDER=/home/vagrant

# install isn't already installed
if [ -d "$HOME_FOLDER/.nvm" ]; then
  echo 'NVM already installled'
else
  echo 'Installing...'
  sudo -u vagrant curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

ALIAS_FILE=$HOME_FOLDER/.bash_profile
if [ ! -f $ALIAS_FILE ]; then
  sudo -u vagrant touch "$ALIAS_FILE"
  echo "Created [ $ALIAS_FILE ]"
fi

NVM_ALIAS='export NVM_DIR="$HOME/.nvm"'
if grep -Fxq "$NVM_ALIAS" $ALIAS_FILE; then
  echo 'PATH already exported'
else
  sudo -u vagrant echo $NVM_ALIAS >> "$ALIAS_FILE"
  sudo -u vagrant echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$ALIAS_FILE"
  echo 'Added [PATH]'
  sudo -u vagrant -s source "$ALIAS_FILE"
fi

