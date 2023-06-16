# Read Data
 mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH07TA01.txt")

 x1 = mydata[,1]
 x2 = mydata[,2]
 x3 = mydata[,3]
 y  = mydata[,4]

# Model: Y = b0 + b1*X1 + b2*X2 + e (X1 first)
 source("https://raw.githubusercontent.com/AppliedStat/LM/master/VIF.R")

 LM = lm (y ~ x1 + x2 + x3)

 vif(LM)

