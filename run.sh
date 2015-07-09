#!/bin/sh
sleep 10
export GOMAXPROCS=10
consul agent -join consul -data-dir /data &
export MY_RANCHER_IP=$(ip addr | grep inet | grep 10.42 | tail -1 | awk '{print $2}' | awk -F\/ '{print $1}')
if [ -z "${MY_RANCHER_IP}" ]; then
  echo "Can't find MY_RANCHER_IP ${MY_RANCHER_IP}"
  exit 1
else
  echo "Found MY_RANCHER_IP ${MY_RANCHER_IP}"
  vault server -config /config/vault.config 
fi
