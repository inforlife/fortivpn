# FortiVPN

Containerized client for PPP+TLS VPN tunnel services compatible with Fortinet VPNs.

**docker-compose.yml**

```
services:
  fortivpn:
    container_name: fortivpn
    image: inforlife/fortivpn:latest
    command: openfortivpn -c /etc/openfortivpn/config
    volumes:
      - ./config:/etc/openfortivpn/config
    privileged: true

  consumer:
    container_name: consumer
    image: org/image:latest
    depends_on:
      fortivpn:
        condition: service_started
    # THE ONE BELOW IS THE IMPORTANT BIT !!!
    network_mode: service:fortivpn 
```