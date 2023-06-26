#' Compute the L column of a sequence
#' 
#' This function gets a character and gives the F column of the FM index
#' 
#' @param sequence the string to be analysed
#' @return A DNAString containing the L column of the FM index
#' @examples
#' library(Biostrings)
#' getLcolumn(DNAString("ACGT"))
#' getLcolumn(DNAString("AACCGT"))
#' @export
#' @importFrom Biostrings DNAString
#' @importClassesFrom Biostrings DNAString
getLcolumn <- function(sequence){
  sequence <- paste(as.character(sequence),".",sep="")
  indexes <- as.matrix(seq(seq_len(nchar(sequence))))
  suffixes <- apply(indexes,1,getSuffix,sequence=sequence)
  names(suffixes) <- indexes
  suffix.array <- as.integer(names(sort(suffixes)))
  bwt <- apply(indexes,1,getBWTcharacter,sequence=sequence,suffixarray=suffix.array)
  return(DNAString(paste(bwt,collapse="")))
}