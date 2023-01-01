#' Compute migration rate
#'
#' @details
#' compute migration rate as weighted sum of upstream curvatures
#' @param pad padding (number of nodepoints along centerline)
#' @param ns number of points in centerline
#' @param ds distances between points in centerline
#' @param omega constant in HK model
#' @param gamma constant in HK model
#' @param R0 nominal migration rate (dimensionless curvature * migration rate constant)
#'
#' @export
#'
#' @example
#' W = 200.0                    # channel width (m)
#' D = 16.0                     # channel depth (m)
#' pad = 100                    # padding (number of nodepoints along centerline)
#' deltas = 50.0                # sampling distance along centerline
#' n_bends = 30                 # approximate number of bends you want to model
#' Sl = 0                       # initial slope (setting this to non-zero results in instabilities in long runs)
#' kl = 60.0/(365*24*60*60.0)
#' channel <- generate_initial_channel(W,D,Sl,deltas,pad,n_bends)
#'
#' x = channel$x
#' y = channel$y
#' z = channel$z
#'
#' derivatives_dx_dy_dz_ds_s = compute_derivatives(x,y,z)
#' ds = derivatives_dx_dy_dz_ds_s$ds
#'
#' alpha = 0.00375
#' gamma = 2.5
#' omega = -1
#'
#' curv =  mapply(c, x, y, SIMPLIFY=FALSE)
#' curv =  rbind(x, y)
#' curv = W*curv # dimensionless curvature
#' R0 = kl*curv
#' compute_migration_rate(pad,ns,ds,alpha,omega,gamma,R0)


compute_migration_rate <- function(pad,ns,ds,alpha,omega,gamma,R0){

  R1 = vector(length = ns) # preallocate adjusted channel migration rate
  pad1 = as.integer(pad/10.0) # padding at upstream end can be shorter than padding on downstream end
  if (pad1<5) pad1 = 5
  for (i in seq(pad1,ns-pad)){

    #si2 = np.hstack((np.array([0]),np.cumsum(ds[i-1::-1])))  # distance along centerline, backwards from current point
    si2 = c(0, cumsum(ds[i:1]))
    G = exp(-alpha*si2) # convolution vector

    R1[i] = omega*R0[i] + gamma*suppressWarnings(sum(R0[i:1]*G))/ sum(G) # main equation


  }

  return(R1)
}

