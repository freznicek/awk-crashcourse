# cut vs awk behavior

Following example compares `cut` strict delimiting behavior to more flexible `awk` one.


## Is `awk` really needed when `cut` is already out there?

`cut` utility is good enough to be used instead of `awk` when we work with fixed text format like csv or similar...

```
$ head -5 /etc/group
root:x:0:
bin:x:1:
daemon:x:2:
sys:x:3:
adm:x:4:

$ head -5 /etc/group | cut -d : -f 3
0
1
2
3
4

$ head -5 /etc/group | awk -F: '{print $3}'
0
1
2
3
4
```

## `cut` limitations

When looking more deep we found that `cut` defines delimiter as *single character* and thus treat sequence of delimiter characters as multiple delimiters (unlike `awk`) which makes troubles when parsing text formated tables ...

```
$ ps auxwww | head -5
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.2  0.1 194336  8816 ?        Ss   17:09   0:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 21
root         2  0.0  0.0      0     0 ?        S    17:09   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    17:09   0:00 [ksoftirqd/0]
root         5  0.0  0.0      0     0 ?        S<   17:09   0:00 [kworker/0:0H]
$ ps auxwww | head -5 | cut -d " " -f 2





$ ps auxwww | head -5 | awk '{print $2}'
PID
1
2
3
5
```
## Summary

 * `cut` can replace `awk` in narrow set of use-cases only
