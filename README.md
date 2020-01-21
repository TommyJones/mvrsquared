[![Travis-CI Build Status](https://travis-ci.org/TommyJones/mvrsquared.svg?branch=master)](https://travis-ci.org/TommyJones/mvrsquared)
[![Coverage Status](https://img.shields.io/codecov/c/github/tommyjones/mvrsquared/master.svg)](https://codecov.io/github/tommyjones/mvrsquared?branch=master)


Welcome to the `mvrsquared` package! This package does one thing: calculate the coefficient of determination or R-squared. However, this implementation is different from what you may be familiar with. In addition to the standard R-squared used frequently in linear regression, `mvrsquared` calculates R-squared for multivariate outcomes. (This is why there is an 'mv' in `mvrsquared`).

`mvrsquared` implements R-squared based on a derivation in [this paper](https://arxiv.org/abs/1911.11061). It's the same definition of R-squared you're probably familiar with ($1 - \frac{SSE}{SST}$) but generalized to n-dimensions.

In the standard case, your outcome $y$ and prediction $\hat{y}$ are vectors. In other words, each observation is a single number. This is fine if you are predicting a single variable. But what if you are predicting multiple variables at once? In that case, $y$ and $\hat{y}$ are matrices. This situation occures frequently in topic modeling or simultaneious equation modeling.

### Installation

For now you can get the development version with 

```
devtools::install_github("tommyjones/mvrsquared")
```

In the not-to-distant future you will (I hope) be able to get this on CRAN with

```
install.packages("mvrsquared")
```

### Check out the vignette to see how to...

1. Calculate the regular R-squared we all know and love!
2. Calculate R-squared for multiple outcome variables at once (like a multinomial regression)!
3. Calculate R-squared for probabilistic (e.g. LDA) and non-probabilistic (e.g. LSA) topic models!
4. Split your BIG DATA into batches and calculate R-squared with a parallel/distributed map-reduce framework!

