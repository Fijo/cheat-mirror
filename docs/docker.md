# Docker

## Starting a shell in the Docker Alpine container
```sh
docker run -it --rm alpine /bin/ash
```

Options used above:  
- `/bin/ash` is Ash ([Almquist Shell](http://www.in-ulm.de/~mascheck/various/ash/#busybox)) provided by BusyBox  
- `--rm` Automatically remove the container when it exits (`docker run --help`)  
- `-i` Interactive mode (Keep STDIN open even if not attached)  
- `-t` Allocate a pseudo-TTY  

[Source](https://stackoverflow.com/a/35689633/1460712)

## Show logs from all containers
```sh
sudo docker ps -q | xargs -L 1 -P `sudo docker ps | wc -l` sudo docker logs --since 30s -f
```
