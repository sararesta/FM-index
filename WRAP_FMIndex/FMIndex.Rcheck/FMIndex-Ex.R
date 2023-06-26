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

computeFMIndex(system.file("extdata/seq5.fasta",package="FMIndex"),"test01.txt")
computeFMIndex(system.file("extdata/seq5.fasta",package="FMIndex"),"test02.txt",tallywidth=1)



cleanEx()
nameEx("getBWTcharacter")
### * getBWTcharacter

flush(stderr()); flush(stdout())

### Name: getBWTcharacter
### Title: Compute the i-th character of the BWT
### Aliases: getBWTcharacter

### ** Examples

getBWTcharacter(2,"ACGT",c(5,1,2,3,4))
getBWTcharacter(3,"ACG",c(4,1,2,3))



cleanEx()
nameEx("getLcolumn")
### * getLcolumn

flush(stderr()); flush(stdout())

### Name: getLcolumn
### Title: Compute the L column of a sequence
### Aliases: getLcolumn

### ** Examples

getLcolumn("ACGT")
getLcolumn("AACCGT")



cleanEx()
nameEx("getSuffix")
### * getSuffix

flush(stderr()); flush(stdout())

### Name: getSuffix
### Title: Get the suffix
### Aliases: getSuffix

### ** Examples

getSuffix(2,"ACGT")
getSuffix(5,"ACCCAGT")



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
