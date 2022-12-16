 mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")

 x = mydata[,1]
 y = mydata[,2]
 dim(mydata)

 lm( y ~ x)

 output = lm (y ~ x)

 summary(output)

 anova(output)

