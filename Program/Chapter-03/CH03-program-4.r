# First, save the levene.R file at your current directory.
# source("S:/LM/levene.R")

# If your PC is connected to Internet, the following will work:
source("https://raw.githubusercontent.com/AppliedStat/LM/master/levene.R")

mydata = read.table("https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt")

c1 = mydata[,1]
c2 = mydata[,2]

LM = lm(c2 ~ c1)

c3 = resid(LM)

c1.order = order(c1)
c4 = c1 [ c1.order ]
c5 = c3 [ c1.order ]

print( cbind(c1,c3,c4,c5) )

gr1 = c5[1:13]
gr2 = c5[14:25]

levene.test(gr1, gr2)

