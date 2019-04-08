
<!-- README.md is generated from README.Rmd. Please edit that file -->
QREcon
======

The goal of QREcon is to be simple alternative to doing QR decomposition in R that is intuitive and easy to use.

[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/jimb3/QREcon?branch=master&svg=true)](https://ci.appveyor.com/project/jimb3/QREcon) [![Travis build status](https://travis-ci.org/jimb3/QREcon.svg?branch=master)](https://travis-ci.org/jimb3/QREcon) [![Coverage status](https://codecov.io/gh/jimb3/QREcon/branch/master/graph/badge.svg)](https://codecov.io/github/jimb3/QREcon?branch=master)

Installation
------------

You can install the released version of QREcon from [github](https://github.com) with:

``` r
devtools::install_github("jimb3/QREcon")
```

Example
-------

This is a example showing how to use QREcon returning a list:

``` r
## example returning a list with Q and R
library(QREcon)
# matrix to perform QR decomposition on
x <- matrix(c(1.,1.,1.,2.,3.,5.), 3, 2)
# call to QR decomposition routine
qr <- QREcon(x)
# view result, if q and r are NUll decomposition failed
qr
#> $q
#>            [,1]       [,2]
#> [1,] -0.5773503  0.6172134
#> [2,] -0.5773503  0.1543033
#> [3,] -0.5773503 -0.7715167
#> 
#> $r
#>           [,1]      [,2]
#> [1,] -1.732051 -5.773503
#> [2,]  0.000000 -2.160247
# checks if result is correct
# should be x
qr$q %*% qr$r
#>      [,1] [,2]
#> [1,]    1    2
#> [2,]    1    3
#> [3,]    1    5
# should be identity matrix
t(qr$q) %*% qr$q
#>      [,1] [,2]
#> [1,]    1    0
#> [2,]    0    1
```

This is a example showing how to use QREcon when result in stored in matrices passed to the routine:

``` r
library(QREcon)
# same matrix as in other example
x <- matrix(c(1.,1.,1.,2.,3.,5.), 3, 2)
# allocate memory for q and r
q <- matrix(0., 3, 2)
r <- matrix(0., 2, 2)
# call QR decomposition routine
QREcon(x, q, r)
#> [1] 0
# display q and r. Should be same as above.
q
#>            [,1]       [,2]
#> [1,] -0.5773503  0.6172134
#> [2,] -0.5773503  0.1543033
#> [3,] -0.5773503 -0.7715167
r
#>           [,1]      [,2]
#> [1,] -1.732051 -5.773503
#> [2,]  0.000000 -2.160247
```
