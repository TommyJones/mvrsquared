// [[Rcpp::plugins(cpp11)]]
// [[Rcpp::depends(RcppThread)]]
// [[Rcpp::depends(RcppArmadillo)]]
#include "RcppThread.h"
#include <RcppArmadillo.h>
#include <cmath>
#define ARMA_64BIT_WORD
using namespace Rcpp ;

// [[Rcpp::export]]
NumericVector calc_sum_squares_latent(
    arma::sp_mat Y,
    NumericMatrix X,
    NumericMatrix W,
    NumericVector ybar,
    int threads
) {

  int n_obs = Y.n_cols; // number of observations
  NumericVector result(2); // final result
  double SSE = 0; // sum of squared errors across all documents
  double SST = 0; // total sum of squares across all documents


  // for each observations...
  RcppThread::parallelFor(
    0,
    n_obs,
    [&Y,
     &X,
     &W,
     &ybar,
     &SSE,
     &SST
    ] (unsigned int d){
      RcppThread::checkUserInterrupt();

      // Yhat = X %*% W. But doing it funny below to optimize calculation
      double sse = 0;
      double sst = 0;

      for(int v = 0; v < W.ncol(); v++ ){
        double Yhat = 0;

        for(int k = 0; k < X.ncol(); k++ ){
          Yhat = Yhat + X(d , k ) * W(k , v );
        }

        sse = sse + ((Y(v, d) - Yhat) * (Y(v, d) - Yhat));

        sst = sst + ((Y(v, d) - ybar[ v ]) * (Y(v, d) - ybar[ v ]));

      }

      SSE = SSE + sse;

      SST = SST + sst;
    },
    threads);


  result[ 0 ] = SSE;
  result[ 1 ] = SST;

  return result;


}
