context("test-improperinput")

test_that("improper input detected", {
  xI <- matrix(1L, 3, 2)
  expect_error(QREcon(xI), 'x is not a numeric matrix')
  xC <- 1.
  expect_error(QREcon(xC), 'x is not a numeric matrix')
  x <- matrix(c(1.,1.,1.,2.,3.,5.), 3, 2)
  expect_error(QREcon(t(x)), 'The number of rows in x must be greater equal to the number
         of columns in x')
  q <- matrix(0., 3, 2)
  r <- matrix(0., 2, 2)
  expect_error(QREcon(x, q),'Both q and r must be either both missing or both specified')
  expect_error(QREcon(x, r=r), 'Both q and r must be either both missing or both specified')
  qI <- xI
  expect_error(QREcon(x, qI, r), 'q is not a numeric matrix')
  qC <- 1.
  expect_error(QREcon(x, qC, r), 'q is not a numeric matrix')
  rI <- xI
  expect_error(QREcon(x, q, rI), 'r is not a numeric matrix')
  rC <- 1.
  expect_error(QREcon(x, q, rC), 'r is not a numeric matrix')
  qWd <- matrix(0., 3, 3)
  expect_error(QREcon(x, qWd, r), 'q must have the same dimenstions as x')
  rWd <- matrix(0., 3, 3)
  expect_error(QREcon(x, q, rWd), 'r must be a square matrix with the same number of columns as x')
})
