
 mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")

 x = mydata[,1]
 y = mydata[,2]
 dim(mydata)


Sxx = sum( (x-mean(x))^2 )
Sxy = sum( (x-mean(x))*(y-mean(y)) )
b1 = Sxy/Sxx
b0 = mean(y) - b1*mean(x)
c(b0,b1)

#----------------------------
 lm( y ~ x)

 X = cbind(1,x)

# Compare 
 crossprod(X) # same as X'X
 t(X) %*% X

 beta.hat = solve(crossprod(X)) %*% t(X) %*% y
 beta.hat 
#----------------------------





#----------------------------
 output = lm (y ~ x)
 summary(output)
 
 e1 = resid(output) 
 e2 = y - fitted(output) 
 e3 = y - ( beta.hat[1] + beta.hat[2]*x )
# Compare e1, e2, e3
 cbind(e1,e2,e3)

# MSE and s(residual standard error).
 n = length(y); p=length(beta.hat)
 c(n,p, n-p)  # df = n-p

 MSE = sum(e3^2) / (n-p)
 sqrt(MSE) 

# Std. Error
 SE = sqrt( MSE * diag( solve(crossprod(X))) )
 SE 

# Hat matrix
   H = X %*% solve(crossprod(X)) %*% t(X)
   y.hat = H %*% y
   # Compare
   cbind(fitted(output),y.hat)

# p-value for F-statistics and for beta[2]in R = beta_1 in the textbook
  2* (1-pt( beta.hat[2] / SE[2], df=n-p) )
  1-pf( (beta.hat[2] / SE[2])^2, 1, n-p)  # Same as the above


#------------------------------
 anova(output)
# SST
  SST = sum( (y-mean(y))^2 )
  # Check  252378 + 54825 
  SSE = sum( e1^2 )
  SSR = SST - SSE 
  c(SSR, SSE, SST, SSR+SSE)



#------------------------------
# Others
Rsquare1 = SSR/SST
Rsquare2 = 1 -  SSE/SST
c(Rsquare1, Rsquare2)

Rsquare.adjusted1 = 1 - ( SSE/(n-p) ) / ( SST/(n-1))
Rsquare.adjusted2 = 1 - (n-1)/(n-p) * (1-Rsquare1) 
c(Rsquare.adjusted1, Rsquare.adjusted2)




