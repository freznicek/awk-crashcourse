# AWK CPU intensive application

# actions before reading text stream
BEGIN{
  for(i=0;;i++){
    # perform expensive math in an infinite loop
    sqrt(i**i + rand());
    # modest progress bar
    if ((i % 1000000) == 0)
      printf "."
  }
}
# eof
