#' Probability that a number is even
#'
#' Returns the probability from 0 to 1 that a number is even based the number of vowels in its English numeral.
#'
#' @param num an integer
#' @param model the sigmoid midpoint from `buildModel()` used to predict parity
#'
#' @return numeric
#' @export
#'
#' @examples
#' maybeEven(94)
maybeEven <- function (num, model = buildModel()) {
  return(1-probablyOdd(num, model = buildModel()))
}
