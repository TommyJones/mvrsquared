## Release Summary

This is a patch release.

It addresses both issues CRAN's checks flagged for the previous release: the
package documentation issue, and the arXiv citation in DESCRIPTION, which now
uses the arXiv DOI <doi:10.48550/arXiv.1911.11061> rather than <arXiv:1911.11061>.

It also makes `calc_rsquared()` substantially faster without changing its
arguments, its return value, or its results beyond floating point tolerance.

The note in `?calc_rsquared` warning that parallelism could introduce imprecision
has been retired; results were verified to be bit-identical across 1, 2, 4 and 12
threads.

## Test environments

* local ubuntu 24.04 install: release
* macOS (on GitHub actions): release
* ubuntu 22.04 (on GitHub actions): release, devel, and oldrel
* win-builder: release, devel, and oldrel

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

I have one downstream dependency: tidylda. I have checked these changes against
tidylda and everything works as it should; the R-squared it reports is unchanged.
