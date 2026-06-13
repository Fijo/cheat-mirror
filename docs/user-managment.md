# User management

## See who is logged on Linux system and what they are doing

`w`

## See users existing on system

`less /etc/passwd`

`cut -d: -f1 /etc/passwd` (only names)

## See uid ranges

`grep UID_MIN /etc/login.defs`

## Check if users password is set
`passwd --status username`

From man passwd:
Display account status information. The status information consists of 7 fields. The first field is the user's login name. The second field indicates if the user account has a locked password (L), has no password (NP), or has a usable password (P). The third field gives the date of the last password change. The next four fields are the minimum age, maximum age, warning period, and inactivity period for the password. These ages are expressed in days.

From [source](https://unix.stackexchange.com/a/184975)
