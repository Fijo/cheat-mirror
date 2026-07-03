# Networking

## Test public ip addresses

`curl -4 https://ifconfig.co`
`curl -6 https://ifconfig.co`

## Show open ports

`ss -lntu`

## Test bandwith

### on server
`sudo nice -n -15 iperf3 -s`

### on client
`sudo iperf3 -P 3 -c 192.168.0.118 -t 20`

-P 3 means 3 parallel connections

## Backup your network file using the following command
`cp /etc/network/interfaces /etc/network/interfaces.bak`

## DNS Lookup using specific Nameserver

`dig @93.177.67.109 -t any traefik.fijo.dev`

## bring network interface up
`ip link set dev enp4s0 up`

## fix speed to be 10G
`ethtool -s enp4s0 speed 10000 duplex full autoneg on advertise 0x100000000000`

## check interface status
`ethtool -s enp4s0`
