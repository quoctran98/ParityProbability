#' Build a pairty logistic model
#'
#' Returns the sigmoid midpoint of a logistic model used to predict a number's parity based on the number of vowels in its English numeral. A training set of 1 to 100 works the best.
#'
#' @param num a vector of non-negative integers as the model's "training set"
#'
#' @return numeric
#' @export
#'
#' @examples
#' buildModel(num = 1:100)
buildModel <- function (num = 1:100) {
  df <- data.frame(num = num)
  df$isOdd <- as.logical(df$num %% 2)
  df$word <- sapply(df$num, asNumeral)
  df$vowels <- as.numeric(lapply(strsplit(df$word, ""),
                                 function (x) {return(sum(x %in% c("a","e","i","o","u")))}))
  df$nLetters <- unlist(lapply(strsplit(c(df$word),""), length))
  df$pVowels <- df$vowels / df$nLetters
  return(glm(isOdd~vowels, data = df, family = binomial)$coefficients[1])
}
