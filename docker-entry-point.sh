#!/bin/sh

set -e

if [ -z "$1" -o  "${1:0:1}" = '-' ]; then
  chown -R default /data

  exec gosu default /elasticsearch/bin/elasticsearch "$@"
fi

exec "$@"
