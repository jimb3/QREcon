context("test-listoutput")

test_that("return list works", {
  x <- matrix(c(1.,1.,1.,2.,3.,5.), 3, 2)
  qr <- QREcon(x)
  expect_equal(qr$q %*% qr$r, x)
  expect_equal(t(qr$q) %*% qr$q, diag(2))
})
