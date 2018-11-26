# AWK shell metaprogramming example

[Metaprogramming](https://en.wikipedia.org/wiki/Metaprogramming) is a technique how to treat program as the data to be able to create / modify program at runtime.

We'are going to cover few scenarios how to generate shell code at runtime meeting desired needs.

## Renaming files

Let's you are unhappy with files having spaces in their names and you want to replace then in batch:
```sh
# " " -> "_" replacement
ls *.mp3| \
  awk '{l=$0;gsub(/ /,"_"); printf("mv \"%s\" \"%s\"\n",l,$0) }' | \
  sh
```

### transcript

```
$ ll 1*.mp3
-rw-r--r--. 1 freznicek freznicek 6691535 Oct  6  2009 '10 - Hunter.mp3'
-rw-r--r--. 1 freznicek freznicek 7830461 Oct  6  2009 '11 - Hidden Place.mp3'
-rw-r--r--. 1 freznicek freznicek 7696868 Oct  5  2009 '12 - Isobel.mp3'
-rw-r--r--. 1 freznicek freznicek 7153842 Oct  6  2009 '13 - Possibly Maybe.mp3'
-rw-r--r--. 1 freznicek freznicek 6113665 Oct  6  2009 '14 - Play Dead.mp3'
-rw-r--r--. 1 freznicek freznicek 7075674 Oct  6  2009 '15 - It'\''s In Our Hands.mp3'

$ ls 1*.mp3| awk '{l=$0;gsub(/ /,"_");printf("mv \"%s\" \"%s\"\n",l,$0) }'
mv "10 - Hunter.mp3" "10_-_Hunter.mp3"
mv "11 - Hidden Place.mp3" "11_-_Hidden_Place.mp3"
mv "12 - Isobel.mp3" "12_-_Isobel.mp3"
mv "13 - Possibly Maybe.mp3" "13_-_Possibly_Maybe.mp3"
mv "14 - Play Dead.mp3" "14_-_Play_Dead.mp3"
mv "15 - It's In Our Hands.mp3" "15_-_It's_In_Our_Hands.mp3"

$ ls 1*.mp3| awk '{l=$0;gsub(/ /,"_");printf("mv \"%s\" \"%s\"\n",l,$0) }' | sh

$ ll 1*.mp3
-rw-r--r--. 1 freznicek freznicek 6691535 Oct  6  2009 10_-_Hunter.mp3
-rw-r--r--. 1 freznicek freznicek 7830461 Oct  6  2009 11_-_Hidden_Place.mp3
-rw-r--r--. 1 freznicek freznicek 7696868 Oct  5  2009 12_-_Isobel.mp3
-rw-r--r--. 1 freznicek freznicek 7153842 Oct  6  2009 13_-_Possibly_Maybe.mp3
-rw-r--r--. 1 freznicek freznicek 6113665 Oct  6  2009 14_-_Play_Dead.mp3
-rw-r--r--. 1 freznicek freznicek 7075674 Oct  6  2009 '15_-_It'\''s_In_Our_Hands.mp3'

```


## Deleting files

Assume situation when you want to delete files based on file-list provided by `find` execution and additional condition.

### [A] find can handle all alone but without an additional condition

```sh
# let's delete /tmp/...*.log older than 10 minutes
$ find /tmp -maxdepth 3 -name "*.log" -mmin "+10" -delete
```

### [B] find + grep + xargs can handle the additional condition

```sh
# let's delete /tmp/...*.log older than 10 minutes which are having hard link count == 1
$ find /tmp -maxdepth 3 -name "*.log" -mmin "+10" -printf "%n;%p\n" | \
    grep -E "^1;" | xargs
```

### [C] find + awk + sh can handle the additional conditions

```sh
# let's delete /tmp/...*.log older than 10 minutes which are having hard link count == 1 and we know how many of them we deleted
$ find /tmp -maxdepth 3 -name "*.log" -mmin "+10" -printf "%n;%p\n" | \
    gawk -F";" '$1 == 1 {printf("rm -f \"%s\"\n", $2)} END{print NR > "/dev/stderr"}' 2>/tmp/count.txt | \
    sh
$ head -1 /tmp/count.txt
15
```


## Notes
