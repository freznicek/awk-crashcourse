# GAWK network programming

GNU awk (`gawk`) gained the network programming capabilities back in late 2000 (in version gawk-3.0.6). Since then `gawk` is able to perform network communication over UDP and TCP and making custom TCP tools including the simple web server[s] useful only for debugging (not in production).

## GAWK as text web server with minimal dependencies

[gawk-web-server.awk](gawk-web-server.awk) app example shows how cam `bash` and `gawk` provide simple web server reloading with every request.

```
# server-side
$ for((i=0;i<5;i++)); do gawk -v cnt=$i -v host=$(hostname) -f gawk-web-server.awk; done



# client-side
$ for i in {1..6}; do curl localhost:8080; done
Hello, world, cnt=0, hostname=<my-censored-hostname>
Hello, world, cnt=1, hostname=<my-censored-hostname>
Hello, world, cnt=2, hostname=<my-censored-hostname>
Hello, world, cnt=3, hostname=<my-censored-hostname>
Hello, world, cnt=4, hostname=<my-censored-hostname>
curl: (7) Failed to connect to localhost port 8080: Connection refused
```


## Notes
 * be aware this functionality is available in `gawk` implementation only
 * [The documentation describes precisely what functionality you can expect](https://www.gnu.org/software/gawk/manual/gawkinet/html_node/Introduction.html#Introduction)
