FROM archlinux:latest

{% if unstable %}
RUN sed -i '/^# after the header/a[kde-unstable]\nInclude = /etc/pacman.d/mirrorlist\n\n[testing]\nInclude = /etc/pacman.d/mirrorlist\n\n[community-testing]\nInclude = /etc/pacman.d/mirrorlist' /etc/pacman.conf
{% endif %}

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm openssl ppp wget openfortivpn
RUN pacman -Scc --noconfirm
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
VOLUME ["/etc/openfortivpn/"]
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
