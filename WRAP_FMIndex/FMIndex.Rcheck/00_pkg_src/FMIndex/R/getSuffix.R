#' Get the suffix
#'
#' This function gets the suffix of the string starting from a position given in input
#' 
#' @param index An integer representing the starting position of the string
#' @param sequence The sequence you want to find the suffix
#' @return The substring starting at the given position
#' @examples
#' getSuffix(2,"ACGT")
#' getSuffix(5,"ACCCAGT")
#' @export
getSuffix <- function(index,sequence){
  substr(sequence,index,nchar(sequence))
}