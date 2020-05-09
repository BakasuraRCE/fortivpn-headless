#!/bin/bash

cd /tmp
wget -O openfortivpn.tar.xz https://www.archlinux.org/packages/community/x86_64/openfortivpn/download/
tar -xf  openfortivpn.tar.xz
cp usr/bin/openfortivpn /usr/bin
/usr/bin/openfortivpn
