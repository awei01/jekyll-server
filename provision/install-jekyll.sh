#!/usr/bin/env bash

cat <<STOP
*** Install Jekyll ***
STOP

# install git if it isn't already installed
hash jekyll 2>/dev/null 2>&1 && {
  echo 'Jekyll already installled'
} || {
  echo 'Installing...'
  sudo -u vagrant gem install --install-dir /home/vagrant/gems jekyll jekyll-docs bundler
}
