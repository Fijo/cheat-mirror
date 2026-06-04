# User managment

## See who is logged on Linux system and what they are doing

`w`

## See users existing on system

`less /etc/passwd`
`cut -d: -f1 /etc/passwd` (only names)


## See uid ranges

`grep UID_MIN /etc/login.defs`
