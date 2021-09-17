# Figure 3.4 (d) on Page 106 
set.seed(1)
par ( mfrow=c(2,2) )

x = runif(100)*10
y = -10 + 2*x + rnorm(100)

# With intercept 

LM = lm(y ~ x )

e.hat = resid(LM)

y.hat = fitted(LM)

plot(x,     e.hat)
plot(y.hat, e.hat)


# Without intercept 

LM0 = lm(y ~ 0 + x )

e.hat = resid(LM0)

y.hat = fitted(LM0)

plot(x,     e.hat)
plot(y.hat, e.hat)


  
