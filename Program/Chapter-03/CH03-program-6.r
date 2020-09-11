mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")

c1 = mydata[,1]
c2 = mydata[,2]

LM = lm(c2 ~ c1)

c3 = resid(LM)

LM.sum = summary(LM)

attributes(LM.sum)

s = LM.sum[[ "sigma" ]]

c13 = sort(c3)

n = length(c3)

k = 1:n

c11 = (k - 0.375) / (n+0.25)

c12 = qnorm( c11 )

c14 = s * c12

postscript( "ex4a.ps", width=4, height=4)

plot ( c14, c13)
abline(lm(c13~c14))

