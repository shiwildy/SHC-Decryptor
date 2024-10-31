#!/bin/sh

if [[ $1 == "--installation-testing" ]]; then
  echo "ok"
fi

for args in $@; do
  $args > /dev/null & child=$!
  sleep 0.0.3
  kill -STOP $child
  cat /proc/$child/cmdline | sed 's/.*\(#!\)/\1/; $d' > $args.decrypted.sh
  kill -TERM $child
done
