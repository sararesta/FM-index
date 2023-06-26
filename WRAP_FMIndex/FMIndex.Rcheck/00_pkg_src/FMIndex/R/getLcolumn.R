#' Compute the L column of a sequence
#' 
#' This function gets a character and gives the F column of the FM index
#' 
#' @param sequence the string to be analysed
#' @return A sting containing the L column of the FM index
#' @examples 
#' getLcolumn("ACGT")
#' getLcolumn("AACCGT")
#' @export
#' @importClassesFrom Biostrings DNAString
#' @importFrom Biostrings DNAString
getLcolumn <- function(sequence){
  indexes <- as.matrix(seq(1:nchar(sequence)))
  suffixes <- apply(indexes,1,getSuffix,sequence=sequence)
  names(suffixes) <- indexes
  suffix.array <- as.integer(names(sort(suffixes)))
  bwt <- apply(indexes,1,getBWTcharacter,sequence=sequence,suffixarray=suffix.array)
  return(DNAString(paste(bwt,collapse="")))
}