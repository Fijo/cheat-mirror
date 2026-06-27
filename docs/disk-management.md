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

## See also
- [Server: understanding actie mounts](./server.md#understanding-actie-mounts)
