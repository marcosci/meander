#' Computing first derivatives
#'
#' @details
#' Function for computing first derivatives of a curve (centerline)
#'
#' @param x channel width
#' @param y channel depth
#' @param z channel gradient
#'
#' @importFrom pracma gradient
#'
#' @export
#'
#' @example
#' W = 200.0                    # channel width (m)
#' D = 16.0                     # channel depth (m)
#' pad = 100                    # padding (number of nodepoints along centerline)
#' deltas = 50.0                # sampling distance along centerline
#' n_bends = 30                 # approximate number of bends you want to model
#' Sl = 0                    # initial slope (setting this to non-zero results in instabilities in long runs)
#' channel <- generate_initial_channel(W,D,Sl,deltas,pad,n_bends)
#'
#' compute_derivatives(channel$x, channel$y, channel$z)

compute_derivatives <- function(x,y,z){

  dx = gradient(x) # first derivatives
  dy = gradient(y)
  dz = gradient(z)
  ds = sqrt(dx^2+dy^2+dz^2)
  s  = c(0, cumsum(ds[-1]))
  return(list("dx" = dx, "dy" = dy, "dz" = dz, "ds" = ds, "s" = s))

}
