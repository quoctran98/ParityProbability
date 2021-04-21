#' Convert a number to its numeral
#'
#' Turn a number to its English numeral.
#'
#' @param num any non-negative integer less than 10^27
#'
#' @return string
#' @export
#'
#' @examples
#' asNumeral(3945)
asNumeral <- function (num) {
  if (num == 0) {return("zero")}
  ones <- c("one","two","three","four","five","six","seven","eight","nine")
  tens <- c("ten","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety")
  teens <- c("eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen")
  bigones <- c("hundred","thousand","million","billion","trillion","quadrillion","quinitillion","sextillion","septillion")
  num2hundred <- function (hundredNum) {
    if (hundredNum == 0) {
      return("")
    } else if (hundredNum < 10) {
      return(ones[hundredNum])
    } else if (hundredNum == 10) {
      return("ten")
    } else if (hundredNum < 20) {
      return(teens[hundredNum %% 10])
    } else if (hundredNum < 100) {
      return(paste(tens[floor(hundredNum / 10)],
                   ones[hundredNum %% 10]))
    } else {
      return(paste(ones[floor(hundredNum / 100)],
                   "hundred",
                   tens[floor((hundredNum %% 100) / 10)],
                   ones[hundredNum %% 10]))
    }
  }
  numLeftover <- as.character(num)
  word <- ""
  for (i in 1:ceiling(log10(num+1)/3)) {
    currNum <- as.numeric(substr(numLeftover, nchar(numLeftover)-2, nchar(numLeftover)))
    numLeftover <- substr(numLeftover, 0, nchar(numLeftover)-3)
    if (i == 1) {
      word <- num2hundred(currNum)
    } else {
      word <- paste(num2hundred(currNum), bigones [i], word)
    }
  }
  return(word)
}
