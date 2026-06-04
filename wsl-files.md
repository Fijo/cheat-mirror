# WSL files

## Very useful
TDLR for command `wslpath`
Example usage:

```bash
$ wslpath -w .
\\wsl.localhost\Debian\home\fijo
```

```PowerShell
>>> wsl wslpath -a 'C:\\aaa\\bbb\\ccc\\foo.zip'
/mnt/c/aaa/bbb/ccc/foo.zip
```

`wslpath` options and parameters:
```
-a    force result to absolute path format
-u    translate from a Windows path to a WSL path (default)
-w    translate from a WSL path to a Windows path (UNC)
-m    translate from a WSL path to a Windows path, with ‘/’ instead of ‘\\’
```
