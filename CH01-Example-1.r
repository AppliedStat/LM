#====================================
# (1) Reading Data 
#====================================

# -----------------------------------
# Write the data into C1 and C2 variables directly.
# -----------------------------------
x1 = c(80, 30, 50, 90, 70, 60,120, 80,100, 50,
       40, 70, 90, 20,110,100, 30, 50, 90,110,
       30, 90, 40, 80, 70)
y1 = c(399,121,221,376,361,224,546,352,353,157,
       160,252,389,113,435,420,212,268,377,421,
       273,468,244,342,323)

# -----------------------------------
# From Hard disc
# -----------------------------------
# Note: use ANSI ascii text file. UTF-8 text is not supported.
 mydata = read.table("S:/data/CH01TA01.txt")

# The above is the same as:
# setwd("S:/data")
# mydata = read.table("CH01TA01.txt")

# Double-check if they are read well
x2 = mydata[,1]
y2 = mydata[,2]
cbind(x2,y2)

# -----------------------------------
# From URL
# -----------------------------------
# See the URL: https://github.com/AppliedStat/LM
# If your computer is connected to Internet, then the following should work:
url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt"
mydata = read.table(url)

# Check below
# is.matrix(mydata)
#   is.list(mydata)
# as.matrix(mydata)

# Double-check if they are read well
x3 = mydata[,1]
y3 = mydata[,2]
cbind(x3,y3)

# -----------------------------------
# For convenience,
# -----------------------------------
x = x1
y = y1

#====================================
# (2) Scatter plot
#====================================
# ?Devices
# postscript( "ex1.ps", width=4, height=4 )
# pdf(file="ex1.pdf", width=4, height=4 )
plot(x,y)
dev.off()

# plot with text is optional in R
# It may need to install txtplot package
# install.packages("txtplot")
library("txtplot")
txtplot(x,y)

#====================================
# (3) Parameter estimation
#====================================
lm( y ~ x)
output = lm (y ~ x)
summary(output)
anova(output)

#====================================
# (4) Some Math
#====================================
# To compare with Minitab codes
# NB: Cx (x=1,2,..) are variables in Minitab
C2 = y   # copy of y to C2
C1 = x

C3 = fitted(output)

C4 = C2 - C3
C5 = C4^2

cbind(C1, C2, C3, C4, C5)

C11 = sum(C4)
C12 = sum(C2)
C13 = sum(C3)
C14 = C1*C4
C15 = C3*C4
C16 = C2*C4
C14 = sum(C14)
C15 = sum(C15)
C16 = sum(C16)
C17 = sum(C5)
cbind(C11, C12, C13, C14, C15, C16, C17)

# MSE
sum(C5) / (25-2)
sum ( (y-fitted(output))^2 ) / (25-2)

