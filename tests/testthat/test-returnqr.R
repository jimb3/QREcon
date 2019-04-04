context("test-returnqr")

test_that("return Q and R works", {
  x <- matrix(c(1.,1.,1.,2.,3.,5.), 3, 2)
  q <- matrix(0., 3, 2)
  r <- matrix(0., 2, 2)
  QREcon(x, q, r)
  expect_equal(q %*% r, x)
  expect_equal(t(q) %*% q, diag(2))
})
