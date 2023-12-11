#' Cycle Stats app standalone function
#'
#' Wrapper function for `shinyApp()`
#'
#' @return shiny app
#'
#' @import shiny
#'
#' @export ericmasApp
#'
ericmasApp <- function() {
  shiny::shinyApp(ui = ericmas_ui, server = ericmas_server)
}
