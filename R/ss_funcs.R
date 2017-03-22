library(rgl)
library(cellrangerRkit)
library(Biobase)

setClass("SCDataSet",contains="ExpressionSet",
  slots=c(DDRtree_coods="matrix",
          TSNE_coods="matrix"))

#'Sets the color scale for a given vector of values
#'@param x A vector of values
#'@param colors Base colors
#'@param colsteps The number of bins required
#'@keywords color scale
color.gradient <- function(x, colors=c("green","black","red"), colsteps=50) {
  return( (colorRampPalette(colors) (colsteps) [ findInterval(x, seq(min(x),max(x), length.out=colsteps)) ] ))
}


#'Plots a £d rgl plot higlighting selected cells
#'@param proj A 3-column matrix of coordinates
#'@param ind The rows requiring highlighting
#'@keywords 3D scatter highlighted cells
rgl.points.sel <- function(proj,ind){

    rgl.points(proj[-ind,],col="black")
    rgl.points(proj[ind,],col="orange")
}
