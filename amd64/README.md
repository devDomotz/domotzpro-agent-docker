## Domotz Agent in Docker

This repository provides everything you need to run a Domotz Agent in Docker.

## What is Domotz Pro?
**Powerful IT Tool to Monitor and Manage Multiple Remote Networks**

Domotz Pro is the premier Remote Monitoring and Management platform for the IoT World. Domots offers powerful network management software for MSPs, Integrators, Security Professionals, and Business Owners. Domotz Pro is the complete solution to cost-effectively manage and monitor your customers' networks with plug and play setup, a friendly UX, and a comprehensive feature set, accessible from any desktop browser, mobile device or through easy to use RESTful API.

Below is a list of the relevant features from our Desktop and Mobile Apps:

* Set up alerts when a device loses network connectivity.
* Automatically map devices to network managed switches.
* Securely connect to remote devices on the network using http/s, RDP, Telnet, SSH and other TCP/IP protocols.
* Perform network diagnostics, such as WAN and LAN bandwidth, error analysis, packet lost, Device Response Time and more.
* Latency and route analysis and tracing.
* Remote power control (through PDU, PoE, Wake-On-Lan, Software Reboot).
* Monitor SNMP parameters and TCP services.
* Securely stream or take snapshots out of Onvif IP Cameras without opening ports.
* Execute speed tests and be notified when your network performance decays.
* Perform cyber-security scans for potential vulnerabilities.

Try Domotz Pro today for free and take advantage of all we have to offer:

* **Agile** - One person can deploy remote monitoring and management in less than 15 minutes.  Automated network topology mapping and device attribute discovery make system deployment ridiculously fast.
* **Flexible** - Our system, designed from the beginning as an open platform, works with virtually any IP-enabled device, rather than being restricted to specific hardware brands.  Domotz Pro, therefore, can easily scale as more endpoints join the network.
* **Efficient** - Connect to systems and devices remotely to better understand problems and fix issues quickly. Reduce the number of onsite visits and focus resources on more profitable activities.
* **Centralized** - Utilize one interface to manage multiple networks at multiple locations anywhere in the World.  Access all your managed devices from a single easy to use online dashboard.
* **Secure** - Domotz has adopted the latest administrative, physical, and technical industry-standards (including encryption, firewalls, and SSL) to safeguard the security of our services and to protect the confidentiality of personally identifiable information.

For more information: [Domotz Website](https://www.domotz.com)

## Run and Configure

On a Linux platform, start the Docker container as a background service:

    docker run --network=host --cap-add NET_ADMIN --publish 3000:3000 -d domotz/domotzpro-agent-amd64

Once the Domotz Agent has been started in the Docker Container connect to the host IP on port 3000 and follow the instruction to configure the Domotz Agent. E.g.

    http://172.16.10.155:3000

(assuming 172.16.10.155 the IP of the Host)

For Mac and Windows platforms see the notes.

### Notes

Given that the configuration of the Domotz Agent is written on a file on the local storage, we recommend mounting the following folder as an external volume (on the host server):

    /opt/domotz/etc

In this way, even if you destroy the environment and rebuild the container, keeping the configuration files in the host will ensure that the Domotz Agent restarts with the same configuration.

Alternatively, you can force the Docker Container to start always with the same MAC address (e.g. "docker run ...  --mac-address 02:42:AC:12:00:03 ..."). In this way, when the Domotz Agent restart, and you will be required to re-configure it with your account, you will not been asked to create a new entity, but you will be allowed to RESUME the configuration from the previous Domotz Agent.
> setting the mac-address is not compatible with --network=host. using host networking uses the mac address of the host so destroying and re-creating a container on the same host should link properly.

On Mac and Windows platforms the container is not able to discover devices and monitor them on the hosting network. However, you can monitor the Docker Daemon network and the other containers running on that.

To launch the container and start monitoring your Docker network you can simply type:

    docker run --publish 3000:3000 -d domotz/domotzpro-agent-amd64
