#' Define user interface
#' @import bslib
#' @import bsicons
#' @importFrom fs dir_tree
#' @import shiny
#' @importFrom htmltools includeHTML includeMarkdown tags

ericmas_ui <- function() {

  # addResourcePath(
  #   prefix = 'www',
  #   directoryPath = system.file('www', package = 'ericmas'))

  fs::dir_tree(fs::path_package(package = "ericmas"))
  cat(getwd())

  page_sidebar(
    title = "Ericmas Calculator v0.8",
    bg = "lightblue",
    open = "closed",
    fillable = FALSE,
    fluid = FALSE,
    collapsible = FALSE,

    sidebar = selectInput(
      inputId = "selected_year",
      label = "Select Year:",
      choices = available_years,
      selected = "2024",
      multiple = FALSE
    ),

    navset_card_pill(
      title = "",
      nav_panel("Calculator",
                layout_columns(
                  fill = FALSE,
                  value_box(
                    title = "Year",
                    value = textOutput("year_selected"),
                    color = "blue",                       # Does not seem to work :(
                    showcase = bsicons::bs_icon("calendar")
                  ),
                  value_box(
                    title = "Starts at sundown",
                    value = textOutput("ericmas_start"),
                    showcase = bsicons::bs_icon("sunset")
                  ),
                  value_box(
                    title = "Ends at sunrise",
                    value = textOutput("ericmas_end"),
                    showcase = bsicons::bs_icon("sunrise")
                  ),
                  value_box(
                    title = "Gifts required",
                    value = textOutput("ericmas_gifts"),
                    showcase = bsicons::bs_icon("gift")
                    ),
                  )
                ),
      # nav_panel("About", htmltools::includeHTML(path = 'inst/www/about.html'))
      nav_panel("About", uiOutput("about_text"))

      #nav_panel("About", htmltools::includeMarkdown("inst/www/about.md"))

      # nav_panel("About", shiny::tags$iframe(
      #   src="./inst/www/about.html"
      #   )
      # )
    )
    )
}


