
#' Convert Decimal to Percent
#'
#' @description This function converts a decimal to percent with options for rounding and padding with a %
#'
#' @param num vector of numerics, most likely between 0 and 1
#' @param digits defaults to 0; number or digits to round percent to
#' @param add_percent_sign defaults to FALSE; flag for whether or not someone wants % sign added to percents
#'
#' @examples
#'
#' #our vector of numerics
#' nums <- runif(15)
#'
#' # Most common use case for plots and tables converts numerics to percents rounded to nearest percent
#' as_percent(nums)
#'
#' # One might want more digits. They should use the digits option to specify how many.
#' as_percent(nums, digits = 2)
#'
#' # Sometimes, for plots, I find myself wanting to add percent signs,
#' # so I added the add_percent_sign flag
#' as_percent(runif(15), add_percent_sign = TRUE)
#'
#'
#' # Often I find myself doing this across multiple percents in a data frame before a plot
#' \dontrun{
#' # NOTE: You will need a couply tidyverse packages for this example :)
#' df <-
#' # making df of random pct by state
#' data.frame(
#'  state = c(rep("CA", 10), rep("OR", 10)),
#'  pct = runif(20, max = 0.8, min = 0.2)
#'  ) %>%
#'  dplyr::mutate(
#'    # fake confidence intervals
#'    pct_low_ci = pct - runif(20, max = 0.1),
#'    pct_upp_ci = pct + runif(20, max = 0.1)) %>%
#'  dplyr::mutate(
#'    # now we are plot ready!
#'    dplyr::across(tidyselect::matches("pct"), as_percent)
#'  )
#'
#' )
#' }
#'
#' @return vector of numerics if add_percent_sign == F; vector of character if add_percent_sign == T
#'
#' @export

as_percent <- function(num, digits = 0, add_percent_sign = FALSE){
  # Only excepts numerics! (for now)
  if(!is.numeric(num)){
    stop("Please supply a numeric.")
  }
  # IFlagging potential confusion
  if(max(abs(num)) > 1){
    message("Percents larger than 100% returned. If this is unexpected check num.")
  }
  # so its mostly one line
  percents <- round(num * 100, digits)
  # adding a % if requested
  if(add_percent_sign == T){
    percents <- paste0(as.character(percents), "%")
  }
  return(percents)
}
