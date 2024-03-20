prep_FRED_data <- function(x) {
  getSymbols(x, src = "FRED")
  df <- get(x)
  df <- as_tibble(data.frame(date = index(df), Value = as.numeric(df[, 1]))) %>%
    rename_with(~x, .cols = "Value")
  return(df)
}
