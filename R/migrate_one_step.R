#' Migrate one step
#'
#' @details
#' Migrate centerline during one time step, using the migration computed as in Howard & Knutson (1984).
#'
#' @param x x-coordinates of centerline
#' @param y y-coordinates of centerline
#' @param z z-coordinates of centerline
#' @param W channel width
#' @param kl migration rate (or erodibility) constant (m/s)
#' @param dt duration of time step (s)
#' @param k constant for calculating the exponent alpha (= 1.0)
#' @param Cf dimensionless Chezy friction factor
#' @param D channel depth
#' @param omega constant in Howard & Knutson equation (= -1.0)
#' @param gamma constant in Howard & Knutson equation (= 2.5)
#'
#' @return
#' x: new x-coordinates of centerline after migration
#' y: new y-coordinates of centerline after migration
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
#' kl = 60.0/(365*24*60*60.0)
#' Sl = 0                    # initial slope (setting this to non-zero results in instabilities in long runs)
#' channel <- generate_initial_channel(W,D,Sl,deltas,pad,n_bends)
#' k = 1.0
#' Cf = 0.03
#' omega = -1.0
#' gamma = 2.5
#' x = channel$x
#' y = channel$y
#' z = channel$z
#' derivatives_dx_dy_dz_ds_s = compute_derivatives(x,y,z)
#' ds = derivatives_dx_dy_dz_ds_s$ds
#' dt = 0.1*(365*24*60*60.0)
#' pad1 = as.integer(pad/10.0)
#'
#' migrate_one_step(x,y,z,W,kl,dt,k,Cf,D,pad,pad1,omega,gamma)

migrate_one_step <- function(x,y,z,W,kl,dt,k,Cf,D,pad,pad1,omega,gamma){

  ns = length(x)
  curv =  mapply(c, x, y, SIMPLIFY=FALSE)
  curv =  rbind(x, y)

  derivatives_dx_dy_dz_ds_s = compute_derivatives(x,y,z)
  dx = derivatives_dx_dy_dz_ds_s$dx
  dy = derivatives_dx_dy_dz_ds_s$dy
  dz = derivatives_dx_dy_dz_ds_s$dz
  ds = derivatives_dx_dy_dz_ds_s$ds
  s  = derivatives_dx_dy_dz_ds_s$s
  sinuosity = derivatives_dx_dy_dz_ds_s$s[length(derivatives_dx_dy_dz_ds_s$s)]/(x[length(x)]-x[1])
  curv = W*curv # dimensionless curvature
  R0 = kl*curv # simple linear relationship between curvature and nominal migration rate
  alpha = k*2*Cf/D # exponent for convolution function G
  R1 = compute_migration_rate(pad,ns,ds,alpha,omega,gamma,R0)
  R1 = sinuosity**(-2/3.0)*R1
  # calculate new centerline coordinates:
  dy_ds = dy[(pad1 +1):(ns-pad)]/ds[(pad1 +1):(ns-pad)]
  dx_ds = dx[(pad1 +1):(ns-pad)]/ds[(pad1 +1):(ns-pad)]
  # adjust x and y coordinates (this *is* the migration):
  x[(pad1 +1):(ns-pad)] = x[(pad1 +1):(ns-pad)] + R1[(pad1 +1):(ns-pad)]*dy_ds*dt
  y[(pad1 +1):(ns-pad)] = y[(pad1 +1):(ns-pad)] - R1[(pad1 +1):(ns-pad)]*dx_ds*dt
  return(list(x,y))

}
