# AWK crashcourse

AWK language course aims to explain AWK in 15 minutes to let you find new tool friend despite it's name.

## General language description

AWK language is:
 * (mainly) text processing language 
 * available on most UNIX-like systems by default, on Windows there is either native binary or cygwin one
 * syntax is influenced by `c` and `shell` programming languages
 * AWK programs from single line to multiple library files 
 * there are several implementations notably `gawk` and `mawk`
 * solves generaly same problems as similar text-processing tools `sed`, `grep`, `wc`, `tr`, `printf`, ...

AWK language use-cases are:
 * computing int / floating point math formulas (based on input)
 * general text-processing
   * cutting pieces from input text stream
   * reformatting input text stream
 * shell meta-programming generator

## Processing workflow aka `main()`
Every AWK execution consist of folowing three phases:
 * `BEGIN{ ... }` are actions performed at the beginning *before first text character* is read
 * `{ ... }` are actions performed *on every* `AWK record` (default text line)
   * every `AWK record` is automatically split into `AWK fields` (by default words)
 * `END{ ... }` are actions performed at the end of the execution  *after last text character is read*

### warm-up basic example

```awk
$ echo -e "AWK is still useful\ntext-processing  technology!" | \
>   awk 'BEGIN{wcnt=0;print "lineno/#words/3rd-word: individual words\n"}
>             {printf("% 6d/% 6d/% 8s: %s\n",NR,NF,$3,$0);wcnt+=NF}
>          END{print "\nSummary:", NR, "lines/records,", wcnt, "words/fields"}'
lineno/#words/3rd-word: individual words

     1/     4/   still: AWK is still useful
     2/     2/        : text-processing  technology!

Summary:2 lines/records, 6 words/fields
```

## Command-line basics

* Passing text data to AWK:
  * from pipe: `cat input-text-data | awk <app>`
  * from file[s] read by awk itself: `awk <app> input-text-data`

* AWK application execution styles (`-f`):
  * on command-line `awk '{ ... }' input-text-data`
  * in separate files `awk -f myapp.awk input-text-data`

* specifying an AWK variable on command-line `-v`
* specifying `AWK field` separator `FS` via `-F`


## Essential variables
Most common variables are:
 * `RS` Specifies the input `AWK record` separator, i.e. how AWK breaks input stream into records
 * `FS` Specifies the input `AWK field` separator, i.e. how AWk breaks input record into fields.
 * `OFS` Specifies the output separator, i.e. how AWK print parsed fields to the output stream.
 * `ORS` Specifies the output separator, i.e. how AWK print parsed records to the output stream.
 * `FILENAME` contains the name of the input file read by awk

## Most used functions
The important functions are:
 * `print`, `printf()` and `sprintf()`
   * printing functions
 * `length()`
   * lengt of an string argument
 * `substr()`
   * splitting string to a substring
 * `split()`
   * split string into an array of strings
 * `index()`
   * find position of an substring in a string
 * `index()`
   * find position of an substring in a string
 * `sub()` and `gsub()`
   * (regexp) search and replace (once respectivelly globally)
 * `~` operator and `match()`
   * regexp search
 * `tolower()` and `toupper()`
   * convert text to lowercase resp. uppercase

## Learn by examples
 * [Hello world](examples/hello-world.md)
 * [Word count using wc and awk](examples/word-count.md)
 * [Pattern search using grep and awk](examples/pattern-search-count.md)
 * [Uniq words in awk](examples/uniq-words.md)
 * [Computing the average](examples/average.md)
 * [Text stream FSM machine](examples/text-fsm.md)
 * [Shell metaprogramming with awk](examples/shell-metaprogramming.md)
 * [Why is cut very limited to awk](examples/cut-vs-awk.md)
 * [Memory hungry application](examples/memory-hungry.md)
 * [CPU intensive application](examples/cpu-intensive.md)
 * [Profiling AWK application](examples/profiling.md)
 

## Best practices

### Portability

Prefer general `awk` before an implementation:
 * use general `awk` for portable programs
 * otherwise use the particular implementation e.g. `gawk`

### AWK programs extension is `*.awk`

General rule of thumb is to create AWK program as a `*.awk` file if equivalent one-liner is not well readable.

### Code quality
 * comment properly
 * indent similarly as in c/c++ programmimng language
 * use functions
 * stay explicit and thus avoid [awk implicit actions](TODO)


## [Additional resources](https://github.com/freznicek/awesome-awk/blob/master/README.md)

