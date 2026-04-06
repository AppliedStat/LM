mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")

c1 = mydata[,1]
c2 = mydata[,2]

LM = lm(c2 ~ c1)

e  = resid(LM)

sigma2 = e^2

LM2 = lm ( sigma2 ~ c1 )

SSR.star = sum( (fitted(LM2)-mean(sigma2))^2 )

sum( resid(LM)^2 )
# SSE = sum( (c2-fitted(LM))^2 )

n = length(c2)

cbind(SSR.star, SSE, n)

X.BP = SSR.star/2 / ( (SSE/n)^2 )

X.BP

qchisq(0.95, df = 1) ## chi-square critical value

