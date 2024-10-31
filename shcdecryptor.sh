#!/bin/sh

if [[ $1 == "--installation-testing" ]]; then
  echo "ok"
  exit
fi

for args in $@; do
  if ! [[ -f $args ]]; then
    echo "$args not found."
    exit
  fi

  $args > /dev/null & child=$!
  sleep 0.03
  kill -STOP $child
  cat /proc/$child/cmdline | sed 's/.*\(#!\)/\1/; $d' > $args.decrypted.sh
  kill -TERM $child
done
