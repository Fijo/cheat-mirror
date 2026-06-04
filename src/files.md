# Files

## enhanced find output with dates
`find . -name "*json*" | xargs -d '\n' stat -c "%-25n %y"`

## find and sort by date modified
`find . -printf "%T@ %Tc %p\n" | sort -n`

**printf** arguments from `man find`
- `%Tk`: File's last modification time in the format specified by `k`.
- `@`: seconds since Jan. 1, 1970, 00:00 GMT, with fractional part.
- `c`: locale's date and time (Sat Nov 04 12:02:33 EST 1989).
- `%p`: File's name

## stat stuff
`stat -c '%n | Creation: %.10w Modification: %.10y Change: %.10z' ./*`

use `%.10z` instead of `%z` to just print the date part

from man page
 %w     Time of creation
 %x     Time of last access
 %y     Time of last modification
 %z     Time of last change
 %n     Name of file

## only include matching lines

`cat xyz | grep PATTERN -`
Default patter accepted is BRE see <https://learnbyexample.github.io/learn_gnugrep_ripgrep/breere-regular-expressions.html#breere-regular-expressions>


## watch file modifications in directory
`watch -n1 'find $PWD -type f -printf "%T@ %Tc %p\n" | sort -nr | head -10'`




