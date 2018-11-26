# AWK Word count example

We probably all know the `wc` unix executable which counts:
 * number of lines
 * number of words
 * number of bytes
 of a given file

We'are going to cover (similar) functionality with small awk program [word-count.awk](word-count.awk).

## Basic example [word-count](word-count.awk)

```
$ ps auxww > /tmp/ps.log

$ wc  /tmp/ps.log
  389  4737 37752 /tmp/ps.log

$ awk -f word-count.awk  /tmp/ps.log
  389  4737  37752 /tmp/ps.log
```

## Notes
 * This minimalistic word count example suffers from couple of problems, find at least three of them!
