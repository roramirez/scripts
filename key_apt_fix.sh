#!/bin/bash
if [ "$(id -u)" != "0" ]; then
  echo "You need must be run as root" 1>&2
  exit 1
fi

LEN_KEY=16
read -p "Enter key: " KEY

if [ "${#KEY}" -ne "${LEN_KEY}" ]; then
    echo "Please add valid key"
    exit 1
fi

gpg --keyserver keys.gnupg.net --recv-key $KEY
gpg --export --armor $KEY | apt-key add -
