
mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH11TA01.txt")

 x = mydata[,1] ;  y = mydata[,2]

 LM = lm ( y ~ x )

 summary(LM)



# -----------------------------------------------------------
# Regression of c5 on x
# -----------------------------------------------------------

 c3 = resid(LM)
 c4 = fitted(LM)

 c5 = abs (c3)

 LM2 = lm ( c5 ~ x )
 summary(LM2)


# -----------------------------------------------------------
# Table 11.1 on Page 427 
# -----------------------------------------------------------
 c6  = fitted (LM2)
 c7 = 1/c6
 c8 = c7 * c7
 cbind(x, y, c3, c5, c6, c8)

# -----------------------------------------------------------
# Figure 11.1 on Page 428
# -----------------------------------------------------------
postscript( file="Figure-11-1.eps", width=6.0, height=2.0)
par(mfrow=c(1,3), mar=c(6, 6, 0, 1), omi=c(0,0,0,0), cex=0.5, mex=0.5)

plot(x,y, xlab="Age", ylab="Blood Pressure")
abline(LM)

plot(x,c3, xlab="Age", ylab="Residual")
abline( lm(c3~x) )

plot(x,c5, xlab="Age", ylab="Absolute Residual")
abline( lm(c5~x) )




# -----------------------------------------------------------
# WLS (using option in lm ( ) function)
# -----------------------------------------------------------
 WLS = lm ( y ~ x , weights = c8)
 
 summary (WLS)

 c9  = resid (WLS)
 c10 = fitted (WLS)



