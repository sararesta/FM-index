pkgname <- "FMIndex"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('FMIndex')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("computeFMIndex")
### * computeFMIndex

flush(stderr()); flush(stdout())

### Name: computeFMIndex
### Title: Writes the FM index
### Aliases: computeFMIndex

### ** Examples

computeFMIndex(system.file("extdata/seq5.fasta",package="FMIndex"),"")
computeFMIndex(system.file("extdata/seq5.fasta",package="FMIndex"),"",tallywidth=1)



cleanEx()
nameEx("getFcolumn")
### * getFcolumn

flush(stderr()); flush(stdout())

### Name: getFcolumn
### Title: Compute the F column
### Aliases: getFcolumn

### ** Examples

library(Biostrings)
getFcolumn(DNAString("ACCT"))




cleanEx()
nameEx("getLcolumn")
### * getLcolumn

flush(stderr()); flush(stdout())

### Name: getLcolumn
### Title: Compute the L column of a sequence
### Aliases: getLcolumn

### ** Examples

library(Biostrings)
getLcolumn(DNAString("ACGT"))
getLcolumn(DNAString("AACCGT"))



cleanEx()
nameEx("getTallyTable")
### * getTallyTable

flush(stderr()); flush(stdout())

### Name: getTallyTable
### Title: Create the Tally Table
### Aliases: getTallyTable

### ** Examples

library(Biostrings)
getTallyTable(DNAString("T.AACCG"))
getTallyTable(DNAString("T.AACCG"),2)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
