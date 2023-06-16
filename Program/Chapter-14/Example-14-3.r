# Read Data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH14TA02.txt"
 Data = read.table(url)
 Xj = Data[,1]
 nj = Data[,2]
 Yj = Data[,3]
 pj = Data[,4]
 Data

# Wrong results
  GLM = glm(Yj~Xj, family=binomial("logit"))

# Correct results (convert binomial obs to Bernoulli obs)
 Yjnj = cbind(Yj,nj-Yj)
 GLM = glm(Yjnj~Xj, family=binomial("logit"))
 summary(GLM)
 
 cbind(Data, fitted(GLM))

# Plot
 plot(Xj, pj, xlim=c(0,40), ylim=c(0,1))
 b = coef(GLM)
 curve( exp(b[1]+b[2]*x)/(1+exp(b[1]+b[2]*x)), 0,40, add=TRUE)

