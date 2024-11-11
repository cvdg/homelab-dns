FROM debian:bookworm

RUN DEBIAN_FRONTEND=noninteractive apt update \
  && apt upgrade -y \
  && apt install -y bind9 bind9-dnsutils iputils-ping \
  && apt autoclean -y

COPY named.* db.* /etc/bind/

EXPOSE 53/tcp
EXPOSE 53/udp
    
USER bind:bind

CMD ["/usr/sbin/named", "-f"]
