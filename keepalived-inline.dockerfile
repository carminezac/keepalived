FROM alpine:3.21.3

RUN apk add --no-cache keepalived iputils && \
echo '#!/bin/sh' > /entrypoint.sh && \
echo 'pkill -f keepalived || true' >> /entrypoint.sh && \
echo 'rm -f /run/keepalived/*.pid' >> /entrypoint.sh && \
echo 'echo "vrrp_instance ${VRRP_INSTANCE_NAME} {" > /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    state ${VRRP_STATE}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    interface ${VRRP_INTERFACE}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    virtual_router_id ${VRRP_ROUTER_ID}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    priority ${VRRP_PRIORITY}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    advert_int ${VRRP_ADVERT_INT}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    authentication {" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "        auth_type ${VRRP_AUTH_TYPE}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "        auth_pass ${VRRP_AUTH_PASS}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    }" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    virtual_ipaddress {" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "        ${VRRP_VIRTUAL_IP}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "    }" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'echo "}" >> /etc/keepalived/keepalived.conf' >> /entrypoint.sh && \
echo 'exec keepalived --dont-fork --log-console' >> /entrypoint.sh && \
chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
