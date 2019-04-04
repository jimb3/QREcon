#' @useDynLib QREcon, .registration = TRUE
#' @importFrom Rcpp sourceCpp
NULL

#' QREcon - Economical QR decomposition
#'
#' @param x
#' The matrix to decompose. This must be a numeric matrix.
#' The number or rows in X must be greater than of equal to
#' the number of columns in X.
#' @param q
#' (Optional) A numeric matrix that will contain the Q matrix
#' after decompostion.
#' If this value is passed to the function it must
#' have the same number of rows and columns as the x matrix
#' If this value is provided a value for r must be provided.
#' @param r
#' (Optional) A numeric matrix that will contain the R matrix
#' after decomposition.
#' If this value is provided is must be a square matrix with
#' the number of rows and columns equal to the number of columns
#' in the x matrix.
#' If this value is provided a value for q must be provided.
#' @return
#' If q and r are not provided, a list with q and r will be returned.
#' This will contain the Q and R matrices from the QR decomposition
#' of x. If these matrices are NULL, the decomposition of x failed.
#' If q and r are provided and are of the appropriate dimenstions,
#' a value of 0 will be returned if the decomposition was successful
#' and the q and r will contain the Q and R matrices from the
#' decomposition of x, otherwise a value of 1 will be returned.
#' @export
#'
#' @examples
#' x <- matrix(c(1.,1.,1.,2.,3.,5.), 3, 2)
#' qr <- QREcon(x)
#' qr$q
#' qr$r
#' qr$q %*% qr$r
#' t(qr$q) %*% qr$q
QREcon <- function(x, q, r) {
  if (is.matrix(x) == FALSE || is.numeric(x) == FALSE || is.integer(x))
    stop('x is not a numeric matrix')
  if (missing(q) != missing(r))
    stop('Both q and r must be either both missing or both specified')
  if (ncol(x) > nrow(x))
    stop('The number of rows in x must be greater equal to the number
         of columns in x')
  if (missing(q) == TRUE) {
    q <- matrix(0., nrow(x), ncol(x))
    r <- matrix(0., ncol(x), ncol(x))
    if (QREconC(x, q, r) == 1)
      return (list(q = numeric(0), r = numeric(0)))
    return (list(q = q, r = r))
  }

  if (is.matrix(q) == FALSE || is.numeric(q) == FALSE || is.integer(q))
    stop('q is not a numeric matrix')
  if (nrow(q) != nrow(x) || ncol(q) != ncol(x))
    stop('q must have the same dimenstions as x')
  if (is.matrix(r) == FALSE || is.numeric(r) == FALSE || is.integer(r))
    stop('r is not a numeric matrix')
  if (nrow(r) != ncol(x) || ncol(r) != ncol(x))
    stop('r must be a square matrix with the same number of columns as x')
  return (QREconC(x, q, r))
}
