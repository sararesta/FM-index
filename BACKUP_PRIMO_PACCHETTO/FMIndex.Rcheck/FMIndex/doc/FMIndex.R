## ----style, echo = FALSE, results = 'asis'------------------------------------
library(BiocStyle)

## ----setup--------------------------------------------------------------------
library(FMIndex)

## ---- echo = FALSE------------------------------------------------------------
library(knitr)

## -----------------------------------------------------------------------------
getFcolumn(Biostrings::DNAString("ACCT"))

## -----------------------------------------------------------------------------
getLcolumn(Biostrings::DNAString("AACCGT"))

## -----------------------------------------------------------------------------
getTallyTable(Biostrings::DNAString("T.AACCG"))

## -----------------------------------------------------------------------------
getTallyTable(Biostrings::DNAString("T.AACCG"),2)

## -----------------------------------------------------------------------------
getSA(Biostrings::DNAString("ACGTTC."))

## -----------------------------------------------------------------------------
FMindex(system.file("extdata/vignettes/seq5.fasta",package="FMIndex"),"")

## -----------------------------------------------------------------------------
FMindex(system.file("extdata/vignettes/seq5.fasta",package="FMIndex"),"",includeSA=TRUE)

