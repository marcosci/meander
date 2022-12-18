#' class for Channel objects
#' @importFrom R6 R6Class
Channel <- R6::R6Class("Channel",
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

