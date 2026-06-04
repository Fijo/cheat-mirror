
# Proxmox

## How to force stop a hanging VM

```bash
ps -auwx | grep <VMID>
```

You get a wall of text back, but it's on the first line, in this case I'm trying to kill VM 655 and the process id is 13523

```bash
root@ada:~# ps -aux | grep 655 
root     13523  112  2.9 7411952 977804 ?      Sl   Oct17 19407:48 /usr/bin/kvm -id 655 <giant wall of text after this>
```

```bash
kill -9 PID
```

Based on [source](https://www.reddit.com/r/Proxmox/comments/qi7wgw/comment/hihyqh9/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
