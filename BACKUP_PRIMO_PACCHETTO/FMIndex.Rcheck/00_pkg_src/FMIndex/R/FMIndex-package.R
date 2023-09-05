#' FMIndex - Compute the FM index for a DNA sequence 
#' contained in a fasta file
#'   
#' 
#' \tabular{ll}{
#' Package: \tab FMIndex\cr
#' Type: \tab Package\cr
#' Date: \tab 2023-06-20\cr
#' License: \tab GPL (>=2)\cr
#' }
#' 
#' @details
#' The \code{FMIndex} package implements all the functions necessary to compute
#' the data structures of the FM index. The package has one main function 
#' which computes all the FM index data structures and saves them into different
#' text files (the path is specified by the user):
#' \itemize{
#'     \item F_col.txt for the F column (cont the occurrences of the unique
#'      characters)
#'     \item L_col.txt for the L column (BWT)
#'     \item suffix_array.txt for the suffix array
#'     \item tally_table.txt for the tally table
#' }
#' The functions that compute the FM index data structures are available: they
#' all take a DNAString as input and the return values are printed on the
#' console.
#' 
#' NOTE: to make the strings compatible with DNAString objects the termination
#' character used to build the BWT is "."
#' 
#' @name FMIndex-package
#' @aliases FMIndex-package FMIndex
#' @docType package
#' @author Sara Resta \[aut, cre\]\cr
#' Politecnico di Milano\cr
#' Maintainer: Sara Resta\cr
#' E-mail: <sara.resta@@mail.polimi.it>
#' 
#' @md
NULL