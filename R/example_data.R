library("tidyverse")
library("toastui")
my_calendar_data <- data.frame(
  calendarID = c("1", "2", "3", "4"),
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



