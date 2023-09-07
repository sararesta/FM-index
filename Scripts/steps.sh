#!/bin/bash
echo "writing documentation of the R package"
Rscript "Scripts/write_documentation.R"

echo "building the vignette of the R package"
Rscript "Scripts/produce_vignette.R"

echo "build, check and install the package"


R CMD build FMIndex
R CMD check FMIndex_0.99.0.tar.gz
R CMD INSTALL FMIndex_0.99.0.tar.gz

Rscript "Scripts/bioccheck.R"
