
# Page 442
Data=read.table("http://www.ces.clemson.edu/~cspark/course/8050/data/CH11TA04.txt")

y  = Data[,2]
X2 = Data[,4]
X3 = Data[,5]


# OLS 
x2 = X2 - mean(X2)

lm(y~x2 + x2^2 ) # the same as lm(y~x2)

LM = lm(y~x2 + I(x2^2) )
summary(LM)
r = resid(LM)

mad(r, constant=1)  # without normal-consistency constant

mad(r)

RLM1 = rlm(y~x2 + I(x2^2), method="M", scale.est="MAD", k2=1.345, maxit=1 )


RLM7 = rlm(y~x2 + I(x2^2), method="M", scale.est="MAD", k2=1.345, maxit=7 )

