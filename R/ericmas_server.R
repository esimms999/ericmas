# Define server logic

#' Title
#'
#' @importFrom dplyr filter
# #' @importFrom htmltools includeMarkdown includeHTML
#' @importFrom shinyjs hide show

ericmas_server <- function(input, output) {

  # Filter by selected year
  selected_year <- reactive({
    ericmas_data |>
      dplyr::filter(year %in% input$selected_year)
  })

  # value_box for selected year
  year_selected <- reactive({
    selected_year()$year
  })

  # value_box for start date
  ericmas_start <- reactive({
    as.character(selected_year()$start_date)
  })

  # value_box for end date
  ericmas_end <- reactive({
    as.character(selected_year()$end_date)
  })

  # value_box for number of gifts
  ericmas_gifts <- reactive({
    as.character(selected_year()$number_of_days)
  })

  output$year_selected <- renderText(year_selected())
  output$ericmas_start <- renderText(ericmas_start())
  output$ericmas_end <- renderText(ericmas_end())
  output$ericmas_gifts <- renderText(ericmas_gifts())

  #output$about_text <- renderUI({
    #htmltools::includeHTML(path = 'inst/www/about.html')
    #htmltools::includeMarkdown(path = 'inst/www/about.Rmd')
   # })
}


