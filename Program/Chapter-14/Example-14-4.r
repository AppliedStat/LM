# Read Data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH14TA03.txt"
 Data = read.table(url)
 x1 = Data[,2]
 x2 = Data[,3]
 x3 = Data[,4]
 x4 = Data[,5]
 y  = Data[,6]

# GLM
 # Table 14.3
 GLM = glm(y~x1+x2+x3+x4, family=binomial("logit"))
 # Table 14.4 (a)
 summary(GLM)

 cbind( Data[,2:6], fitted(GLM) )

 # Table 14.4 (a) Estimated Odds Ratio
  exp( coef(GLM)[-1] )

 # Table 14.4 (b) Estimated variance-covariance matrix
 vcov(GLM)
