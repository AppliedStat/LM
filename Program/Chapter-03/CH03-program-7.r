# Using Normal Probability Plot
mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")
c1 = mydata[,1]
c2 = mydata[,2]
LM = lm(c2 ~ c1)
c3 = resid(LM)
LM.sum = summary(LM)
s = LM.sum[[ "sigma" ]]
c13 = sort(c3)
n = length(c3)
k = 1:n
c11 = (k - 0.375) / (n+0.25)
c12 = qnorm( c11 )
c14 = s * c12

cor(c13, c14)


# Using Q-Q plot
pp = ppoints(c13, a=3/8)   # option "a=3/8=0.375" gives (k-0.375)/(n+0.25)
qq = qnorm(pp)
cor(c13, qq)

