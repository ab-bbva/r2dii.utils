% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_param.R
\name{get_param}
\alias{get_param}
\title{Create functions to access configuration parameters}
\usage{
get_param(..., if_null = NULL)
}
\arguments{
\item{...}{Character string(s) giving a(the) field(s) in a configuration
file.}

\item{if_null}{A value to fill an unset parameter, or the function \code{stop}.}
}
\value{
A function.
}
\description{
This is a function factory to create functions which output the value of a
configuration parameter.
}
\examples{
# get_param() is a function factory
# Create a `get_a_value()` function
get_a_value <- get_param("a_field")
class(get_a_value)

# Create an example configuration file
config <- glue::glue("
    default:
      a_field: a_value
  ")
show_config(config)

# Write the config file to a temporary file
path_to_config_file <- tempfile()
readr::write_lines(config, path_to_config_file)

# Use `get_a_value()` to get a value from a field in the example config file
get_a_value(file = path_to_config_file)

# Fails: The parameter 'bad' doesn't exist, so it is `NULL`
fails <- get_param("bad", if_null = stop)
try(fails())

returns_null <- get_param("bad")
returns_null()

returns_value_passed_to_if_null <- get_param("bad", if_null = 1)
returns_value_passed_to_if_null()
}
\seealso{
\link{FINANCIAL.TIMESTAMP}

Other functions to get specific 2dii configuration parameters: 
\code{\link{FINANCIAL.TIMESTAMP}()}
}
\concept{functions to get specific 2dii configuration parameters}
