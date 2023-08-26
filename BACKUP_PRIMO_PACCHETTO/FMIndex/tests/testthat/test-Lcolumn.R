test_that("Computing the L column (BWT) of a DNA string",{
    sequence <- Biostrings::DNAString("ACGTTACG")
    solution <- Biostrings::DNAString("GT.AACCTG")
    expect_equal(getLcolumn(sequence)[["bwt"]],solution)
})