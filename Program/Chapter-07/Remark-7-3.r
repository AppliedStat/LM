# Read Data
# TABLE 7.1: Body Fat Example (pg. 257)
 mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH07TA01.txt")
 x1 = mydata[,1]
 x2 = mydata[,2]
 x3 = mydata[,3]
 y  = mydata[,4]


# Partial correlation between Y and X2 with X1 given
 LM1 = lm ( y ~ x1 )
 c21 = resid(LM1)
 tmp = lm ( x2 ~ x1 )
 c22 = resid(tmp)
 cor(c21, c22)


# Partial correlation between Y and X3 with X1 and X2 given
 LM3 = lm ( y ~ x1 + x2 )
 c21 = resid(LM3)
 tmp = lm ( x3 ~ x1 + x2 )
 c22 = resid(tmp)
 cor(c21, c22)

