#include <RcppArmadillo.h>

// [[Rcpp::export]]
int QREconC(arma::mat &x, arma::mat &q, arma::mat &r) {
  if (qr_econ(q, r, x) == false)
    return 1;
  return 0;
}
