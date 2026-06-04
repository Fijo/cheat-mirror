# File organization

## powerful terminal file manager (for moving around stuff on my 8TB archive etc)
```bash
mc
```
- how to [customize the columns](https://unix.stackexchange.com/questions/623219/have-mc-show-size-time-and-permissions-at-once)
- help on [mc usage](https://www.tecmint.com/midnight-commander-a-console-based-file-manager-for-linux/)
- [background job feature](https://bbs.archlinux.org/viewtopic.php?pid=491816#p491816) in mc
- [cheatsheet](https://gist.github.com/samiraguiar/9cd4264445545cfd459d) for mc

## ensure a folder has been copied

```bash
diff -r -q --speed-large-files $sourceDir $targetDir
# prints a list of changes. If nothing was printed both are identical.
```


## organizing files

## findings duplicates
- [fclones](https://github.com/pkolaczk/fclones) - see `GIT_REPO_fijo.personal.toolkit/proxmox/AllServers/backups/internal/manual-backups` for setup instructions and usage examples

## mv-ark

Uses `GIT_REPO_fijo.personal.toolkit/scripts/linux/mv-ark`. For usage examples see `GIT_REPO_fijo.personal.toolkit/proxmox/AllServers/backups/internal/manual-backups/README.md`.

## tools with gui
- [fslint](https://recoverit.wondershare.com/file-recovery/linux-find-duplicate-files.html)

# snippets specific to my pve-home archive
```cmd
wsl.exe -e bash -lc "ssh root-pve-home -t \"bash -c 'mc /apool/dump/existingArch/ /apool/man-backup/'\""
```
