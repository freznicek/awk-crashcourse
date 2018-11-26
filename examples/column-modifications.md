# AWK column modifications example

AWK is strong tool when you need to work with text fields together (specific text column).

## How to replace column with other one and remove last one

```awk
$ echo -e "A,B,C,D\na,b,c,d\n1,2,3,4"
A,B,C,D
a,b,c,d
1,2,3,4

$ echo -e "A,B,C,D\na,b,c,d\n1,2,3,4" | \
    awk 'BEGIN{FS=",";OFS=";";}
         NF>3 {$3=$4;NF-=1;print;}'
A;B;D
a;b;d
1;2;4
```

## Notes
