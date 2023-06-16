# Read Data
# Original data from Figure 6.5b on Page 237 of the textbook.
 mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH06FI05.txt")

 x1 = mydata[,1]
 x2 = mydata[,2]
 y  = mydata[,3]


# Model Y=b0 + b1*X1 + b2*X2 + e
 # Ordinary regression
 LM = lm ( y ~ x1 + x2 )
 coef(LM)

 # Standardized regression
 n = length(y)
 x1star = (x1-mean(x1)) / sd(x1)
 x2star = (x2-mean(x2)) / sd(x2)
  ystar = (y-mean(y)) / sd(y)

 LMstar = lm ( ystar ~ 0 + x1star + x2star )
 LMstar


 LMstar2 = lm ( ystar ~ x1star + x2star )
 LMstar2

# Using coef.sd() function
 source("https://raw.githubusercontent.com/AppliedStat/LM/master/coef-sd.R")
 LM = lm ( y ~ x1 + x2 )
 coef.sd(LM)

