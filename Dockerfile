FROM archlinux:latest
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm openssl ppp wget openfortivpn
RUN pacman -Scc --noconfirm
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
VOLUME ["/etc/openfortivpn/"]
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
