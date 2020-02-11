## Release Summary

This is a patch with fixes requested by CRAN. I have included

* Changes to examples requested by CRAN. '\dontrun{}' has been changed to '\donttest{}'

Previously, I'd made the changes in the file that makes the documentation, but had not compiled it so the change made it to the .Rd file. Sorry about that!

I've also made some minor updates to the README file

## Test environments

* Local OS X install, R 3.6.2
* Ubuntu 14.04 (on Travis-CI)
* Win-builder (devel, release, and old release)
* Using the R Hub service (devel, release, and old release on 6 operating systems)

## R CMD check results

0 errors | 0 warnings | 1 notes

On most builds there is 1 NOTE flagging this as a "New submission"

## Downstream dependencies

I have no downstream dependencies
