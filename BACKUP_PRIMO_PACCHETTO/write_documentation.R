library(devtools)
current.node=as.package("FMIndex")
load_all(current.node$path)
document(current.node)
