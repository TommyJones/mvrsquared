## Release Summary

This is a patch release. 

This patches an error being thrown during testing on some Linux operating systems.
I've not been able to reproduce the error on Windows or MacOS (or even consistently
on Linux).
The root cause seems to be an imprecise calculation introduced in parallel computing.
This patch should avoid the error. A note was added to `help(calc_rsquared)` to
warn users that the ultimate cause of imprecision is under investigation and this
does not seem to happen when `threads = 1`.

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
