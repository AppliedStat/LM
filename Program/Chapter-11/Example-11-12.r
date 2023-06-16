# Example 2: Math Proficiency with (X2, X3, X4). Page 447
 
# Page 442
Data=read.table("http://www.ces.clemson.edu/~cspark/course/8050/data/CH11TA04.txt")

y  = Data[,2]
X2 = Data[,4]
X3 = Data[,5]
X4 = Data[,6]

LM = lm(y~ X2 +  X3 + X4)

RLM8 = rlm(y~ X2 +  X3 + X4, wt.method="case", 
        method="M", scale.est="MAD", k2=1.345, maxit=8)


