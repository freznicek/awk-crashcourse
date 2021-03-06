# Using AWK for debugging and/or testing - memory hungry application

AWK is frequently used in testing or debugging environments. Let's demonstrate such use-cases with memory hungry application [memory-hungry.awk](memory-hungry.awk) which helped with HTCondor test automation.

The application code additionally shows:
 * usage of user-defined functions
 * usage of external command execution using `system()` buildin

The application itself fills an array with text blocks so memory footprint of such application is just growing.

```
$ awk -v limit_bytes=100000000  -f memory-hungry.awk
index:       0, allocated:      0.00 MByte[s], last index keeps:     0.0 MByte[s]
index:     100, allocated:      4.93 MByte[s], last index keeps:     0.1 MByte[s]
index:     200, allocated:     19.63 MByte[s], last index keeps:     0.2 MByte[s]
index:     300, allocated:     44.09 MByte[s], last index keeps:     0.3 MByte[s]
index:     400, allocated:     78.32 MByte[s], last index keeps:     0.4 MByte[s]
```

Notes:
* it is recommended to always use `-v limit_bytes=<int>` awk parameter when running this example unless your system soon gets out of free memory
