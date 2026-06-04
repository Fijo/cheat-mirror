# ZFS 

## Stats

`arcstat`

`arc_summary | more`
`arc_summary -d | more`

`zpool iostat [tank] 1`

## Manual mounting

```bash
sudo zfs load-key apool
zfs mount apool/subvol-101-disk-0
```

## Destroy all snapshots containing syncoid

`zfs list -r -t snapshot apool -o name | grep syncoid | xargs -d '\n' -n1 zfs destroy`
test first with
`zfs list -r -t snapshot apool -o name | grep syncoid | xargs -d '\n' -n1 zfs get available`

## useful websites

<https://discourse.practicalzfs.com/>
