## ==================================================
## R Function (MTHSC 805, by C. Park)
##  Box-Cox Transforms
##
## ==================================================

bxcx = function(y, x, lambda) {
     n = length(lambda)
   sse = numeric(n)
    k2 = exp( mean( log(y) ) )
   for ( i in 1:n) {
       if ( abs(lambda[i]) > 0.0001 ) {
          k1 = 1 / ( lambda[i]* k2^(lambda[i]-1) )
          w  = k1 * (y^lambda[i]-1)
       } else {
          w  = k2 * log(y)
       }
   LM  = lm(w ~ x)
   res = residuals(LM)
   sse[i] = sum( res^2 )
   }
   return(sse)
}


