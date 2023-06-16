##
## Example on Page 434 (Ridge Regression)
##         Data set from TABLE 7.1: Body Fat Example (pg. 257)

mydata = read.table("http://www.ces.clemson.edu/~cspark/805/data/CH07TA01.txt")

x1 = mydata[,1]
x2 = mydata[,2]
x3 = mydata[,3]
y  = mydata[,4]
n  = length(y) 

sx = c(sd(x1),sd(x2),sd(x3))
sy = sd(y)

#------------------------
mylm = lm ( y ~ x1 + x2 + x3 )
summary(mylm)

source( "http://www.ces.clemson.edu/~cspark/805/R/coef-sd.R" )

coef.sd.lm (mylm)
coef(mylm)[-1] * sx / sy 

#------------------------
library(MASS)
#------------------------
## NOTE: lm.ridge (..., lambda=c*n) c=textbook constant. n=sample size 
mylm1 = lm.ridge( y ~ x1 + x2 + x3, lambda=0.02*n )
mylm1 

coef(mylm1)[-1] * sx / sy


#------------------------
# Table 11.2 
#------------------------

tmp = lm.ridge( y ~ x1 + x2 + x3, lambda=0.002*n)
coef(tmp)[-1] * sx/sy 

tmp = lm.ridge( y ~ x1 + x2 + x3, lambda=0.004*n)
coef(tmp)[-1] * sx/sy 

tmp = lm.ridge( y ~ x1 + x2 + x3, lambda=0.006*n)
coef(tmp)[-1] * sx/sy 

# ............ 

tmp = lm.ridge( y ~ x1 + x2 + x3, lambda=0.5*n)
coef(tmp)[-1] * sx/sy 


# Calculate all of them at once
lam = c(0.000, .002, .004, .006, .008, .01, .02, .03, .04, .05, .1, .5, 1)
mylm2 = lm.ridge( y ~ x1 + x2 + x3, lambda=lam*n) 
beta = t(  t(coef(mylm2)[ ,-1]) * sx / sy  )
beta 

# cosmetic (rename row names)
row.names ( beta ) = lam
round(beta, 4)  


#------------------------
# Figure 11.3 
#------------------------

mylm3 = lm.ridge( y ~ x1 + x2 + x3, lambda=seq(0, 1, 0.001) )
plot(mylm3)



