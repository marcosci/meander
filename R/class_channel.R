#' class for Channel objects
#' @importFrom R6 R6Class
Channel <- R6Class("Channel",
                  public = list(
                    x = NULL, # x-coordinate of centerline
                    y = NULL, # y-coordinate of centerline
                    z = NULL, # z-coordinate of centerline
                    W = NULL, # channel width
                    D = NULL, # channel depth,
                    initialize = function(x = NA,
                                          y = NA,
                                          z = NA,
                                          W = NA,
                                          D = NA) {
                      self$x <- x
                      self$y <- y
                      self$z <- z
                      self$W <- W
                      self$D <- D
                      self$report()
                    },
                    report = function() {
                      cli_alert_info(c(
                        "X coordinate(s) of centerline: ", blue$underline$bold(min(self$x)), " ... ", max(self$x)))
                      cli_alert_info(c(
                        "Y coordinate(s) of centerline: ", min(self$y), " ... ", max(self$y)))
                      cli_alert_info(c(
                        "Z coordinate(s) of centerline: ", min(self$z), " ... ", max(self$z)))
                      cli_alert_info(c(
                        "Channel width: ", self$W))
                      cli_alert_info(c(
                        "Channel depth: ", self$D))
                    }
                  )
)

channel <- Channel$new(1,2,3,4,5)
channel
