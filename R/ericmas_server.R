# Define server logic

#' Title
#'
#' @param input
#' @param output
#'
#' @return
#' @export
#' @import toastui
#' @examples

ericmas_server <- function(input, output) {

  # value_box for selected year
  number_of_rides <- reactive({
    as.character(dplyr::count(activities_selected()))
  })

  # value_box for number of days
  number_of_miles <- reactive({
    as.character(sum(activities_selected()$activity_distance))
  })

  # Filter by selected year
  activities_selected <- reactive({
    activities |>
      dplyr::filter(activity_year %in% input$selected_year)
  })

  # Create entries in calendar
  my_calendar_data <- readRDS("inst/extdata/my_calendar_data.rds")

  output$my_calendar <- renderCalendar({
    calendar(my_calendar_data, navigation = TRUE, view = "month", useDetailPopup = FALSE) %>%
      cal_props(
        list(
          id = 1,
          name = "PERSO",
          color = "white",
          bgColor = "firebrick",
          borderColor = "firebrick"
        ),
        list(
          id = 2,
          name = "WORK",
          color = "white",
          bgColor = "forestgreen",
          borderColor = "forestgreen"
        )
      )
  })

  output$about_text <- renderUI({
    # HTML(markdown::markdownToHTML('inst/www/about.Rmd', fragment.only = TRUE))
    htmltools::includeMarkdown(path = 'inst/www/about.Rmd')
    })
  output$number_of_rides <- renderText(number_of_rides())
  output$number_of_rides2 <- renderText(number_of_rides())
  output$number_of_rides3 <- renderText(number_of_rides())
  output$number_of_rides4 <- renderText(number_of_rides())
  output$number_of_miles <- renderText(number_of_miles())
}


