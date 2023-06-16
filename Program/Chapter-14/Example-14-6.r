# Read Data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH14TA01.txt"
 Data = read.table(url)
 x = Data[,1]
 y = Data[,2]

 # Table 14.1
 GLM = glm(y~x, family=binomial("logit"))
 summary(GLM)



