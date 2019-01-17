## How to run this image

To start the Docker container as a background service, you can run:

    docker run --network=host --cap-add NET_ADMIN -d domotz/domotzpro-agent-amd64

## Notes

On Mac and Windows platforms the container is not able to see the real network host. You can only monitor the network where docker containers are running.

To launch the container you can type:

    docker run --publish 3000:3000 -d domotz/domotzpro-agent-amd64
