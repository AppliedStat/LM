## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)
## 
##   Breusch-Pagan Test
## 
##   Usage: BP.test ( y ~ x1 + x2 ) 
##          Like lm( ) function, we can use model.
## 
## ==================================================

"BP.test" <- 
function( object ) {
  LM = lm (object)
  e  = resid(LM)
  s2 = e^2
   n = length(e)
  df = LM$rank
   X = as.matrix( cbind(1, LM$model[,-1] ) )
   H = X %*% solve(t(X)%*%X) %*% t(X)

    SSE = sum( s2 )
 s2.fit = H %*% s2 
    SSR.star = sum( (s2.fit-mean(s2))^2 )

    X.BP = SSR.star/2 / ( (SSE/n)^2 )
   
    list (test.stat=X.BP, df=df-1, p.value=1-pchisq(X.BP, df=df-1))
}



