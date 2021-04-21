# ParityProbability
I noticed the English numerals of numbers tended to have more vowels if they were even ("one" has 2 vowels and "two" has 1 vowel). This package uses a logistic model to predict whether a number is odd or even based on the number of vowels that it has. There may be no better way to determine whether a number is odd or even.

## Installation

ParityProbability can be installed directly from Github and loaded in R:

```
devtools::install_github("https://github.com/quoctran98/ParityProbability.git")
library(ParityProbability)
```

## Usage

The two functions ```probablyOdd()``` and ```maybeEven()``` return the probability that a number is odd or even, respectively.

``` 
probablyOdd(num = 95, model = buildModel(num = 1:100))
#> 0.7190463
```
```
maybeEven(num = 17, model = buildModel(num = 1:100))
#> 0.2809537
```

The ```model``` argument of both functions takes the output of ```buildModel()``` which is used to create a "training set" of data for the logistic model based on the vector of numbers. The default is [1,100] and the model doesn't seem to work well at all with any other range of numbers.

The ```asNumeral()``` function is also fun to use:

```
asNumeral(4371)
#> "four thousand three hundred seventy one"
```
## Other Things

Yes. I know that by using absolute number of vowels instead of proportion of vowels will heavily skew the results. That's a design feature.
