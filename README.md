# ![Logo](https://raw.githubusercontent.com/carminezac/keepalived/main/logo.png) carminezac/keepalived

[![Docker Pulls](https://img.shields.io/docker/pulls/carminezac/keepalived)](https://hub.docker.com/r/carminezac/keepalived)
[![Image Size](https://img.shields.io/docker/image-size/carminezac/keepalived/latest)](https://hub.docker.com/r/carminezac/keepalived)
[![GitHub Repo](https://img.shields.io/badge/source-github-blue?logo=github)](https://github.com/carminezac/keepalived)
[![GHCR](https://img.shields.io/badge/registry-ghcr.io-green?logo=github)](https://ghcr.io/carminezac/keepalived)


**Lightweight Keepalived container based on Alpine Linux.**  
Dynamically generates `keepalived.conf` at runtime using environment variables. Ideal for simple HA/VRRP setups.


## 🔧 Usage

```bash
docker run --rm \
  --cap-add=NET_ADMIN \
  --network=host \
  -e VRRP_INSTANCE_NAME=VI_1 \
  -e VRRP_STATE=MASTER \
  -e VRRP_INTERFACE=eth0 \
  -e VRRP_ROUTER_ID=51 \
  -e VRRP_PRIORITY=100 \
  -e VRRP_ADVERT_INT=1 \
  -e VRRP_AUTH_TYPE=PASS \
  -e VRRP_AUTH_PASS=1234 \
  -e VRRP_VIRTUAL_IP=192.168.1.100 \
  ghcr.io/carminezac/keepalived:latest
```


## 📌 Environment variables

| Variable             | Description                          |
|----------------------|--------------------------------------|
| `VRRP_INSTANCE_NAME` | Name of the VRRP instance            |
| `VRRP_STATE`         | MASTER or BACKUP                     |
| `VRRP_INTERFACE`     | Network interface (e.g. eth0)        |
| `VRRP_ROUTER_ID`     | Virtual router ID (1–255)            |
| `VRRP_PRIORITY`      | Priority (0–255)                     |
| `VRRP_ADVERT_INT`    | Advertisement interval (seconds)     |
| `VRRP_AUTH_TYPE`     | Authentication type (PASS)           |
| `VRRP_AUTH_PASS`     | Password for authentication          |
| `VRRP_VIRTUAL_IP`    | Virtual IP address                   |


## 📄 Example `docker-compose.yml`

```yaml
services:
  keepalived:
    image: ghcr.io/carminezac/keepalived:latest
    network_mode: host
    cap_add:
      - NET_ADMIN
    environment:
      VRRP_INSTANCE_NAME: "VI_1"
      VRRP_STATE: "MASTER"
      VRRP_INTERFACE: "eth0"
      VRRP_ROUTER_ID: "51"
      VRRP_PRIORITY: "100"
      VRRP_ADVERT_INT: "1"
      VRRP_AUTH_TYPE: "PASS"
      VRRP_AUTH_PASS: "1234"
      VRRP_VIRTUAL_IP: "192.168.1.100"
```

## 🏷️ Tags

- `v2.3.1-alpine3.21.3`
- `latest`
