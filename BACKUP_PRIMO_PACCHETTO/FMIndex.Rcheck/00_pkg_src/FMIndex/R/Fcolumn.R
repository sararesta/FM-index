#' Compute the F column
#' 
#' This function gets a DNAString and gives the F column of the FM index
#' 
#' @param seq the DNAString to be analysed
#' @param includeEndChar True if you want to include the ".",
#'  false if you want to exclude it. Default value:TRUE
#' @return An integer vector with all the frequences 
#' in the dna sequence given in input
#' @examples
#' getFcolumn(Biostrings::DNAString("ACCT"))
#' 
#' @export
#' @importFrom Biostrings DNAString
#' @importFrom Biostrings alphabetFrequency
#' @importFrom Biostrings letterFrequency
#' @importClassesFrom Biostrings DNAString
#' @details
#' This function may raise a warning if
#' \itemize{
#'     \item The provided sequence is empty
#' }
#' @md
getFcolumn <- function(seq,includeEndChar=TRUE){
    if(length(seq)<1){
        warning("The input sequence is empty.")
    }
    alphabet <- names(which(
        Biostrings::alphabetFrequency(seq,baseOnly=FALSE,as.prob=FALSE)!=0))
    alphabet <- alphabet[alphabet!="."]
    f.col <- Biostrings::letterFrequency(seq,alphabet)
    if(includeEndChar==TRUE){
        f.col <- c(1,f.col)
        names(f.col)[1] <- "."
    }
    return(f.col)
}