% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/factor_to_dummies.R
\name{factor_to_dummies}
\alias{factor_to_dummies}
\title{Convert Factor To Dummy Variables}
\usage{
factor_to_dummies(
  var,
  dummy_levels = levels(var),
  varname_prefix = NULL,
  nas_as_zeros = F
)
}
\arguments{
\item{var}{variable of choice; a vector of class factor}

\item{dummy_levels}{vector of character; corresponds to the levels in the vector you would
like to generate dummy columns for; defaults to the levels of var;
If you want a dummy for just one or two of the levels specify that here}

\item{varname_prefix}{character to prefix the names of the columns returned by this function;
defaults to NULL in which case variable levels alone are translated to column names}

\item{nas_as_zeros}{a logical for if NAs in the factor should be treated as 0s in the dummies
or if they should be treated NAs; default is treating NAs as NAs}
}
\value{
tibble of dummies
}
\description{
Convert factor to columns of dummy variables
}
\examples{

df <- data.frame(
  gender = as.factor(rep(c("Man", "Woman", "Non-binary"),3)),
  blood_type = as.factor(rep(c("AB", "O", "A"),3))
)

df2 <- dplyr::bind_cols(
  df,
  #to make dummy variables for the gender categories
  factor_to_dummies(df$gender)
  )

df3 <- dplyr::bind_cols(
  df,
  #to make dummy variables for the gender categories and specify gender in the varnames
  factor_to_dummies(df$gender, varname_prefix = "gender_")
  )

#or maybe we just want a dummy for NB
df4 <- dplyr::bind_cols(
  df,
  #to make dummy variables for the gender categories and specify gender in the varnames
  factor_to_dummies(df$gender, dummy_levels = c("Non-binary"))
  )

}
