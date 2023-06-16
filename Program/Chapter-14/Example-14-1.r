# Read Data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH14TA01.txt"
 Data = read.table(url)
 x = Data[,1]
 y = Data[,2]


# GLM
# Table 14.1
 GLM = glm(y~x, family=binomial("logit"))
 summary(GLM)


cbind(x, y, fitted(GLM), residuals(GLM))



# Plots
 # Figure 14.5
 idx = order(x)
 x = sort(x)
 y = y[idx]
 GLM1 = glm(y~x, family=binomial("logit"))

 plot(x,y)
 lines( x, fitted(GLM1) )
 lines( lowess(x,y), lty=2 )

 # Figure 14.5
 idx = order(x)
 x = sort(x)
 y = y[idx]
 GLM1 = glm(y~x, family=binomial("logit"))

 plot(x,y)
 lines( x, fitted(GLM1) )
 lines( lowess(x,y), lty=2 )

 # Figure 14.6
 GLM2 = glm(y~x, family=binomial("probit"))
 GLM3 = glm(y~x, family=binomial("cloglog"))

 plot(x,y)
 lines( x, fitted(GLM1) )
 lines( x, fitted(GLM2), lty=2 )
 lines( x, fitted(GLM3), col="red" )

