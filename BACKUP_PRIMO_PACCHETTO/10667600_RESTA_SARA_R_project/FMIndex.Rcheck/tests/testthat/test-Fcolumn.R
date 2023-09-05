test_that("Computing the F column with the termination character",{
    sequence <- Biostrings::DNAString("ACGTTACG")
    solution <- c(1,2,2,2,2)
    names(solution) <- c(".","A","C","G","T")
    expect_equal(getFcolumn(sequence),solution)
})

test_that("Computing the F column without the termination character",{
    sequence <- Biostrings::DNAString("ACGTTACG")
    solution <- c(2,2,2,2)
    names(solution) <- c("A","C","G","T")
    expect_equal(getFcolumn(sequence,includeEndChar=FALSE),solution)
})

test_that("Testing warning condition",{
  bwt <- Biostrings::DNAString("")
  expect_warning(getFcolumn(bwt),"The input sequence is empty.")
})