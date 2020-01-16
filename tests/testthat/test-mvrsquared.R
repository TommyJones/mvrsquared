testthat::context("mvrsquared tests")

### test vanilla rsquared ----

f <- stats::lm(mpg ~ cyl + disp + hp + wt, data = datasets::mtcars)

y <- f$model$mpg

yhat <- f$fitted.values

s <- summary(f)

testthat::test_that("We get the expected value for correct inputs to vanilla rsquared",{

  r2 <- calc_rsquared(y = y, yhat = yhat)

  testthat::expect_equal(round(r2, 3), round(s$r.squared, 3))

  ss <- calc_rsquared(y = y, yhat = yhat, return_ss_only = TRUE)

  testthat::expect_equal(length(ss), 2)

  testthat::expect_equal(r2, 1 - ss[[1]] / ss[[2]])

})


testthat::test_that("Get the right r-squared for single column matrix inputs", {

  y_mat <- matrix(y, ncol = 1)

  x <- cbind(1, as.matrix(f$model[, -1]))

  w <- matrix(s$coefficients[, 1], ncol = 1)

  testthat::expect_equal(calc_rsquared(y = y_mat, yhat = list(x, w)),
                         calc_rsquared(y = y, yhat = yhat))

})

testthat::test_that("Get the right value for dgCMatrix inputs", {




})

testthat::test_that("get errors for incompatible dimensions",{

  # not enough columns for yhat
  testthat::expect_error(calc_rsquared(y = cbind(y, y), yhat = yhat))

  # too many columns for yhat
  testthat::expect_error(calc_rsquared(y = y, yhat = cbind(yhat, yhat)))

  # number of rows does not match
  testthat::expect_error(calc_rsquared(y = y[1:10], yhat = yhat))

  # pass a vector and matrix in list
  testthat::expect_error(
    calc_rsquared(y = y, yhat = list(yhat, matrix(1, nrow = 1, ncol = 3)))
    )

  # dimensions of matrices in list do not match
  testthat::expect_error(
    calc_rsquared(y = y, yhat = list(matrix(yhat, ncol = 1), matrix(1, nrow = 1, ncol = 3)))
    )

})

testthat::test_that("batch (for parallel) computation behaves nicely", {

  # define some batches
  batches <- list(list(y = cbind(y[1:16], y[1:16]), yhat = cbind(yhat[1:16], yhat[1:16])),
                  list(y = cbind(y[17:32], y[17:32]), yhat = cbind(yhat[17:32], yhat[17:32])))

  ybar <- c(mean(y), mean(y))

  # calc sum of squares by batch with correct inputs
  # Note: this uses lapply, but one could easily do this in parallel with mclapply or similar
  ss <- lapply(X = batches,
               FUN = function(ybatch){
                     calc_rsquared(y = ybatch$y, yhat = ybatch$yhat, ybar = ybar, return_ss_only = TRUE)
                   })


  sse <- sum(sapply(ss, function(x) x["sse"]))

  sst <- sum(sapply(ss, function(x) x["sst"]))

  r2_batch <- 1 - sse / sst # final r-squared value here

  testthat::expect_equal(round(r2_batch, 4), round(s$r.squared, 4))

  # leave out ybar and get a warning
  testthat::expect_warning(lapply(X = batches,
                                  FUN = function(ybatch){
                                    calc_rsquared(y = ybatch$y, yhat = ybatch$yhat, return_ss_only = TRUE)
                                  }))

})
