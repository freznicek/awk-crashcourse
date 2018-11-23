# AWK crashcourse

AWK language course aims to explain AWK in 15 minutes to let you find new tool friend despite it's name.

## General language description

AWK language is:
 * (mainly) text processing language 
 * available on most UNIX-like systems by default, on Windows there is either native binary or cygwin one
 * syntax is influenced by `c` and `shell` programming languages
 * AWK programs from single line to multiple library files 
 * there are several implementations notably `gawk` and `mawk`

AWK language use-cases are:
 * computing math formulas (based on input)
 * general text-processing
 * meta-programming generator for a shell

## Processing workflow aka `main()`
Every AWK execution consist of folowing three phases:
 * `BEGIN{ ... }` are actions performed at the beginning *before first text character* is read
 * `{ ... }` are actions performed *on every* `AWK record` (default text line)
   * every `AWK record` is automatically split into `AWK fields` (by default words)
 * `END{ ... }` are actions performed at the end of the execution  *after last text character is read*


## Command-line basics
TODO


## Essential variables and functions
TODO

### variables
TODO

### functions
TODO

## Learn by examples
TODO

## Best practices

### Portability

Prefer general `awk` before an implementation:
 * use general `awk` for portable programs
 * otherwise use the particular implementation e.g. `gawk`

### AWK programs extension is `*.awk`

### Code quality
 * comment properly
 * indent similarly as in c/c++ programmimng language
 * use functions
 * stay explicit and thus avoid [awk implicit actions](TODO)


## [Additional resources](https://github.com/freznicek/awesome-awk/blob/master/README.md)

