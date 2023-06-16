# Read Data
 mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH07TA01.txt")

 x1 = mydata[,1]
 x2 = mydata[,2]
 x3 = mydata[,3]
 y  = mydata[,4]


# Model Y = b0 + b1*X1 + e
 LM1 = lm ( y ~ x1 )
 summary(LM1)

 anova(LM1)

# Model Y = b0 + b2*X2 + e
 LM2 = lm ( y ~ x2 )
 summary(LM2)

 anova(LM2)


# Model Y = b0 + b1*X1 + b2*X2 + e (X1 first)
 LM3 = lm ( y ~ x1 + x2 )
 summary(LM3)

 anova(LM3)

# Model Y = b0 + b2*X2 + b1*X1 + e (X2 first)
 LM4 = lm ( y ~ x2 + x1 )
 summary(LM4)

 anova(LM4)


# Model Y = b0 + b1*X1 + b2*X2 + b3*X3 + e
 LM5 = lm ( y ~ x1 + x2 + x3 )
 summary(LM5)

 anova(LM5)


