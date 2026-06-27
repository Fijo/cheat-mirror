# Disk management

## List block devices
`lsblk`

## List disks by id
`ls -l /dev/disk/by-id/`

## Partitioning

### Intuitive interactive partitioning setup
`fdisk /dev/sdX`

### Delete partition table
`sfdisk --delete /dev/sdX`

### DD with status
`dd if=/dev/sdX of=/dev/sdY status=progress`

### Smart stats
`smartctl -A /dev/sdX`

If you only have **Host_Writes_32MiB** and the **TBW**-endurance rating from the ssd manufacturers website,
use this formular:  
`wearout_percent = ( (Host_Writes_32MiB * 3.355 * 10^-5) / TBW ) * 100`

## See also
- [Server: understanding actie mounts](./server.md#understanding-actie-mounts)
