 # Data generation
 x1 = 1:5
 x2 = sqrt(1:5)
 x3 = (1:5)^2
 y = exp( x1 + 2*x2 + 3*x3)

 # Import BoxCox function
 source("https://raw.githubusercontent.com/AppliedStat/LM/master/BoxCox.R")

 # SSE values for each of lambda
 lam = seq(-0.005, 0.005, 0.0001)
 SSE = BoxCox ( y ~ x1 + x2 + x3, lambda=lam, SSE=TRUE )
 plot(lam, SSE, type="l")

