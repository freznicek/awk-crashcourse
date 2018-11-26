# AWK counting uniq records / words

# actions before reading text stream
BEGIN {
  record_order_arr[-1] = 0;
}

# at each line actions
{
  if (record_count_arr[$0] == "") {
    # the record does not exist yet
    record_order_arr[record_order_arr[-1]] = $0;
    record_count_arr[$0] = 1;
    record_order_arr[-1]++;
  } else {
    # the record already exists
    record_count_arr[$0]++;
  }
}

# actions when text stream read
END {
  # report record count sorted by occurrence
  for(indx=0; indx<record_order_arr[-1]; indx++) {
    printf("% 7d %s\n", record_count_arr[record_order_arr[indx]], record_order_arr[indx]);
  }
}

# eof
