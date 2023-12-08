#' Title
#'
#' @return
#' @export
#' @import bslib
#' @import bsicons
#' @examples

cyclestats_ui <- function() {
  page_sidebar(
    title = "Ericmas Calculator",
    bg = "lightblue",

    sidebar = selectInput(
      inputId = "selected_years",
      label = "Select Year:",
      choices = available_years
    ),

    layout_columns(
      fill = FALSE,
      value_box(
        title = "Selected year",
        #value = scales::unit_format(unit = "mm")(means[[2]]),
        value = textOutput("number_of_rides"),
        showcase = bsicons::bs_icon("bicycle")
      ),
      value_box(
        title = "Days of Ericmas",
        value = textOutput("number_of_miles"),
        showcase = bsicons::bs_icon("speedometer2")
      )
    ),

    navset_card_pill(
      title = "",
      nav_panel("Calendar", toastui::calendarOutput("my_calendar", width = "100%", height = "600px")),
      nav_panel("About", uiOutput("about_text"))
    ),
  )
}


