#!/bin/sh

docker run --network=host --cap-add NET_ADMIN -d domotzpro-agent-amd64:latest
