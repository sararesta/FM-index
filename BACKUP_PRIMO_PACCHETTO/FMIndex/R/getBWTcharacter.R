#'
#' Compute the i-th character of the BWT
#' 
#' This function computes the i-th character of the BWT of a given
#' sequence which corresponds to the i-th character in the L column.
#'  
#' @param index The position which you want to find the character
#' @param sequence The string you want to know the i-th L column character
#' @param suffixarray An integer vector containing the suffix array of the input string
#' @return A character containing the i-th character of the input sequence
getBWTcharacter <- function(index,sequence,suffixarray){
  if(suffixarray[index]>1){
    return(substr(sequence,suffixarray[index]-1,suffixarray[index]-1))
  }
  else{
    return(".")
  }
}