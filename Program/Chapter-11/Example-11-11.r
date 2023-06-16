# Example 1: Math Proficiency with one predictor (X2). Page 441
# NOTE: Typo in Figure 11.5 on Page 442. (X3 should read X2).

# Page 443
Data=read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH11TA04.txt")
y  = Data[,2]
X2 = Data[,4]

#
X2bar = mean(X2); x2 = X2 - X2bar  # de-meaned

# OLS 
LM0 = lm( y~x2 + I(x2^2) )
e0 = resid(LM0)
u0 = e0 / mad(e0)

#
weight.huber  <- function(x, k=1.345) { pmin(1, k/abs(x) ) }

# WLS: 1st iteration
w1 = weight.huber(u0)
LM1 = lm( y~x2 + I(x2^2), weights=w1)
e1 = resid(LM1)

# WLS: 2nd iteration
u1= e1 / mad(e1) 
w2 = weight.huber(u1)
LM2 = lm( y~x2 + I(x2^2), weights=w2)
e2 = resid(LM2)

# WLS: 3rd iteration
u2= e2 / mad(e2) 
w3 = weight.huber(u2)
LM3 = lm( y~x2 + I(x2^2), weights=w3)
e3 = resid(LM3)

# WLS: 4th iteration
u3= e3 / mad(e3)
w4 = weight.huber(u3)
LM4 = lm( y~x2 + I(x2^2), weights=w4)
e4 = resid(LM4)

# WLS: 5th iteration
u4= e4 / mad(e4)
w5 = weight.huber(u4)
LM5 = lm( y~x2 + I(x2^2), weights=w5)
e5 = resid(LM5)

# WLS: 6th iteration
u5= e5 / mad(e5)
w6 = weight.huber(u5)
LM6 = lm( y~x2 + I(x2^2), weights=w6)
e6 = resid(LM6)

# WLS: 7th iteration
u6= e6 / mad(e6)
w7 = weight.huber(u6)
LM7 = lm( y~x2 + I(x2^2), weights=w7)
e7 = resid(LM7)

# Table 11.5 (Page 444)
round(cbind(e0,u0, w1,e1, w2, e2, w7,e7),4)


# Using rlm() function, which is slightly different from the above.
library(MASS)
RLM1 = rlm(y~x2 + I(x2^2), method="M", scale.est="MAD", k2=1.345, maxit=1 )
RLM1
RLM7 = rlm(y~x2 + I(x2^2), method="M", scale.est="MAD", k2=1.345, maxit=7 )
RLM7
RLM  = rlm(y~x2 + I(x2^2))
RLM


# Plot 
# Scatter plot
## postscript(file="Figure-11-5.eps", width=5, height=5)
pdf(file="Figure-11-5.pdf", width=5, height=5)
plot(X2, y) 
legend(63,285, bty="n", lty=c(1,2,2), col=c("blue","black","red"),
       legend=c("rlm", "WLS", "OLS") )
# From LM0 (OLS)
curve( 258.43557+1.83272*(x-X2bar)+0.06491*(x-X2bar)^2,add=TRUE, col="red", lty=2) 

# From LM1 (WLS after 1st iteration)
curve( 259.39021+ 1.67011*(x-X2bar)+0.06463*(x-X2bar)^2,add=TRUE, lty=2)

# From RLM (MASS library) # sams as WLS after 10th iteration.;
curve( 259.421126+ 1.5646*(x-X2bar)+0.08021299*(x-X2bar)^2,add=TRUE, col="blue")

