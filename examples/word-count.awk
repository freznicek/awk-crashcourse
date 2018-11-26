# AWK word cound mimicking wc tool functionality

# actions before reading text stream
BEGIN {
  fcnt = bcnt = 0;
}

# at each line actions
{
  # accumulate the counters
  fcnt += NF;
  bcnt += length($0) + 1;
}

# actions when text stream read
END {
  # print the statistics
  printf("%d %d %d %s\n", NR, fcnt, bcnt, FILENAME);
}

# eof
