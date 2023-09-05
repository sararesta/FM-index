#'
#' Helper function: create the i-th row of the Tally Table
#' 
#' This is a helper function that performs a specific task for the main function
#' \code{\link{getTallyTable}}. It creates the i-th row of the Tally Table
#' 
#' @param index An integer representing the index of the i-th row you want
#'  to build
#' @param l.col A DNAString object containing the L column of the FM index
#' @param alphabet A character vector containing the alphabet to consider in 
#' counting the elements
#' @return the i-th row of the Tally Table
#' @importFrom Biostrings letterFrequency
#' @importClassesFrom Biostrings DNAString
#' @importFrom Biostrings DNAString
#' @seealso{\link{getTallyTable}}

getTallyTableLine <- function(index,l.col,alphabet){
    return(Biostrings::letterFrequency(l.col[seq_len(index)],alphabet))
}

#'
#' Create the Tally Table
#' 
#' Creates the Tally Table of a given BWT of a string
#' 
#' @param l.col A DNAString containing the L column of the FM index
#' @param rowwidth Step (in term of numer of rows) for saving checkpoints of the
#' tally table. The default value is 1 which corresponds to save all the rows of
#' the tally table
#' @return The tally table of the input sequence
#' @examples
#' getTallyTable(Biostrings::DNAString("T.AACCG"))
#' getTallyTable(Biostrings::DNAString("T.AACCG"),2)
#' @export
#' @importFrom Biostrings alphabetFrequency
#' @importFrom Biostrings letterFrequency
#' @details
#' This function may raise an error if
#' \itemize{
#'     \item The argument rowwidth is higher than one
#'     \item The argument rowwidth is lower than one
#'     \item The input sequence (argument l.col) doesn't contain the termination
#'     character "."
#'     \item The input sequence (argument l.col) contains more than one 
#'     termination character "."
#'}
#' This function may raise a warning if
#' \itemize{
#'     \item The input sequence contains only the termination character
#' }
#' @md
getTallyTable <- function(l.col,rowwidth=1){
    
    if(rowwidth<1){
        stop("rowwidth must be higher than one.")
    } else if(Biostrings::letterFrequency(l.col,c("."))>1){
        stop("The input sequence contains more than one termination character")
    } else if(Biostrings::letterFrequency(l.col,c("."))==0){
        stop("The input sequence doesn't contain the termination character")
    } else if(length(l.col)==1){
        warning("The input sequence contains only the termination character")
    }
    
    indexes <- as.matrix(seq(1,length(l.col),rowwidth))
    alphabet <- names(which(
        Biostrings::alphabetFrequency(l.col,as.prob=FALSE,baseOnly=FALSE)!=0))
    alphabet <- alphabet[alphabet!="."]
    return(t(apply(indexes,1,getTallyTableLine,l.col=l.col,alphabet=alphabet)))
}