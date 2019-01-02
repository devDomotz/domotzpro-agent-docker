#!/bin/sh

docker run --network=host --cap-add NET_ADMIN -d domotz/domotzpro-agent-amd64:latest
