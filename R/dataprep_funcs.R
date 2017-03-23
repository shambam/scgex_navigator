#'Class definition of the SCDataSet
#' @exportClass SCDataSet
setClass("SCDataSet",contains="ExpressionSet",
  slots=c(DDRtree_coods="matrix",
          TSNE_coods="matrix"))

#'Extracts the components need from a cellRanger aggrergated file
#'@param path A path to the cellranger output folder
#'@param build The version of the build, default is "mm10", alternative is "hg38"
#'@keywords cellranger extract
#'@description lkjfl;ksjd lksjdf lksdfj lksd fjslkdf slkdjf lskjd
#'@export extract_from_cellranger
extract_from_cellranger <- function(path,build=c("mm10","hg38")){

  cro <- load_cellranger_matrix(path,build)
  #exprdata <- log2(1+exprs(cro))
  exprdata <- exprs(cro)
  split_cellid <- as.numeric(unlist(strsplit(as.vector(pData(cro)[,1]),"-")))
  groups <- split_cellid[seq(2,length(split_cellid),by=2)]
  featureData <- fData(cro)
  colnames(featureData) <- c("ensemble","gene")

  ret <- list(exprs=exprdata,fdata=featureData,groups=groups)
  ret

}


#'Converts and object from  extract_from_cellranger and puts it into monocle CellDataSet format.
#'@param An object from extract_from_cellranger
#'@keywords cellranger monocle
#'@export cellranger2monocle
cellranger2monocle <- function(cellrext){
  pd <- cbind(colnames(cellrext),cellrext$groups)
  colnames(pd) <- c("CellID","Expt")

  pdata <-  new("AnnotatedDataFrame", data = as.data.frame(pd))
  fdata <- new("AnnotatedDataFrame", data = as.data.frame(cellrext$featureData))

  cdco <- newCellDataSet(as(as.matrix(cellrext$exprdata), "sparseMatrix"),
    phenoData = pdata,
    featureData = fdata,
    lowerDetectionLimit=1,
    expressionFamily=negbinomial.size())

    cdco

}
