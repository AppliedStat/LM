
x = 1:10
y0 = c(1.7, 3.2, 4.1, 4.9, 5.5, 7, 8.1, 8.9, 10.1, 11)

y1=y0 ; y1[10]=8;
y2=y0 ; y2[10]=6;
y3=y0 ; y3[10]=4;
y4=y0 ; y4[10]=2;

LM0 = lm(y0~x)
LM1 = lm(y1~x)
LM2 = lm(y2~x)
LM3 = lm(y3~x)
LM4 = lm(y4~x)




# Robust Regression
# See http://www.r-bloggers.com/installing-r-packages/ 
library("MASS")

RLM0 = rlm(y0~x)
RLM1 = rlm(y1~x)
RLM2 = rlm(y2~x)
RLM3 = rlm(y3~x)
RLM4 = rlm(y4~x)



#-------------------------------------------------------
par( mfrow=c(1,2) )
#-------------------------------------------------------
plot(x,y0, xlim=c(0,10))
abline(LM0, lty=1, col="blue")
abline(LM1, lty=2)
abline(LM2, lty=2)
abline(LM3, lty=2)
abline(LM4, lty=2)
#-------------------------------------------------------
plot(x,y0, xlim=c(0,10))
abline( LM0, lty=1, col="blue")
abline(RLM0, lty=2, col="red")
abline(RLM1, lty=2)
abline(RLM2, lty=2)
abline(RLM3, lty=2)
abline(RLM4, lty=2)

