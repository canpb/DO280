#!/bin/bash

source /usr/local/etc/ocp4.config

function poll {
  local iterations="$1"
  local duration="$2"
  local endpoint="http://books-console-apps.${RHT_OCP4_WILDCARD_DOMAIN}/leak"

  echo "Polling ${endpoint} every ${duration} seconds ${iterations} times..."

  for ((i=0; i < $iterations; i++))
  do
    curl -s -o /dev/null ${endpoint}
    sleep ${duration}
  done
}

# Poll the leak endpoint for about 6 minutes. We start fast so that we see
# immediate results.
poll 200 0
poll 300 0.1
poll 500 0.2
poll 300 0.5
