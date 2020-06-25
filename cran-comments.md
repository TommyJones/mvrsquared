## Release Summary

This is a minor release. It introduces parallel processing at the C++ level
using RcppThread.

To calculate R-squared in parallel, set the `threads` argument to a number 
greater than 1 when calling `calc_rsquared`. Default is still sequential processing.

## Test environments

* Local OS X install, R 4.0.1
* Local Ubuntu 18.04 install, R 4.0.1
* Ubuntu 16.04 (on Travis-CI)
* Win-builder (devel, release, and old release)
* Using the R Hub service (devel, release, and old release on 6 operating systems)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

I have no downstream dependencies
