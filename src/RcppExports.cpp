// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// QREconC
int QREconC(arma::mat& x, arma::mat& q, arma::mat& r);
RcppExport SEXP _QREcon_QREconC(SEXP xSEXP, SEXP qSEXP, SEXP rSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat& >::type x(xSEXP);
    Rcpp::traits::input_parameter< arma::mat& >::type q(qSEXP);
    Rcpp::traits::input_parameter< arma::mat& >::type r(rSEXP);
    rcpp_result_gen = Rcpp::wrap(QREconC(x, q, r));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_QREcon_QREconC", (DL_FUNC) &_QREcon_QREconC, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_QREcon(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
