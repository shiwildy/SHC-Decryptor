#!/bin/bash

wget -q -O /usr/bin/shcdecryptor 'https://raw.githubusercontent.com/shiwildy/SHC-Decryptor/refs/heads/main/shcdecryptor.sh'
chmod +x /usr/bin/shcdecryptor

if [[ $(shcdecryptor --installation-testing) == 'ok' ]]; then
  echo "Installation success"
else
  echo "Installation failed"
fi
