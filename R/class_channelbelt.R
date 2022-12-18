#' class for Channel objects
#' @importFrom R6 R6Class
ChannelBelt <- R6::R6Class("Channel",
                       public = list(
                         channels = NULL, # list of Channel objects
                         cutoffs = NULL, # list of Cutoff objects
                         cl_times = NULL, # list of ages of Channel objects (in years)
                         cutoff_times = NULL, # list of ages of Cutoff objects
                         initialize = function(channels = NA,
                                               cutoffs = NA,
                                               cl_times = NA,
                                               cutoff_times = NA,
                                               initialize = NA) {
                           self$channels <- channels
                           self$cutoffs <- cutoffs
                           self$cl_times <- cl_times
                           self$cutoff_times <- cutoff_times
                           self$initialize <- initialize
                           # self$report()
                         },
                         report = function() {
                           cli_alert_info(c(
                             bgX("X coordinate(s) of centerline: ", crayon::underline$bold(min(self$x)), " ... ", crayon::underline$bold(max(self$x)))))
                           cli_alert_info(c(
                             bgY("Y coordinate(s) of centerline: ", crayon::underline$bold(min(self$y)), " ... ", crayon::underline$bold(max(self$y)))))
                           cli_alert_info(c(
                             bgZ("Z coordinate(s) of centerline: ", crayon::underline$bold(min(self$z)), " ... ", crayon::underline$bold(max(self$z)))))
                           cli_alert_info(c(
                             bgW("Channel width: ", crayon::underline$bold(self$W))))
                           cli_alert_info(c(
                             bgD("Channel depth: ", crayon::underline$bold(self$D))))
                         }
                       )
)

