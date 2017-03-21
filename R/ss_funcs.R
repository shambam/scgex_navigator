library(rgl)

#'Sets the color scale for a given vector of values
#'@param x A vector of values
#'@param colors Base colors
#'@param colsteps The number of bins required
#'@keywords color scale
color.gradient <- function(x, colors=c("green","black","red"), colsteps=50) {
  return( (colorRampPalette(colors) (colsteps) [ findInterval(x, seq(min(x),max(x), length.out=colsteps)) ] ))
}
