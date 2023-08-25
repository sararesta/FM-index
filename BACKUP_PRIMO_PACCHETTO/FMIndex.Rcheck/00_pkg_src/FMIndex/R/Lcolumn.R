#' Compute the L column of a sequence
#' 
#' This function gets a character and gives the F column of the FM index
#' 
#' @param sequence the string to be analysed
#' @return A DNAString containing the L column of the FM index
#' @examples
#' getLcolumn(Biostrings::DNAString("ACGT"))
#' getLcolumn(Biostrings::DNAString("AACCGT"))
#' @export
#' @importFrom Biostrings DNAString
#' @importClassesFrom Biostrings DNAString
getLcolumn <- function(sequence){
    sequence <- paste(as.character(sequence),".",sep="")
    indexes <- as.matrix(seq(seq_len(nchar(sequence))))
    suffixes <- apply(indexes,1,getSuffix,sequence=sequence)
    names(suffixes) <- indexes
    suffix.array <- as.integer(names(sort(suffixes)))
    bwt <- apply(indexes,1,getBWTcharacter,
                sequence=sequence,suffixarray=suffix.array)
    return(DNAString(paste(bwt,collapse="")))
}

#' Get the suffix
#'
#' This function gets the suffix of the string starting from a position given
#'  in input
#' 
#' @param index An integer representing the starting position of the string
#' @param sequence The sequence you want to find the suffix
#' @return The substring starting at the given position
getSuffix <- function(index,sequence){
    substr(sequence,index,nchar(sequence))
}

#'
#' Compute the i-th character of the BWT
#' 
#' This function computes the i-th character of the BWT of a given
#' sequence which corresponds to the i-th character in the L column.
#'  
#' @param index The position which you want to find the character
#' @param sequence The string you want to know the i-th L column character
#' @param suffixarray An integer vector containing the suffix array of the 
#' input string
#' @return A character containing the i-th character of the input sequence
getBWTcharacter <- function(index,sequence,suffixarray){
    if(suffixarray[index]>1){
        return(substr(sequence,suffixarray[index]-1,suffixarray[index]-1))
    }
    else{
        return(".")
    }
}