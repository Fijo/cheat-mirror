# Debian based Server Cheatsheet

## processes
```bash
htop
top -o %MEM # sorted by memory
vmstat -a 1 # if confused: lookup column meanings in man vmstat
atop  # launch it and press 'm' (memory usage) and 'p' (group by process name).
btop
```

## drives usage

Monitor drive usage every 5 seconds for just /dev/sdc, /dev/sde, /dev/sdg and /dev/sdc.
`S_COLORS=always SGR_COLORS=always iostat -xz 5 | grep -E "^Device|sd[cegh]"`

## GPU
`intel_gpu_top`
(requires apt-get install intel-gpu-tools)

## show the process tree
pstree

## show killed processes (due to memory)
dmesg -Tw | egrep -i 'killed process'

## understanding actie mounts
findmnt

## What's using up space?

```bash
df # Find out the usage / free space of each mount
ncdu / # Find out whats using all the disk space (like windirstat)
du -hd 1 # Find out the estimated space taken up by folder in the current directory
du -hd 1 -t 100M # same as aboev but only show entries taking up more than 100MB
```

### Server specific commands

```bash
home-server:
ncdu / --exclude=/home/fijo/docker-volumes/main --exclude=/var/snap/docker/common/var-lib-docker/volumes
ncdu /apool --exclude=/apool/subvol* --exclude=/apool/exchange --exclude=/apool/backup
..\scripts\linux\ark-helpers\ncdu-apool-ark.sh
```

## Free up space

```bash
sudo docker image prune -a
sudo apt-get autoremove
sudo apt-get clean
sudo apt-get -s clean
sudo apt-get autoremove --purge # removes old kernels
sudo journalctl --vacuum-time=3d
sudo sh GIT_REPO_fijo.personal.toolkit/scripts/linux/cleanup/purge-old-snap-versions.sh
```

## random

finding UUID of partitions:
`sudo blkid`

`ip link set ens18 up`
<https://unix.stackexchange.com/questions/319740/use-dhcp-on-eth0-using-command-line>

## Check CPU for microcode vulnerabilities

To get an overview of present CPU vulnerabilities and their mitigations, run `lscpu`. Current real-world known vulnerabilities can only show up if the Proxmox VE host is up to date, its version not end of life, and has at least been rebooted since the last kernel update.

based on [source](https://proxmox.fijo.dev/pve-docs/chapter-sysadmin.html#sysadmin_firmware_cpu)
