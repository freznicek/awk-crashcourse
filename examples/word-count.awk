# AWK word cound mimicking wc tool functionality
#   requires gawk

# actions before reading text stream
BEGIN {
  fcnt = bcnt = 0;
  # Linux, OSX: LF; Windows: CR LF; old Mac CR
  RS="(\n|\r\n|\r)"; # gawk extension
}

# at each line actions
{
  # accumulate the counters
  field_cnt += NF;
  byte_cnt += length($0) + length(RT);
}

# actions when text stream read
END {
  # print the statistics
  printf("%d %d %d %s\n", NR, field_cnt, byte_cnt, FILENAME);
}

# eof
