# Systemd

## Status from last boot
`systemctl`

## Dbus tree
`busctl tree`

## Notes

sudo apt install graphviz

systemctl daemon-reload

systemctl show pve-guests | grep FragmentPath

systemd-analyze verify zfs-load-key.service

systemctl show zfs-load-key.service -p Before,After
WSL_TEMP=$(mktemp --suffix=.svg) && ssh root-pve-home systemd-analyze dot --order local-fs.target | dot -Tsvg > "$WSL_TEMP" && powershell.exe Start-Process "$(wslpath -w $WSL_TEMP)"

WSL_TEMP=$(mktemp --suffix=.svg) && ssh root-pve-home systemd-analyze dot --order local-fs.target | dot -Tsvg > "$WSL_TEMP" && powershell.exe Start-Process "$(wslpath -w $WSL_TEMP)"



WSL_TEMP=$(mktemp --suffix=.svg) && ssh root-pve-home systemd-analyze dot | dot -Tsvg > "$WSL_TEMP" && powershell.exe Start-Process "$(wslpath -w $WSL_TEMP)"


systemd-analyze critical-chain zfs-import.target systemd-user-sessions.service

### target dependency graph
WSL_TEMP=$(mktemp --suffix=.svg) && ssh root-pve-home systemd-analyze dot --order --to-pattern='*.target' --from-pattern='*.target' | dot -Tsvg > "$WSL_TEMP" && powershell.exe Start-Process "$(wslpath -w $WSL_TEMP)"
### one of my favourites
WSL_TEMP=$(mktemp --suffix=.svg) && ssh root-pve-home systemd-analyze plot > "$WSL_TEMP" && powershell.exe Start-Process "$(wslpath -w $WSL_TEMP)"

### To display all the targets and other units your service is currently associated with (both explicitly and implicitly):
systemctl list-dependencies --reverse your-service-name.service

### To view all the targets your service pulls in when it starts:
systemctl show -p WantedBy,RequiredBy,Before,After your-service-name.service


## References

- Good read: The The systemd for Administrators Blog Series at [systemd.io](https://systemd.io/).
- [Arch Wiki: systemd](https://wiki.archlinux.org/title/Systemd)
