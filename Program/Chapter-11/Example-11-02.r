 mydata = read.table("http://www.ces.clemson.edu/~cspark/805/data/CH11TA01.txt")

 x = mydata[,1] ;  y = mydata[,2]

 LM = lm ( y ~ x )

 summary(LM)

 c3 = resid(LM)
 c4 = fitted(LM)

 c5 = abs (c3)

 LM2 = lm ( c5 ~ x )
 c6  = fitted (LM2)
 
 c7 = 1/c6
 c8 = c7 * c7

 cbind(x, y, c3, c5, c6, c8)

# -----------------------------------------------------------
# WLS (using option in lm ( ) function)
# -----------------------------------------------------------
 WLS = lm ( y ~ x , weights = c8)
 
 summary (WLS)

 c9  = resid (WLS)
 c10 = fitted (WLS)

# -----------------------------------------------------------
# WLS (using OLS)
# -----------------------------------------------------------
c12 = c7 * x 
c22 = c7 * y 

 LM2 = lm ( c22 ~ 0 + c7 + c12 )
 c23 = fitted(LM2)
 summary(LM2)

 cbind(c10, c23)

 c24 = c23/c7

 cbind(c10, c24)


