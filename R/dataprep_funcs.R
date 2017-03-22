library(cellrangerRkit)
library(Biobase)
library(biomaRt)

#'Plots a £d rgl plot higlighting selected cells
#'@param proj A 3-column matrix of coordinates
#'@param ind The rows requiring highlighting
#'@keywords 3D scatter highlighted cells

setClass("SCDataSet",contains="ExpressionSet",
  slots=c(DDRtree_coods="matrix",
          TSNE_coods="matrix"))

#'Extracts the components need from a cellRanger aggrergated file
#'@param path A path to the cellranger output folder
#'@param build The version of the build, default is "mm10", alternative is "hg38"
#'@keywords cellranger extract
extract_from_cellranger <- function(path,build=c("mm10","hg38")){

  cro <- load_cellranger_matrix(path,build)
  split_cellid <- as.numeric(unlist(strsplit(as.vector(pData(cro)[,1]),"-")))
  groups <- split_cellID[seq(2,length(split_cellID),by=2)]

}
