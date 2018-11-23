# AWK Hello World example

## Basic Hello world example
```
$ awk 'BEGIN{print "Hello World!"}'
Hello World!
```

## What happens when I use `{}` block?
```
$ seq 5 | awk '{print "Hello World!"}'
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
```
