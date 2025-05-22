#!/bin/sh
pkill -f keepalived || true
rm -f /run/keepalived/*.pid
cat <<EOF > /etc/keepalived/keepalived.conf
vrrp_instance ${VRRP_INSTANCE_NAME} {
    state ${VRRP_STATE}
    interface ${VRRP_INTERFACE}
    virtual_router_id ${VRRP_ROUTER_ID}
    priority ${VRRP_PRIORITY}
    advert_int ${VRRP_ADVERT_INT}
    authentication {
        auth_type ${VRRP_AUTH_TYPE}
        auth_pass ${VRRP_AUTH_PASS}
    }
    virtual_ipaddress {
        ${VRRP_VIRTUAL_IP}
    }
}
EOF
exec keepalived --dont-fork --log-console