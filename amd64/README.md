## How to run this image

To start the Docker image for demo purpose, you can run:

    docker run --interactive --tty --publish 3000:3000 domotz/domotzpro-agent-amd64


To start the Docker image for production purpose, you can run:

    docker run --network=host --cap-add NET_ADMIN -d domotz/domotzpro-agent-amd64

## Notes

On Mac and Windows platforms, running the containers for production purpose is useless as Docker infrastructure on these platforms are wrapped inside a virtual machine.  
So, although you enable the access to the host network, that is actually the virtual network of the Docker virtual machine.
