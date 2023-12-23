#' Prepare data for use within the app
#'
#' @export

ericmas_init <- function() {
  # Get data for app
  ericmas_data <<- create_data()

  # Find years available in the data; used to create selection widget for years
  available_years <<- as.list(unique(ericmas_data$year))
}

ericmas_init()


