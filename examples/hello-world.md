# AWK Hello World example

## Basic Hello world example
```awk
$ awk 'BEGIN{print "Hello World!"}'
Hello World!
```

## What happens when I use `{}` block?
```awk
$ awk '{print "Hello World!"}'
^C

$ seq 5 | awk '{print "Hello World!"}'
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
```
