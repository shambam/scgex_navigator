library(cellrangerRkit)
library(Biobase)
library(biomaRt)

#'Class definition of the SCDataSet
#' @exportClass SCDataSet
setClass("SCDataSet",contains="ExpressionSet",
  slots=c(DDRtree_coods="matrix",
          TSNE_coods="matrix"))

#'Extracts the components need from a cellRanger aggrergated file
#'@param path A path to the cellranger output folder
#'@param build The version of the build, default is "mm10", alternative is "hg38"
#'@keywords cellranger extract
#'@export extract_from_cellranger
extract_from_cellranger <- function(path,build=c("mm10","hg38")){

  cro <- load_cellranger_matrix(path,build)
  exprdata <- log2(1+exprs(cro))
  split_cellid <- as.numeric(unlist(strsplit(as.vector(pData(cro)[,1]),"-")))
  groups <- split_cellID[seq(2,length(split_cellID),by=2)]
  featureData <- fData(cro)

  ret <- list(exprs=exprdata,fdata=featureData,groups=groups)
  ret

}
