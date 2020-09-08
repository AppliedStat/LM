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
import pandas as pd
import scipy.stats as stats
import statsmodels.formula.api as smf

data1 = pd.DataFrame({"c1":c1, "c2":c2})
LM = smf.ols(formula = 'c2 ~ c1', data = data1).fit()

e = LM.resid
sigma2 = e**2
data2 = pd.DataFrame({"c1":c1, "sigma2":sigma2})
LM2 = smf.ols(formula = 'sigma2 ~ c1', data = data2).fit()
SSR_star = sum((LM2.fittedvalues-np.mean(sigma2))**2)
SSE = sum((LM.fittedvalues-c2)**2)
n = len(c2)

cbind = pd.DataFrame({"SSR_star":SSR_star, "SSE":SSE, "n":n}, index = [0])
print('\nData Display of SSR_star,SSE and n:') 
print(cbind) 

X_BP = SSR_star/2/((SSE/n)**2)
print('\nX_BP:')
print(X_BP)

qchisq = stats.chi2.ppf(0.95, df=1)
print('\n qchisq:')
print(qchisq)

