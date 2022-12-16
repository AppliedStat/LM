## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)
## 
##   Box-Cox Transforms (updated version of bxcx.R)
## 
##   Usage: BoxCox( y ~ x1 + x2 ) 
##          Like lm( ) function, we can use model.
## 
## ==================================================

"BoxCox" <-
function( object, lambda = seq(-2,2,1/10), SSE=FALSE ) {

  LM = lm (object)
  df = LM$df.residual
  X  = as.matrix( cbind(1, LM$model[,-1] ) )
  Y  =  LM$model[,1]

   n = length(lambda)
 sse = numeric(n)
  k2 = exp( mean( log(Y) ) )

   H = X %*% solve(t(X)%*%X) %*% t(X)

   for ( i in 1:n) {
       if ( abs(lambda[i]) > 0.0001 ) {
          k1 = 1 / ( lambda[i]* k2^(lambda[i]-1) )
          W  = k1 * (Y^lambda[i]-1)
       } else {
          W  = k2 * log(Y)
       }
       Yhat = H %*% W
       res  = W - Yhat
       sse[i] = sum( res^2 )
   }
   if ( SSE )  {
      return(sse)
   } else {
      return(sse / df )
   }
}

##
