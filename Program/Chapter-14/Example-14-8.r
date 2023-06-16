# Read Data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH14TA03.txt"
 Data = read.table(url)
 x1 = Data[,2]
 x2 = Data[,3]
 x3 = Data[,4]
 x4 = Data[,5]
 y  = Data[,6]

# GLM
 GLM0 = glm(y~   x2+x3+x4, family=binomial("logit"))
 GLM1 = glm(y~x1+x2+x3+x4, family=binomial("logit"))

 D = deviance(GLM0) - deviance(GLM1)
 D

 qchisq(0.95, df=1)

 # p-value
 1-pchisq( D, df=1)

# GLM
 GLM0 = glm(y~x1+x2+x3+x4, family=binomial("logit"))
 GLM1 = glm(y~x1+x2+x3+x4+I(x1*x2)+I(x1*x3)+I(x1*x4)+I(x2*x4)+I(x3*x4), family=binomial("logit"))
 D = deviance(GLM0) - deviance(GLM1)
 D
 qchisq(0.95, df=5)
 anova(GLM0, GLM1)

