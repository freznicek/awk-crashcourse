# AWK CPU intensive application

You may know Linux tool `stress` which is very useful when you want to test whether your PC is correctly functional under heavy load. Let's show similar functionality using [cpu-intensive.awk](cpu-intensive.awk) application.

`stress` tool is able to stress the machine couple of ways:
```
`stress' imposes certain types of compute stress on your system

Usage: stress [OPTION [ARG]] ...
 -?, --help         show this help statement
     --version      show version statement
 -v, --verbose      be verbose
 -q, --quiet        be quiet
 -n, --dry-run      show what would have been done
 -t, --timeout N    timeout after N seconds
     --backoff N    wait factor of N microseconds before work starts
 -c, --cpu N        spawn N workers spinning on sqrt()
 -i, --io N         spawn N workers spinning on sync()
 -m, --vm N         spawn N workers spinning on malloc()/free()
...
-d, --hdd N        spawn N workers spinning on write()/unlink()
...
Example: stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10s
```
In our example we focus on plain computation effort (`stress -c 1`), [cpu-intensive.awk](cpu-intensive.awk) application shows:
 * use of expensive math
   * functions `sqrt(), rand()` 
   * operator `**`
 * syntax of infinite loop


## running the example
```
$ awk -f /tmp/x.awk 
.....................................
```



## Notes
 * be aware this functionality is available in `gawk` implementation only
 * [The documentation describes precisely what functionality you can expect](https://www.gnu.org/software/gawk/manual/gawkinet/html_node/Introduction.html#Introduction)

