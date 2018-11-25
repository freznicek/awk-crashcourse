# AWK word cound mimicking wc tool functionality

# actions before reading text stream
BEGIN {
  fcnt = bcnt = 0;
}

# at each line actions
{
  fcnt += NF;
  bcnt += length($0);
}

# actions when text stream read
END {
  printf("% 7d\t% 7d\t% 7d\t%s\n", NR, fcnt, bcnt, FILENAME);
}

# eof
