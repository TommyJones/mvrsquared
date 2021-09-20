## Release Summary

This is a patch release. 

This patches an error being thrown when passing large matrices to calc_rquared.

## Test environments

* local macOS install: release
* macOS (on GitHub actions): release
* ubuntu 20.04 (on GitHub actions): release
* win-builder: release, devel, and oldrel

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

I have one downstream dependency: tidylda. I have checked these changes with
tidylda and everything works as it should.
