library("tidyverse")
library("toastui")
my_calendar_data <- data.frame(
  # calendarID = c("1", "1", "3", "4"),
  title = c("Ericmas Season", "Ericmas Day", "Starts at Sundown", "Ends at Sunrise"),
  start = c("2024-01-01 00:00", "2024-01-08 00:00", "2023-12-31 17:00", "2024-02-01 00:00"),
  end = c("2024-01-31 23:59", "2024-01-08 23:59", "2023-12-31 23:59", "2024-02-01 06:00"),
  category = c("allday", "allday", "allday", "allday"),
  color = c("", "blue", "", "")
)

calendar(view = "month", defaultDate = "2024-01-08", useDetailPopup = FALSE, navigation = TRUE) %>%
  cal_schedules(
    my_calendar_data
  )

abc <- tibble::tribble(
~year, ~title,              ~start,             ~end,               ~category,
2024,  "Ericmas Season",    "2024-01-01 00:00", "2024-01-31 23:59", "allday",
2024,  "Starts at Sundown", "2023-12-31 17:00", "2023-12-31 23:59", "allday",
2024,  "Ends at Sunrise",   "2024-02-01 00:00", "2024-02-01 06:59", "allday",
2024,  "Ericmas Day",       "2024-01-08 00:00", "2024-01-08 23:59", "allday",
2025,  "Ericmas Season",    "2025-01-04 00:00", "2025-01-12 23:59", "allday",
2025,  "Starts at Sundown", "2025-01-03 17:00", "2025-01-03 23:59", "allday",
2025,  "Ends at Sunrise",   "2025-01-13 00:00", "2025-01-13 06:59", "allday",
2025,  "Ericmas Day",       "2025-01-08 00:00", "2025-01-08 23:59", "allday",
2026,  "Ericmas Season",    "2026-01-03 00:00", "2026-01-11 23:59", "allday",
2026,  "Starts at Sundown", "2026-01-02 17:00", "2026-01-02 23:59", "allday",
2026,  "Ends at Sunrise",   "2026-02-13 00:00", "2026-01-13 06:59", "allday",
2026,  "Ericmas Day",       "2026-01-08 00:00", "2026-01-08 23:59", "allday"
)
