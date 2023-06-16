# 1. Read the data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH06PR15.txt"
 mydata=read.table(url)
 y  = mydata[,1]
 x1 = mydata[,2]
 x2 = mydata[,3]
 x3 = mydata[,4]

# 2. Scatter plot matrix
 colnames(mydata) = c("Satisfaction", "Age", "Severity", "Anxiety")
 pairs (mydata, cex=0.5, pch=1)

# 3. Correlation matrix
cor( mydata )


# 4. Regression of Y on X1, X2, and X3
 LM = lm ( y ~ x1 + x2 + x3 )
 summary(LM)

 anova (LM)

# 5. 90% Confidence interval of the mean response and prediction interval 
#    when X1=35, X2=45, X3=2.2
 new = data.frame( x1=35, x2=45, x3=2.2 ) 
 predict ( LM, newdata=new, interval="confidence", level=0.90)

 
 new = data.frame( x1=35, x2=45, x3=2.2 )
 predict ( LM, newdata=new, interval="prediction", level=0.90)


# 6. Tests for constancy of error variance
 e = resid(LM)
 SSE = sum( e^2 )
 sigma2 = e^2

 LM2 = lm ( sigma2 ~ x1 + x2 + x3 )
 SSR.star = sum( (fitted(LM2)-mean(sigma2))^2 )

 n = length(y)

 cbind(SSR.star, SSE, n)


 X.BP = SSR.star/2 / ( (SSE/n)^2 )

 X.BP


 qchisq(0.99, df = 3) ## chi-square critical value

#
# R function for the  Breusch-Pagan test is also available at
#   https://github.com/AppliedStat/LM
 # 1. Read the data

 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH06PR15.txt"
 mydata=read.table(url)

 y  = mydata[,1]
 x1 = mydata[,2]
 x2 = mydata[,3]
 x3 = mydata[,4]

 # 2. Read Breusch-Pagan test R program
 source("https://raw.githubusercontent.com/AppliedStat/LM/master/Breusch-Pagan.R")

 BP.test ( y ~ x1 + x2 + x3 )




