FROM archlinux:latest
RUN pacman -Sy
RUN pacman -S --noconfirm openssl ppp wget
RUN pacman -Scc --noconfirm
COPY entrypoint.sh /usr/bin
VOLUME ["/etc/openfortivpn/"]
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
