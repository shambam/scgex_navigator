#'Sets the color scale for a given vector of values
#'@param x A vector of values
#'@param colors Base colors
#'@param colsteps The number of bins required
#'@keywords color scale
#'@export color_gradient
color_gradient <- function(x, colors=c("green","black","red"), colsteps=50) {
  return( (colorRampPalette(colors) (colsteps) [ findInterval(x, seq(min(x),max(x), length.out=colsteps)) ] ))
}

#'Plots a 3d rgl plot higlighting selected cells
#'@param proj A 3-column matrix of coordinates
#'@param ind The rows requiring highlighting
#'@keywords 3D scatter highlighted cells
#'@export rgl_points_hl_selected
rgl_points_hl_selected <- function(proj,ind){

    rgl.points(proj[-ind,],col="black")
    rgl.points(proj[ind,],col="orange")
    print(proj[1:10,1:10])
}
