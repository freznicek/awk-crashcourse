# AWK math

Awk is better equiped in performing integer and floating point math operations than classical shell.

Math application [average.awk](average.awk) shows:
 * computing of an average (explitit retyping string -> int)
 * accessing fields from the end (`$NF`)
 * spliting records into fields according custom criteria (`FS`)

[AWK numeric functions](https://www.gnu.org/software/gawk/manual/html_node/Numeric-Functions.html) contain:
 * trigonometric functions
 * conversion string -> int
 * random generators
 * exponential and square-root functions

```
$ uptime
 13:39:02 up 26 days,  2:56, 54 users,  load average: 0.90, 1.39, 1.30

$ for i in `seq 1000`; do uptime ; done | awk -f average.awk
0.91448

$ uptime
 13:39:13 up 26 days,  2:56, 54 users,  load average: 0.92, 1.37, 1.30
```
