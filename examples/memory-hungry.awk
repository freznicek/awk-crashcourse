# AWK memory hungry application

# actions before reading text stream
BEGIN {
  # constants
  memory_element_fmt = "%%0%dd";
  memory_element_initial_size = 1024;
  alloc_sum = 0;

  for(i=0; (limit_bytes != "") ? alloc_sum < limit_bytes : 1; i++) {
    # allocate data into an array
    alloc_sum += i*memory_element_initial_size;

    i_data_fmt = sprintf(memory_element_fmt, i*memory_element_initial_size);
    arr[i] = sprintf(i_data_fmt, i);

    # report currently allocated amount of memory
    if( (i % 100) == 0)
      printf("index: % 7d, allocated: %9.2f MByte[s], last index keeps: %7.1f MByte[s]\n", i, bytes_to_mb(alloc_sum), bytes_to_mb(length(arr[i])));

    # slow down the progress
    system("sleep 0.01");
  }
}

# functions
function bytes_to_mb(in_value) {
  return(in_value / 1024.0 / 1024.0);
}

# eof
