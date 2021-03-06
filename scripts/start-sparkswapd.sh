#!/usr/bin/env bash

################################################
# sparkswapd initialization script
#
# IMPORTANT: This file is only for use inside of the sparkswapd docker container
#            as `/secure` is a volume inside of the container
################################################

set -e
if [ "$NETWORK" == "mainnet" ]; then
  echo "Using GRPC default certs"
else
  echo "Downloading Relayer cert..."
  curl --silent -S --output /secure/relayer-root.pem "${RELAYER_CERT_HOST}/cert" || exit 1
  echo "Relayer cert downloaded successfully"
fi
echo "Starting sparkswapd"
./broker-daemon/bin/sparkswapd
