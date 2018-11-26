# AWK pattern search and count

# actions before reading text stream
BEGIN {
  if ( pattern == "") {
    pattern = "root";
  }
  match_count = 0;
}

# at each line actions
{
  if ($0 ~ pattern) {
    match_count += 1;
    print
  }
}

# actions when text stream read
END {
  print match_count > "/dev/stderr";
}

# eof
