test_that("Computing the FM index of a DNA sequence contained ina a fasta file",{
    f.col <- c(1,56,56,57,71)
    names(f.col) <- c(".","A","C","G","T")
    l.col <- Biostrings::DNAString("AGTTGACATTGTATATTGGCGAACCTACCATAG.ACCGCCATGCTATCGCAGTCGAATGATGTTGAGGTAGTAGTTCGACAACATCATTTCTTATTAAATTGGCGATTGGTCACCCGTTGACCAAATTTCTAAGGGTTATCATCAGTACAGATTCCTCTATGTCTCTGGGTCAGGTACTTCTGCTCGAAGGGCTTCGCAGTTAAATGGTCCCAAGCCTCGGCCGTACACTTTGCGGCCGGG")
    tally.table <- as.matrix(read.table("tally_table_complete_solution.txt",header=TRUE,sep="\t"))
    solution <- list(f.col,l.col,tally.table)
    names(solution) <- c("F_column","L_column","tally_table")
    results <- FMindex("seq_test.fasta","")
    expect_equal(results[["F_column"]],solution[["F_column"]])
    expect_equal(results[["L_column"]],solution[["L_column"]])
    expect_equal(results[["tally_table"]],solution[["tally_table"]])
})

test_that("Computing the FM index of a DNA sequence contained ina a fasta file, don't include end character in the F column",{
  f.col <- c(56,56,57,71)
  names(f.col) <- c("A","C","G","T")
  l.col <- Biostrings::DNAString("AGTTGACATTGTATATTGGCGAACCTACCATAG.ACCGCCATGCTATCGCAGTCGAATGATGTTGAGGTAGTAGTTCGACAACATCATTTCTTATTAAATTGGCGATTGGTCACCCGTTGACCAAATTTCTAAGGGTTATCATCAGTACAGATTCCTCTATGTCTCTGGGTCAGGTACTTCTGCTCGAAGGGCTTCGCAGTTAAATGGTCCCAAGCCTCGGCCGTACACTTTGCGGCCGGG")
  tally.table <- as.matrix(read.table("tally_table_complete_solution.txt",header=TRUE,sep="\t"))
  solution <- list(f.col,l.col,tally.table)
  names(solution) <- c("F_column","L_column","tally_table")
  results <- FMindex("seq_test.fasta","",includeEndChar=FALSE)
  expect_equal(results[["F_column"]],solution[["F_column"]])
  expect_equal(results[["L_column"]],solution[["L_column"]])
  expect_equal(results[["tally_table"]],solution[["tally_table"]])
})

test_that("Testing error condition",{
  expect_error(FMindex("empty.fasta",""),"The FASTA file provided has no sequences")
})

test_that("Testing error condition",{
  expect_error(FMindex("multiple_seq.fasta",""),"The FASTA file provided contains more than one sequence")
})

test_that("Testing error condition",{
  expect_warning(FMindex("empty_sequence.fasta",""),"The sequence in the FASTA file is empty")
})
