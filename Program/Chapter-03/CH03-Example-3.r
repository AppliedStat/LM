# If you have "CH01TA01.txt" in your current computer.
# mydata = read.table("S:\\LM\\CH01TA01.txt")

# If your computer is connected to Internet
mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")

 c1 = mydata[,1]
 c2 = mydata[,2]
 LM = lm(c2 ~ c1)

 c3 = resid(LM)
 c4 = fitted(LM)
 c5 = c3^2

 LM2 = lm(c5 ~ c4)
 summary(LM2)


