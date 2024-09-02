#' Prepare data for use within the app
#'
#' @importFrom dplyr mutate
#' @importFrom lubridate ymd
#' @importFrom tibble tribble

  #markdown::mark_html("inst/www/about.md")
  # about_text <- HTML(markdown::markdownToHTML('inst/www/about.md',
  #                                             fragment.only = TRUE)
  #                    )

  initial_records <- tibble::tribble(
    ~year, ~start,       ~end,
    "2024",  "2023-12-31", "2024-02-01",
    "2025",  "2025-01-03", "2025-01-13",
    "2026",  "2026-01-02", "2026-01-12",
    "2027",  "2027-01-01", "2027-01-18",
    "2028",  "2027-12-31", "2028-01-17",
    "2029",  "2028-12-31", "2029-04-01",
    "2030",  "2030-01-04", "2030-01-14",
  )

  ericmas_data <- initial_records |>
    dplyr::mutate(
      start_date = lubridate::ymd(start),
      end_date = lubridate::ymd(end),
      number_of_days = difftime(end_date, start_date, units = "days") + 1
    )

  # Find years available in the data; used to create selection widget for years
  available_years <- as.list(unique(ericmas_data$year))
