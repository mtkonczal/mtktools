get_FRED_data <- function(FRED_variables, lowercase_variables = TRUE){
  data_list <- lapply(fred_variables, prep_FRED_data)
  data_list <- reduce(data_list, full_join, by = "date")
  data_list <- data_list %>% arrange(date)
  if(lowercase_variables){
    colnames(data_list) <- tolower(colnames(data_list))
  }
  return(data_list)
}
