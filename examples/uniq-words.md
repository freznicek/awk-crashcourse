# Count unique records in AWK

Unix `uniq` tool is able to show how many duplicities are stored in a text stream (`uniq -c`).

We show how easily similar functionality can be achieved in [uniq-words.awk](uniq-words.awk)

## Analyze processes and list how many processes are executed by individual users

```
# let's generate text data for the experiment
$ ps auxwww > /tmp/ps.log

# analyze processes via sort + uniq -c
$ awk '{print $1}' /tmp/ps.log | sort | uniq -c | sort -n
      1 chrony
      1 colord
      1 dbus
      1 nobody
      1 polkitd
      1 rtkit
      1 USER
      2 avahi
      2 td-agent
     20 gdm
    171 root
    199 freznic+

# analyze processes via uniq-words.awk
$ awk '{print $1}' /tmp/ps.log | awk -f uniq-words.awk | sort -n
      1 chrony
      1 colord
      1 dbus
      1 nobody
      1 polkitd
      1 rtkit
      1 USER
      2 avahi
      2 td-agent
     20 gdm
    171 root
    199 freznic+

```
