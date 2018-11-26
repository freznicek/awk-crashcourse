# AWK text processing with FSM machine

# actions before reading text stream
BEGIN {
  # constants
  fsm = 0;
}

# at each line actions
{
  if( (fsm==0)&&($0 ~ /^Name:[ \t]+tt-.+\.seznam\.cz$/) )
    fsm = 1;

  if( (fsm==1)&&($0 ~ /^CreationTimestamp:[ \t]+/) )
    fsm = 0;

  if (fsm==1)
    print;

}

# eof
