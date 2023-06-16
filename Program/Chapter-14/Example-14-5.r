# Read Data
 url = "https://raw.githubusercontent.com/AppliedStat/LM/master/APPENC11.txt"
 Data = read.table(url)
 y = Data[,2]
 x =  log(Data[,3])
 idx = order(x)
 x = sort(x)    # sort x
 y = y[idx]     # sort y according to the order of x
 x = x - mean(x)
 x2 = x^2

# GLM
 # Table 14.5 on Page 576
 GLM1 = glm( y ~ x , family=binomial("logit"))
 summary(GLM1)

# Plots
 par( mfrow=c(1,2) )
 # Figure 14.9 (a)
 plot(x,y)
 lines( x, fitted(GLM1) )
 lines(lowess(x,y), lty=2)
 # Figure 14.9 (b)
 # GLM2 = glm( y ~ x + x2 , family=binomial("logit")) # OK
 #        glm( y ~ x + x^2, family=binomial("logit")) # Wrong
 GLM2 = glm( y ~ x + I(x^2) , family=binomial("logit")) # OK
 summary(GLM2)
 
 # Figure 14.9 (b)
 plot(x,y)
 lines(lowess(x,y), lty=2)
 xx = seq(min(x), max(x), l=50)
 yy = predict(GLM2, type="response", data.frame(x=xx) )
 lines( xx, yy )

