# AWK computing an average of top command

# actions before reading text stream
BEGIN {
  acc=0.0;
  FS="[ ,]+";
}

# at each line actions
{
  acc += $(NF-2)+0;
}

# actions when text stream read
END {
  print acc / NR;
}

# eof
