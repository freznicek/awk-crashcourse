# AWK pattern search and count

AWK can be used as plain grep,  additional computations can be done with awk.

Following example shows combination of `grep <pattern>` and `grep -c <pattern>` using [pattern-search-count.awk](pattern-search-count.awk) program.

```
# generate data to parse
$ ps auxwww > /tmp/ps.log

# essential grep command showing entries
$ grep 'systemd' /tmp/ps.log
root         1  0.0  0.0 197064  4196 ?        Ss   Oct31   2:20 /usr/lib/systemd/systemd --switched-root --system --deserialize 24
root       806  0.0  0.6 162724 51400 ?        Ss   Oct31   3:43 /usr/lib/systemd/systemd-journald
root       848  0.0  0.0  47912  1780 ?        Ss   Oct31   0:20 /usr/lib/systemd/systemd-udevd
root      1059  0.0  0.0  27128  1644 ?        Ss   Oct31   0:15 /usr/lib/systemd/systemd-logind
dbus      1062  0.1  0.9 336104 78796 ?        Ssl  Oct31  45:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root      1266  0.0  0.2 2078436 19772 ?       Ssl  Oct31  37:21 /usr/bin/docker-current daemon --exec-opt native.cgroupdriver=systemd --selinux-enabled --log-driver=journald
gdm       1442  0.0  0.0  47700  2544 ?        Ss   Oct31   0:12 /usr/lib/systemd/systemd --user
gdm       1574  0.0  0.0  58748   108 ?        Ssl  Oct31   0:00 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
freznic+  1975  0.0  0.0  47728  2256 ?        Ss   Oct31   0:12 /usr/lib/systemd/systemd --user
freznic+  2079  0.0  0.0  60476  3644 ?        Ssl  Oct31  33:59 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root      3164  0.0  0.0  17964  1188 ?        Ss   Oct31   0:11 /usr/lib/systemd/systemd-machined

# equivalent awk app showing entries
$ awk -v pattern=systemd -f pattern-search-count.awk /tmp/ps.log 2>/dev/null
root         1  0.0  0.0 197064  4196 ?        Ss   Oct31   2:20 /usr/lib/systemd/systemd --switched-root --system --deserialize 24
root       806  0.0  0.6 162724 51400 ?        Ss   Oct31   3:43 /usr/lib/systemd/systemd-journald
root       848  0.0  0.0  47912  1780 ?        Ss   Oct31   0:20 /usr/lib/systemd/systemd-udevd
root      1059  0.0  0.0  27128  1644 ?        Ss   Oct31   0:15 /usr/lib/systemd/systemd-logind
dbus      1062  0.1  0.9 336104 78796 ?        Ssl  Oct31  45:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root      1266  0.0  0.2 2078436 19772 ?       Ssl  Oct31  37:21 /usr/bin/docker-current daemon --exec-opt native.cgroupdriver=systemd --selinux-enabled --log-driver=journald
gdm       1442  0.0  0.0  47700  2544 ?        Ss   Oct31   0:12 /usr/lib/systemd/systemd --user
gdm       1574  0.0  0.0  58748   108 ?        Ssl  Oct31   0:00 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
freznic+  1975  0.0  0.0  47728  2256 ?        Ss   Oct31   0:12 /usr/lib/systemd/systemd --user
freznic+  2079  0.0  0.0  60476  3644 ?        Ssl  Oct31  33:59 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root      3164  0.0  0.0  17964  1188 ?        Ss   Oct31   0:11 /usr/lib/systemd/systemd-machined

# essential grep command showing count
$ grep -c 'systemd' /tmp/ps.log
11

# essential awk app showing count
$ awk -v pattern=systemd -f pattern-search-count.awk /tmp/ps.log >/dev/null
11
```


## Notes
