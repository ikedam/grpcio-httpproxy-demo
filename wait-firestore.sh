#!/bin/sh

if [[ -n "${FIRESTORE_EMULATOR_HOST}" ]]; then
  for i in $(seq 10); do
    curl -q -m 1 "http://${FIRESTORE_EMULATOR_HOST}/" >/dev/null 2>&1
    if [[ "$?" = "0" ]]; then
      break
    fi
    sleep 3
  done
fi

exec "$@"
