#'
#' Writes the FM index
#' 
#' This function writes the FM index of the DNA sequence contained in the .fasta file given in input
#'
#' @param fastafile The .fasta file containing one single DNA sequence, files containing multiple sequences are not allowed
#' @param usrpath The directory path where the user wants to save the files: it must end with '/' (you can leave it empty if you want to save the files in your working directory).
#' @param tallywidth How you want to compress the tally table. Default value=1
#' @param includeTerminationCharacter default value: true
#' @return A list containint all the data structures necessary for the FM index
#' @examples 
#' FMindex(system.file("extdata/examples/seq5.fasta",package="FMIndex"),"")
#' FMindex(system.file("extdata/examples/seq5.fasta",package="FMIndex"),"",tallywidth=1)
#' @export
#' @importFrom Biostrings readDNAStringSet
#' @importFrom utils write.table
FMindex <- function(fastafile,usrpath,tallywidth=1,includeTerminationCharacter=TRUE){
    seqset <- readDNAStringSet(fastafile,use.names=FALSE)
    sequence <- unlist(seqset)
    f.col <- getFcolumn(unlist(sequence))
    l.col <- getLcolumn(sequence)
    tally.table <- getTallyTable(l.col,tallywidth)
    
    f.col.filepath <- paste(usrpath,"F_col.txt",collapse="",sep="")
    l.col.filepath <- paste(usrpath,"L_col.txt",collapse="",sep="")
    tally.table.filepath <- paste(usrpath,"tally_table.txt",collapse="",sep="")
    
    FM <- list(f.col,l.col,tally.table)
    names(FM) <- c("F_column","L_column","tally_table")
     
    write.table(t(as.matrix(f.col)), file = f.col.filepath, sep = "\t", row.names = FALSE)
    write(as.character(l.col),file=l.col.filepath)
    write.table(tally.table, file = tally.table.filepath, sep = "\t", row.names = FALSE,col.names = TRUE)
    
    return(FM)
}