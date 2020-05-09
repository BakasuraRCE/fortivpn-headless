# fortivpn-headless
An openfortivpn docker image

You can use this image with a proxy image linked to network of this image to make an headless FortiVPN.

## Example

In this example we use [bakasura/dante2](https://hub.docker.com/repository/docker/bakasura/dante2) socks proxy image:

### FortiVPN

Start a new VPN service

**BE CAREFULL TO USE THE DEFAULT NETWORK, ROUTING USE 172.17.0.0/16 TOO, CHANGE YOUR GATEWARY FOR 125.17.0.0/16 OR LIKE**

```
docker run -d -it \
  --cap-add=NET_ADMIN \
  --device /dev/ppp \
  --network "nono-default-network" \
  --name forti-vpn \
  --restart always \
  --dns 1.1.1.1 \
  -p 41080:41080 \
  -v /myvolume/fortivpn:/etc/openfortivpn \
  bakasura/fortivpn-headless
```

### Socks Proxy

Start a new Socks Proxy service

```
docker run -d --net=container:forti-vpn --name danteforti -e workers=20 --restart=always -v /myvolume/sockd.conf:/etc/sockd.conf bakasura/dante2
```
