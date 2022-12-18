#' Generate Initial Channel
#'
#' @param W channel width
#' @param D channel depth
#' @param Sl channel gradient
#' @param deltas distance between nodes on centerline
#' @param pad padding (number of nodepoints along centerline)
#' @param n_bends approximate number of bends to be simulated
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

generate_initial_channel <- function(W,
                                     D,
                                     Sl,
                                     deltas,
                                     pad,
                                     n_bends) {

  # length of noisy part of initial centerline
  noisy_len = n_bends*10*W/2.0

  # padding at upstream end can be shorter than padding on downstream end
  pad1 = as.integer(pad/10.0)
  if(pad1<5L) pad1 = 5

  # x coordinate
  x = seq(0, noisy_len+(pad+pad1)*deltas, length.out = as.integer(noisy_len/deltas+pad+pad1)+1)
  # y coordinate
  y = 10L * (2L * runif(as.integer(noisy_len/deltas) +1) - 1)
  y = c(rep(0, pad1), y, rep(0, pad))

  # z coordinate
  deltaz = Sl * deltas*(length(x)-1)
  z = rev(seq(0, deltaz, length.out = length(x)))

  # return Channel object
  return(Channel$new(x,y,z,W,D))
}
