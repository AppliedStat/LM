# Using web link:    
source("https://raw.githubusercontent.com/AppliedStat/LM/master/bxcx.R")

mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH03TA08.txt")

c1 = mydata[,1]
c2 = mydata[,2]

lam = seq(1.0, -1.0, by=-0.1)
sse = bxcx(c2, c1, lambda=lam)

cbind(lam, sse)

# ===============================================================
# Using MASS library
# For help, use
# > library(help="MASS") or help("boxcox")
# ---------------------------------------------------------------
library("MASS")

# Note: 1. find the max. instead of the min.
#       2. log-likelihood is used instead of SSE

lam = seq(1.0, -1.0, by=-0.1)
boxcox( c2 ~ c1 , lambda = lam )

