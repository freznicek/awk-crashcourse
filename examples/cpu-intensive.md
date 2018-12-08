# AWK CPU intensive application

You may know Linux tool `stress` which is very useful when you want to test whether your PC is stable enough even under long-term heavy load.

`stress` tool is able to stress the machine couple of ways:
```
`stress' imposes certain types of compute stress on your system

Usage: stress [OPTION [ARG]] ...
...
 -c, --cpu N        spawn N workers spinning on sqrt()
 -i, --io N         spawn N workers spinning on sync()
 -m, --vm N         spawn N workers spinning on malloc()/free()
...
-d, --hdd N        spawn N workers spinning on write()/unlink()
...
Example: stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10s
```
Let's show similar functionality using [cpu-intensive.awk](cpu-intensive.awk) application mimicking plain computation effort (as `stress -c 1` do), [cpu-intensive.awk](cpu-intensive.awk) shows:
 * use of expensive math
   * functions `sqrt(), rand()` 
   * operator `**`
 * syntax of infinite loop


## running the example
```
# terminal A
$ awk -f cpu-intensive.awk 
..................................................
```

```
# terminal B
$ dstat -clm  --noupdate 30
----total-cpu-usage---- ---load-avg--- ------memory-usage-----
usr sys idl wai hiq siq| 1m   5m  15m | used  buff  cach  free
  2   1  97   0   0   0|0.16 0.69 0.87|2931M  383M 1758M 2912M
 13   4  83   0   0   0|0.14 0.67 0.86|2937M  383M 1763M 2901M
 # cpu-intensive.awk started
 27   1  72   0   0   0|0.27 0.68 0.86|2931M  383M 1758M 2911M
 27   1  72   0   0   0|0.63 0.72 0.87|2929M  383M 1758M 2913M
 28   3  68   0   0   0|0.81 0.76 0.87|2930M  383M 1758M 2912M
 27   1  72   0   0   0|0.90 0.79 0.88|2930M  383M 1758M 2912M
 27   1  72   0   0   0|0.96 0.84 0.89|2932M  383M 1758M 2910M
...
```

## Notes


