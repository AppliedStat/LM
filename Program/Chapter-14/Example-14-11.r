# Read Data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH14TA14.txt"
 Data = read.table(url)
 y  = Data[,1]
 x1 = Data[,2]
 x2 = Data[,3]
 x3 = Data[,4]
 x4 = Data[,5]
 x5 = Data[,6]

# GLM
 GLM = glm(y~x1+x2+x3+x4+x5, family=poisson("log"))
 summary(GLM)

# Goodness of fit
 O = y
 E = fitted(GLM)
 G2 = 2*sum(O*log(O/E), na.rm=TRUE)
 G2

 qchisq(1-0.05, 110-6)  # n=110 and p=6


