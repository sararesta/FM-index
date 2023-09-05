test_that("Computing the Tally Table a DNA string which is a BWT",{
    bwt <- Biostrings::DNAString("GT.AACCTG")
    solution <- rbind(c(0,0,1,0),c(0,0,1,1),c(0,0,1,1),c(1,0,1,1),c(2,0,1,1),c(2,1,1,1),c(2,2,1,1),c(2,2,1,2),c(2,2,2,2))
    colnames(solution) <- c("A","C","G","T")
    expect_equal(getTallyTable(bwt),solution)
})

test_that("Computing the compressed Tally Table a DNA string which is a BWT",{
    bwt <- Biostrings::DNAString("GT.AACCTG")
    solution <- rbind(c(0,0,1,0),c(0,0,1,1),c(2,0,1,1),c(2,2,1,1),c(2,2,2,2))
    colnames(solution) <- c("A","C","G","T")
    expect_equal(getTallyTable(bwt,rowwidth=2),solution)
})

test_that("Testing error condition",{
    bwt <- Biostrings::DNAString("GT.AACCTG")
    expect_error(getTallyTable(bwt,rowwidth=0),"rowwidth must be higher than one.")
})

test_that("Testing error condition",{
  bwt <- Biostrings::DNAString("")
  expect_error(getTallyTable(bwt),
               "The input sequence doesn't contain the termination character")
})

