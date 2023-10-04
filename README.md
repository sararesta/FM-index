# R PROJECT - FM index

 * Author: Sara Resta
 * Course: Scientific Programming
 * A.A.: 2022/2023
 * Professor: Rosario Michael Piro
 * Grade: 29/30  
   Comments:
    * Description on vignette not so clear without looking at code or manual;
    * Better use DNAString as input for the FMIndex function, the user can read the FASTA file manually
      (of maybe the user has already some data in memory, your solution would require the user to write it as a file before being able to use your function)
    * Perfect compilation and Bioconductor compliance!
  
-------------------------------------------------------------
  
## Project guidelines
### Short description
Write a Perl script or an R package with a function that takes a single FASTA
sequence file (DNA sequence) as input and writes a corresponding FM Index. Implement your own
version, do not just use some external tool/library to do the job.

### Expected outcome
For any FASTA file (containing a single DNA sequence) specified by the user, the Python script or
R package should:
 1. Compute all necessary data structures of which the FM Index is composed.
 2. Write the individual FM data structures as individual files into a user-specified folder.

### Hints/Notes
For this task, a compression of the obtained FM Index is not required, but it will be evaluated
positively.

### Literature/Resources
Ben Langmead: “Introduction to the Burrows-Wheeler Transform and FM Index”.
https://www.cs.jhu.edu/~langmea/resources/bwt_fm.pdf
Paolo Ferragina and Giovanni Manzini: “Opportunistic data structures with applications”. In
Foundations of Computer Science, 2000. Proceedings. 41st Annual Symposium on, pages 390–398.
IEEE, 2000. https://people.unipmn.it/manzini/papers/focs00draft.pdf 
  
-------------------------------------------------------------

## Installing the package
In the folder "Scripts" you will find the file ```steps.sh```. You can run it on the UNIX shell  
```bash  
   sh Scripts/steps.sh
```   
It will build, check and install the package FMIndex and after that it will run BiocCheck.  
  
If you just want to install the package, run the following command:  
```bash  
R CMD INSTALL FMIndex_0.99.0.tar.gz
```

