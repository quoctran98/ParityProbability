#' Probability that a number is odd
#'
#' Returns the probability from 0 to 1 that a number is odd based the number of vowels in its English numeral.
#'
#' @param num an integer
#' @param model the sigmoid midpoint from `buildModel()` used to predict parity
#'
#' @return numeric
#' @export
#'
#' @examples
#' probablyOdd(17)
probablyOdd <- function (num, model = buildModel()) {
  numeralSplit <- unlist(strsplit(asNumeral(abs(num)), ""))
  vowels <- sum(numeralSplit %in% c("a","e","i","o","u"))
  pVowels <- vowels / length(numeralSplit)
  return(as.numeric(1/(1+exp(-1*(pVowels+model)))))
}
