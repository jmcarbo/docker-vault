#!/bin/sh
sleep 10
export GOMAXPROCS=10
export MY_RANCHER_IP=$(ip addr | grep inet | grep 10.42 | tail -1 | awk '{print $2}' | awk -F\/ '{print $1}')
if [ -z "${MY_RANCHER_IP}" ]; then
  echo "Can't find MY_RANCHER_IP ${MY_RANCHER_IP}"
  exit 1
else
  echo "Found MY_RANCHER_IP ${MY_RANCHER_IP}"
  vault -config /config/vault.config 
fi
