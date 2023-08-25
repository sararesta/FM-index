#' Compute the F column
#' 
#' This function gets a DNAString and gives the F column of the FM index
#' 
#' @param seq the DNAString to be analysed
#' @param includeTerminationCharacter True if you want to include the ".",
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
#' 
getFcolumn <- function(seq,includeTerminationCharacter=TRUE){
    alphabet <- names(which(
        alphabetFrequency(seq,baseOnly=FALSE,as.prob=FALSE)!=0))
    alphabet <- alphabet[alphabet!="."]
    f.col <- letterFrequency(seq,alphabet)
    if(includeTerminationCharacter==TRUE){
        f.col <- c(1,f.col)
        names(f.col)[1] <- "."
    }
    return(f.col)
}