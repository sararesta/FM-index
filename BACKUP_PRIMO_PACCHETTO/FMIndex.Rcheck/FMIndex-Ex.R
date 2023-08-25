pkgname <- "FMIndex"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('FMIndex')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("FMindex")
### * FMindex

flush(stderr()); flush(stdout())

### Name: FMindex
### Title: Writes the FM index
### Aliases: FMindex

### ** Examples

FMindex(system.file("extdata/examples/seq5.fasta",package="FMIndex"),"")
FMindex(system.file(
"extdata/examples/seq5.fasta",package="FMIndex"),"",tallywidth=1)



cleanEx()
nameEx("getFcolumn")
### * getFcolumn

flush(stderr()); flush(stdout())

### Name: getFcolumn
### Title: Compute the F column
### Aliases: getFcolumn

### ** Examples

getFcolumn(Biostrings::DNAString("ACCT"))




cleanEx()
nameEx("getLcolumn")
### * getLcolumn

flush(stderr()); flush(stdout())

### Name: getLcolumn
### Title: Compute the L column of a sequence
### Aliases: getLcolumn

### ** Examples

getLcolumn(Biostrings::DNAString("ACGT"))
getLcolumn(Biostrings::DNAString("AACCGT"))



cleanEx()
nameEx("getSA")
### * getSA

flush(stderr()); flush(stdout())

### Name: getSA
### Title: Compute the suffix array of a string
### Aliases: getSA

### ** Examples

getSA(Biostrings::DNAString("ACGT"))
getSA(Biostrings::DNAString("AACCGT"))



cleanEx()
nameEx("getTallyTable")
### * getTallyTable

flush(stderr()); flush(stdout())

### Name: getTallyTable
### Title: Create the Tally Table
### Aliases: getTallyTable

### ** Examples

getTallyTable(Biostrings::DNAString("T.AACCG"))
getTallyTable(Biostrings::DNAString("T.AACCG"),2)



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
