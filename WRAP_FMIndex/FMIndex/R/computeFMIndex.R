#'
#' Writes the FM index
#' 
#' This function writes the FM index of the DNA sequence contained in the .fasta file given in input
#'
#' @param fastafile The .fasta file containing one single DNA sequence, files containing multiple sequences are not allowed
#' @param usrpath The path where the user wants to save the files.
#' @param tallywidth How you want to compress the tally table. Default value=1
#' @param includeTerminationCharacter default value: true
#' @export
#' @importFrom Biostrings readDNAStringSet
#' @importFrom utils write.table
#' @importFrom Biostrings alphabetFrequency
#' @importFrom Biostrings letterFrequency
#' @examples
#' computeFMIndex(system.file("extdata/seq5.fasta",package="FMIndex"),"test01.txt")
#' computeFMIndex(system.file("extdata/seq5.fasta",package="FMIndex"),"test02.txt",tallywidth=1)
computeFMIndex <- function(fastafile,usrpath,tallywidth=1,includeTerminationCharacter=TRUE){
  seqset <- readDNAStringSet(fastafile,use.names=FALSE)
  sequence <- unlist(seqset)
  alphabet <- names(which(alphabetFrequency(sequence,baseOnly=FALSE,as.prob=FALSE)!=0))
  
  f.col <- letterFrequency(sequence,alphabet)
  if(includeTerminationCharacter==TRUE){
    f.col <- c(1,f.col)
    names(f.col)[1] <- "."
  }
  l.col <- getLcolumn(paste(as.character(sequence),".",sep=""))
  
  indexes <- as.matrix(seq(1,length(sequence)+1,tallywidth))
  tally.table <- t(apply(indexes,1,function(x){letterFrequency(l.col[1:x],alphabet)}))
  write.table(t(as.matrix(f.col)), file = usrpath, sep = "\t", row.names = FALSE)
  write(as.character(l.col),file=usrpath,append=TRUE)
  write.table(tally.table, file = usrpath, sep = "\t", row.names = FALSE,col.names = TRUE,append=TRUE)
}

system.file()