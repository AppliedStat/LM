#====================================
# (1) Read Data Set
#====================================

# if you have " CH01TA01.txt " in your current computer .
# mydata = read.table("S:\\LM\\CH01TA01.txt")

# If PC is connected to Internet, then the following works.
  mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")



#====================================
# (2) Residuals Plot
#====================================

  x = mydata[,1]
  y = mydata[,2]
  LM = lm( y ~ x )

  par ( mfrow=c(2,2) )  ## Put four plots into one sheet
  plot(LM)

