# ZFS

## Overview / Basic stats

This also includes size, used vs free, dedup ratio and fragmentation:
`zpool list`

This also shows the size of the dedup table:
`zpool status -D apool`

## Stats

`arcstat`

`arc_summary | more`

`arc_summary -d | more`

`zpool iostat [tank] 1`
`zpool iostat [tank] -v 1`

## Manual mounting

```bash
sudo zfs load-key apool
zfs mount apool/subvol-101-disk-0
```

## Snapshot management

### List snapshots

`zfs list -r -t snapshot -o name,creation rpool`

### Create snapshot recursively

`zfs snapshot -r pool/home@yesterday`

More details [here](https://openzfs.github.io/openzfs-docs/man/master/8/zfs-destroy.8.html#Example_1_:_Creating_and_Destroying_Multiple_Snapshots).

### Destroy snapshot recursively

`zfs destroy -r pool/home@yesterday`

Common extra flags:
- `-nv` just print what it would do. _(The flags mean verbose and dry run)_

More details [here](https://openzfs.github.io/openzfs-docs/man/master/8/zfs-destroy.8.html#Example_1_:_Creating_and_Destroying_Multiple_Snapshots).

### Destroy all snapshots containing syncoid

`zfs list -r -t snapshot apool -o name | grep syncoid | xargs -d '\n' -n1 zfs destroy`  
test first with  
`zfs list -r -t snapshot apool -o name | grep syncoid | xargs -d '\n' -n1 zfs get available`

## Get zfs multiple properties
`zfs get atime,dedup,usedbysnapshots apool/backup`

## Get zfs dedup ratio
`zpool get dedupratio apool`

## Get detailed stats about dedup

`zpool status -D apool`

For very detailed in memory stats:
`zdb -D apool`

## Importing zpool
(without mounting)
`zpool import -N bpool`
if you get this:  
cannot import 'bpool': more than one matching pool  
import by numeric ID instead

find the pool id by doing:
`zdb -l /dev/disk/by-id/XXXXXXXXXXXXXXXXXXXX-part1 | grep pool_guid`


## Working with zpool features

### List list feature values

`zpool get all apool | grep feature@`

### Enable feature on pool

**Caution: there is no undo or disable later!**
`zpool set feature@zstd_compress=enabled apool`

### Upgrade all features on pool

**Caution: there is no undo or disable later! This might be a bad idea! Some features can cause considerable issues in the future!**
To upgrade a specific pool and enable all new features, run:
`zpool upgrade apool`

## Maintenance

### Clear faulted state
`zpool clear <pool_name> <drive_identifier>`

## useful websites

<https://discourse.practicalzfs.com/>
