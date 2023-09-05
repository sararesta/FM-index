test_that("Computing the L column (BWT) and suffix array of a DNA string",{
    sequence <- Biostrings::DNAString("ACGTTACG")
    solution.bwt <- Biostrings::DNAString("GT.AACCTG")
    solution.SA <- c(9,6,1,7,2,8,3,5,4)
    expect_equal(getLcolumn(sequence)[["bwt"]],solution.bwt)
    expect_equal(getLcolumn(sequence)[["suffix_array"]],solution.SA)
})

test_that("Computing the suffix array of a DNA string",{
  sequence <- Biostrings::DNAString("ACAATGT")
  solution <- c(8,3,1,4,2,6,7,5)
  expect_equal(getSA(sequence),solution)
})

test_that("Testing warning condition",{
  bwt <- Biostrings::DNAString("")
  expect_warning(getLcolumn(bwt),"The input sequence is empty.")
})

test_that("Testing warning condition",{
  bwt <- Biostrings::DNAString("")
  expect_warning(getSA(bwt),"The input sequence is empty.")
})

