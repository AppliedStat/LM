# Read Data 
# TABLE 7.1: Body Fat Example (pg. 257)
 mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH07TA01.txt")
 x1 = mydata[,1]
 x2 = mydata[,2]
 x3 = mydata[,3]
 y  = mydata[,4]


# Model Y = b0 + b1*X1 + b2*X2 + e (X1 first)
 LM3 = lm ( y ~ x1 + x2 )
 anova(LM3)


# Model Y = b0 + b1*X1 + b2*X2 + b3*X3 + e 
 LM5 = lm ( y ~ x1 + x2 + x3 )
 anova(LM5)
