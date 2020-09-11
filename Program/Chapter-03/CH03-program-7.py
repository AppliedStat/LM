#!/usr/bin/python3

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
    c1.append(int(p[0]))
    c2.append(int(p[1]))

import numpy as np
import scipy.stats as stats
import pandas as pd
import statsmodels.formula.api as smf

data1 = pd.DataFrame({"c1":c1, "c2":c2})
LM = smf.ols(formula = 'c2 ~ c1', data = data1).fit()

c3 = LM.resid
LM_sum = LM.summary()

squared_sigma = LM.mse_resid
s = squared_sigma ** 0.5

c13 = np.sort(c3)
n = len(c3)

c11 = [(k - 0.375)/(n + 0.25) for k in range(1,n+1)]

c12 = stats.norm.ppf(c11)
c14 = s * c12 

cor1 = np.corrcoef(c13, c14)
print(cor1)

a = 3/8
m = len(c13)

# pp is written by ourselves, equivalent to ppints in R
pp = [(i-a)/(m+1/4) for i in range(1, m+1)]

qq = stats.norm.ppf(pp)
cor2 = np.corrcoef(c13, qq)
print(cor2)
