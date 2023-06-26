#'
#' Create the i-th row of the Tally Table
#'
#' This function creates the i-th row of the Tally Table
#' 
#' @param index An integer representing the index of the i-th row you want to build
#' @param l.col A DNAString object containing the L column of the FM index
#' @param alphabet A character vector containing the alphabet to consider in counting the elements
#' @return the i-th row of the Tally Table
#' @importFrom Biostrings letterFrequency
#' @importClassesFrom Biostrings DNAString
#' @importFrom Biostrings DNAString

getTallyTableLine <- function(index,l.col,alphabet){
  return(letterFrequency(l.col[seq_len(index)],alphabet))
}