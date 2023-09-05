## ----style, echo = FALSE, results = 'asis'------------------------------------
library(BiocStyle)

## ----setup1-------------------------------------------------------------------
library(FMIndex)

## ----setup2, echo = FALSE-----------------------------------------------------
library(knitr)

## ----session_info, include=FALSE----------------------------------------------
sessionInfo()

## ----F_column_ex1-------------------------------------------------------------
getFcolumn(Biostrings::DNAString("ACCT"))

## ----F_column_ex2-------------------------------------------------------------
getFcolumn(Biostrings::DNAString("ACCT"))

## ----L_column_ex--------------------------------------------------------------
getLcolumn(Biostrings::DNAString("AACCGT"))

## ----tally_table_ex1----------------------------------------------------------
getTallyTable(Biostrings::DNAString("T.AACCG"))

## ----tally_table_ex2----------------------------------------------------------
getTallyTable(Biostrings::DNAString("T.AACCG"),2)

## ----suffix_array_ex----------------------------------------------------------
getSA(Biostrings::DNAString("ACGTTC"))

## ----FM_ex1-------------------------------------------------------------------
FMindex(system.file("extdata/vignettes/seq.fasta",package="FMIndex"),"")

## ----FM_ex2-------------------------------------------------------------------
FMindex(system.file("extdata/vignettes/seq.fasta",package="FMIndex"),"",
        includeEndChar=FALSE)

## ----FM_ex3-------------------------------------------------------------------
FMindex(system.file("extdata/vignettes/seq.fasta",package="FMIndex"),"",
        tallywidth=10)

