#'
#' Create the Tally Table
#' 
#' Creates the Tally Table of a given BWT of a string
#' 
#' @param l.col A DNAString containing the L column of the FM index
#' @param rowwidth Step for saving rows of the tally table. The default value is 1 which corresponds to save all the rows of the tally table
#' @return The tally table of the input sequence
#' @examples
#' getTallyTable(Biostrings::DNAString("T.AACCG"))
#' getTallyTable(Biostrings::DNAString("T.AACCG"),2)
#' @export
#' @importFrom Biostrings alphabetFrequency
getTallyTable <- function(l.col,rowwidth=1){
  indexes <- as.matrix(seq(1,length(l.col),rowwidth))
  alphabet <- names(which(alphabetFrequency(l.col,as.prob=FALSE,baseOnly=FALSE)!=0))
  alphabet <- alphabet[alphabet!="."]
  return(t(apply(indexes,1,getTallyTableLine,l.col=l.col,alphabet=alphabet)))
}
