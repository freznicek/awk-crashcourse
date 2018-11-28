# GAWK profiling

GNU AWK is able to profile the executed code (switch `-p`).

This is particulary useful when you're debugging test FSM applications. See details below.

* I don't get it why my AWK command does not work...
```awk
$ kubectl describe node | awk -f text-fsm-bug.awk
$ 
```

* Let's try `gawk -p` profiling to see what is going on there
```awk
$ kubectl describe node | gawk -p -f text-fsm-bug.awk
$ ls -la awkprof.out
-rw-rw-r--. 1 freznicek freznicek 347 Nov 28 13:55 awkprof.out
$ cat awkprof.out
        # gawk profile, created Wed Nov 28 13:55:03 2018

        # BEGIN rule(s)

        BEGIN {
     1          fsm = 0
        }

        # Rule(s)

  1319  {
  1319          if (fsm == 0 && $0 ~ /^Name:[ \t]+tt-.+\.seznam\.cz$/) { # 14
    14                  fsm = 1
                }
  1319          if (fsm == 1 || $0 ~ /^CreationTimestamp:[ \t]+/) { # 28
    28                  fsm = 0
                }
  1319          if (fsm == 1) {
                        print $0
                }
        }
```
* resolution based on the profiling report
  * initialization is OK
  * switching fsm=0 -> 1 is OK
  * no line printed in `fsm==0`
  * problem is in fsm=1 -> 0 transition:

```diff
-if (fsm == 1 || $0 ~ /^CreationTimestamp:[ \t]+/) {
+if (fsm == 1 && $0 ~ /^CreationTimestamp:[ \t]+/) {
```

## Notes
 * this functionality is available in GNU AWK `gawk` only
 
