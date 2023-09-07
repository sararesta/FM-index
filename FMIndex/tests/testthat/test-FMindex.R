test_that("Computing the FM index of a DNA sequence contained ina a fasta file",{
    f.col <- c(1,56,56,57,71)
    names(f.col) <- c(".","A","C","G","T")
    l.col <- Biostrings::DNAString("AGTTGACATTGTATATTGGCGAACCTACCATAG.ACCGCCATGCTATCGCAGTCGAATGATGTTGAGGTAGTAGTTCGACAACATCATTTCTTATTAAATTGGCGATTGGTCACCCGTTGACCAAATTTCTAAGGGTTATCATCAGTACAGATTCCTCTATGTCTCTGGGTCAGGTACTTCTGCTCGAAGGGCTTCGCAGTTAAATGGTCCCAAGCCTCGGCCGTACACTTTGCGGCCGGG")
    suffix.array <- c(241,240,25,14,203,26,236,15,84,115,19,209,204,81,27,77,88,107,102,175,199,237,16,109,68,142,85,64,43,116,92,20,216,1,210,172,161,218,104,133,205,181,112,72,59,82,75,169,166,177,28,3,124,53,212,78,89,235,174,108,67,63,42,171,160,103,132,71,168,176,52,226,200,163,190,152,227,220,238,201,17,110,164,69,46,191,143,187,149,119,153,97,12,86,179,122,65,44,117,10,129,49,136,228,38,93,30,5,139,56,126,221,21,239,202,18,106,101,198,215,217,111,165,2,211,173,62,159,131,70,51,162,219,48,135,37,138,55,105,214,47,134,36,192,206,193,230,182,144,113,207,73,40,224,188,150,95,120,196,60,34,194,32,154,7,98,156,231,183,145,24,13,83,114,208,80,76,87,141,91,180,58,74,123,234,66,41,170,167,225,189,151,45,186,148,118,96,11,178,121,9,128,29,4,125,100,197,61,158,130,50,137,54,213,35,229,39,223,94,195,33,31,6,155,23,79,140,90,57,233,185,147,8,127,99,157,222,22,232,184,146)
    tally.table <- as.matrix(read.table("tally_table_complete_solution.txt",header=TRUE,sep="\t"))
    solution <- list(f.col,l.col,suffix.array,tally.table)
    names(solution) <- c("F_column","L_column","suffix_array","tally_table")
    results <- FMindex("seq_test.fasta","")
    expect_equal(results[["F_column"]],solution[["F_column"]])
    expect_equal(results[["L_column"]],solution[["L_column"]])
    expect_equal(results[["suffix_array"]],solution[["suffix_array"]])
    expect_equal(results[["tally_table"]],solution[["tally_table"]])
})

test_that("Computing the FM index of a DNA sequence contained ina a fasta file, don't include end character in the F column",{
  f.col <- c(56,56,57,71)
  names(f.col) <- c("A","C","G","T")
  l.col <- Biostrings::DNAString("AGTTGACATTGTATATTGGCGAACCTACCATAG.ACCGCCATGCTATCGCAGTCGAATGATGTTGAGGTAGTAGTTCGACAACATCATTTCTTATTAAATTGGCGATTGGTCACCCGTTGACCAAATTTCTAAGGGTTATCATCAGTACAGATTCCTCTATGTCTCTGGGTCAGGTACTTCTGCTCGAAGGGCTTCGCAGTTAAATGGTCCCAAGCCTCGGCCGTACACTTTGCGGCCGGG")
  suffix.array <- c(241,240,25,14,203,26,236,15,84,115,19,209,204,81,27,77,88,107,102,175,199,237,16,109,68,142,85,64,43,116,92,20,216,1,210,172,161,218,104,133,205,181,112,72,59,82,75,169,166,177,28,3,124,53,212,78,89,235,174,108,67,63,42,171,160,103,132,71,168,176,52,226,200,163,190,152,227,220,238,201,17,110,164,69,46,191,143,187,149,119,153,97,12,86,179,122,65,44,117,10,129,49,136,228,38,93,30,5,139,56,126,221,21,239,202,18,106,101,198,215,217,111,165,2,211,173,62,159,131,70,51,162,219,48,135,37,138,55,105,214,47,134,36,192,206,193,230,182,144,113,207,73,40,224,188,150,95,120,196,60,34,194,32,154,7,98,156,231,183,145,24,13,83,114,208,80,76,87,141,91,180,58,74,123,234,66,41,170,167,225,189,151,45,186,148,118,96,11,178,121,9,128,29,4,125,100,197,61,158,130,50,137,54,213,35,229,39,223,94,195,33,31,6,155,23,79,140,90,57,233,185,147,8,127,99,157,222,22,232,184,146)
  tally.table <- as.matrix(read.table("tally_table_complete_solution.txt",header=TRUE,sep="\t"))
  solution <- list(f.col,l.col,suffix.array,tally.table)
  names(solution) <- c("F_column","L_column","suffix_array","tally_table")
  results <- FMindex("seq_test.fasta","",includeEndChar=FALSE)
  expect_equal(results[["F_column"]],solution[["F_column"]])
  expect_equal(results[["L_column"]],solution[["L_column"]])
  expect_equal(results[["suffix_array"]],solution[["suffix_array"]])
  expect_equal(results[["tally_table"]],solution[["tally_table"]])
})

test_that("Computing the FM index of a DNA sequence contained in a DNAString",{
  f.col <- c(3,1,1,2)
  names(f.col) <- c("A","C","G","T")
  l.col <- Biostrings::DNAString("TC.AATGA")
  suffix.array <- c(8,3,1,4,2,6,7,5)
  tally.table <- matrix(c(0,0,0,1,
                          0,1,0,1,
                          0,1,0,1,
                          1,1,0,1,
                          2,1,0,1,
                          2,1,0,2,
                          2,1,1,2,
                          3,1,1,2),byrow=TRUE,nrow=8,ncol=4)
  colnames(tally.table) <- c("A","C","G","T")
  solution <- list(f.col,l.col,suffix.array,tally.table)
  names(solution) <- c("F_column","L_column","suffix_array","tally_table")
  results <- FMindex(Biostrings::DNAString("ACAATGT"),"",includeEndChar=FALSE)
  expect_equal(results[["F_column"]],solution[["F_column"]])
  expect_equal(results[["L_column"]],solution[["L_column"]])
  expect_equal(results[["suffix_array"]],solution[["suffix_array"]])
  expect_equal(results[["tally_table"]],solution[["tally_table"]])
})

test_that("Testing error condition",{
  expect_error(FMindex("empty.fasta",""),"The FASTA file provided has no sequences")
})

test_that("Testing error condition",{
  expect_error(FMindex("multiple_seq.fasta",""),"The FASTA file provided contains more than one sequence")
})

test_that("Testing error condition",{
  expect_error(FMindex("ACGT",""),"The input provided is neither a FASTA file nor a DNAString")
})
