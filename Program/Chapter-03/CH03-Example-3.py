#!/usr/bin/python3

#====================================
# (1) Read Data Set
#====================================
# If you have " CH01TA01.txt " in your current computer .
# mydata = open("S:/LM/CH01TA01.txt", "r")
# file = mydata.read().splitlines()

# If PC is connected to Internet, then the following works.
from urllib.request import urlopen
link = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt"
url = urlopen(link)
file = url.read().splitlines()
url.close()

c1 = []
c2 = []
for line in file:
    p = line.split()
    c1.append(float(p[0]))
    c2.append(float(p[1]))

#====================================

#====================================
import pandas as pd
import statsmodels.formula.api as smf

data1 = pd.DataFrame({"c1":c1, "c2":c2})
LM = smf.ols(formula = 'c2 ~ c1', data = data1).fit()

c3 = LM.resid
c4 = LM.fittedvalues
c5 = c3 ** 2

data2 = pd.DataFrame({"c4":c4, "c5":c5})
LM2 = smf.ols(formula = 'c5 ~ c4', data = data2).fit()
print(LM2.summary())
