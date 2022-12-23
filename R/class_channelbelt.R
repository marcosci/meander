#' #' class for Channel objects
#' #' @importFrom R6 R6Class
#' ChannelBelt <- R6::R6Class("Channel",
#'                        public = list(
#'                          #' @field channel list of Channel objects
#'                          channels = NULL,
#'                          #' @field cutoffs list of Cutoff objects
#'                          cutoffs = NULL,
#'                          #' @field cl_times list of ages of Channel objects (in years)
#'                          cl_times = NULL,
#'                          #' @field cutoff_times list of ages of Cutoff objects
#'                          cutoff_times = NULL,
#'                          #' @description
#'                          #' Creates a new instance of the ChannelBelt [R6][R6::R6Class] class.
#'                          #'
#'                          #' @param channels (`list()`)\cr
#'                          #'   Channel objects
#'                          #'
#'                          #' @param cutoffs (`list()`)\cr
#'                          #'   Cutoff objects
#'                          #'
#'                          #' @param cl_times (`list()`)\cr
#'                          #'   ages of Channel objects
#'                          #'
#'                          #' @param cutoff_times (`list()`)\cr
#'                          #'   ages of Cutoff objects
#'                          #'
#'                          initialize = function(channels = NA,
#'                                                cutoffs = NA,
#'                                                cl_times = NA,
#'                                                cutoff_times = NA) {
#'                            self$channels <- channels
#'                            self$cutoffs <- cutoffs
#'                            self$cl_times <- cl_times
#'                            self$cutoff_times <- cutoff_times
#'                          },
#'                          #' @description
#'                          #' Method for computing migration rates along channel centerlines and moving the centerlines accordingly.
#'                          #'
#'                          #' @param nit (`list()`)\cr
#'                          #'   number of iterations
#'                          #'
#'                          #' @param saved_ts (`list()`)\cr
#'                          #'   which time steps will be saved; e.g., if saved_ts = 10, every tenth time step will be saved
#'                          #'
#'                          #' @param deltas (`list()`)\cr
#'                          #'   distance between nodes on centerline
#'                          #'
#'                          #' @param pad (`list()`)\cr
#'                          #'  padding (number of nodepoints along centerline)
#'                          #'
#'                          #' @param crdist (`list()`)\cr
#'                          #'  threshold distance at which cutoffs occur
#'                          #'
#'                          #' @param depths (`list()`)\cr
#'                          #'  array of channel depths (can very across iterations)
#'                          #'
#'                          #' @param Cf (`list()`)\cr
#'                          #'  array of dimensionless Chezy friction factors (can vary across iterations)
#'                          #'
#'                          #' @param kl (`list()`)\cr
#'                          #'  migration rate constant (m/s)
#'                          #'
#'                          #' @param kv (`list()`)\cr
#'                          #'  vertical slope-dependent erosion rate constant (m/s)
#'                          #'
#'                          #' @param dt (`list()`)\cr
#'                          #'  time step (s)
#'                          #'
#'                          #' @param dens (`list()`)\cr
#'                          #'  density of fluid (kg/m3)
#'                          #'
#'                          #' @param t1 (`list()`)\cr
#'                          #'  time step when incision starts
#'                          #'
#'                          #' @param t2 (`list()`)\cr
#'                          #'  time step when lateral migration starts
#'                          #'
#'                          #' @param t3 (`list()`)\cr
#'                          #'  time step when aggradation starts
#'                          #'
#'                          #' @param aggr_factor (`list()`)\cr
#'                          #'  : aggradation factor
#'                          #'
#'                          #' @param D (`list()`)\cr
#'                          #'  channel depth (m)
#'                          #'
#'                          #' @importFrom pracma gradient
#'                          migrate = function(self, nit, saved_ts, deltas, pad, crdist, depths, Cfs, kl, kv, dt, dens, t1, t2, t3, aggr_factor) {
#'                            channel = self.channels[length(self.channels)] # first channel is the same as last channel of input
#'                            x = channel.x
#'                            y = channel.y
#'                            z = channel.z
#'                            W = channel.W
#'                            D = channel.D
#'                            k = 1.0 # constant in HK equation
#'                            xc = c() # initialize cutoff coordinates
#'
#'                            # determine age of last channel:
#'                            if (len(self.cl_times)>0){
#'                              last_cl_time = self.cl_times[-1]
#'                            } else {
#'                              last_cl_time = 0
#'                            }
#'
#'
#'                            derivatives_dx_dy_dz_ds_s = compute_derivatives(x,y,z)
#'
#'                            slope = gradient(z)/ds
#'                            # padding at the beginning can be shorter than padding at the downstream end:
#'                            pad1 = as.integer(pad/10.0)
#'                            if(pad1<5){
#'                              pad1 = 5
#'                            }
#'
#'                            omega = -1.0 # constant in migration rate calculation (Howard and Knutson, 1984)
#'                            gamma = 2.5 # from Ikeda et al., 1981 and Howard and Knutson, 1984
#'
#'                            for (itn in seq_len(nit)){ # main loop
#'                              D = depths[itn]
#'                            }
#'
#'                            Cf = Cfs[itn]
#'
#'
#'                            #x, y = migrate_one_step(x,y,z,W,kl,dt,k,Cf,D,pad,pad1,omega,gamma)
#'
#'                          }
#'                        )
#' )
#'
