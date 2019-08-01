## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)
## 
##  Modified Levene test for non-constancy of variance 
## 
## ==================================================


levene.test = function(gr1, gr2) {
   
   d1 = abs( gr1 - median(gr1) )
   d2 = abs( gr2 - median(gr2) )

   n1 = length(d1)
   n2 = length(d2)
   df = n1+n2-2
   s2 = ( (n1-1)*var(d1) + (n2-1)*var(d2) ) / (n1+n2-2)
   
   test = (mean(d1)-mean(d2))/sqrt(s2*(1/n1+1/n2))
   p.value = 2*(1-pt( abs(test), df=df))

   list( t.test.stat=test, df=df, p.value=p.value)
}
