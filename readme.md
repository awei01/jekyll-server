# Jekyll Server
This repository facilitates building a virtual machine and provisioning it with `Jekyll`

## Prerequisites
* `Vagrant` installed
* `Virtualbox` installed

## How to use
* Clone this repository
* Change directory into the project folder
* Run `vagrant up`

## Gotchas
* Need to provide the host when serving: `jekyll serve --host=192.168.168.168`
* Need to force polling because filesystem is being shared with host: `jekyll serve --force_polling`
