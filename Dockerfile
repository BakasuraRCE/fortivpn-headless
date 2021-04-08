FROM archlinux:latest

# WORKAROUND for glibc 2.33 and old Docker (Docker Hub)
# See https://github.com/actions/virtual-environments/issues/2658
# Thanks to https://github.com/lxqt/lxqt-panel/pull/1562
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm openssl ppp wget openfortivpn
RUN pacman -Scc --noconfirm
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
VOLUME ["/etc/openfortivpn/"]
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
