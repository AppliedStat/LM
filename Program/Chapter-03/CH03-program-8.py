#!/usr/bin/python3

# If you have " CH01TA01.txt " in your current computer .
# mydata = open("S:/LM/CH01TA01.txt", "r")
# file = mydata.read().splitlines()

# If PC is connected to Internet, then the following works.
from urllib.request import urlopen
link = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH03TA08.txt"
url = urlopen(link)
file = url.read().splitlines()
url.close()

c1 = []
c2 = []
for line in file:
    p = line.split()
    c1.append(float(p[0]))
    c2.append(float(p[1]))

import numpy as np
import pandas as pd
import statsmodels.formula.api as smf

# Implement the boxcox function
def bxcx(y, x, lam):
    n = len(lam)
    sse = []
    k2 = np.exp(np.mean(np.log(y)))
    for i in range(0, n):
        if abs(lam[i])>0.0001:
            k1 = 1/(lam[i]* k2**(lam[i]-1))
            w = k1 * (y**lam[i]-1)
        else:
            w = k2 * np.log(y)
        data = pd.DataFrame({"x":x, "w":w})
        LM = smf.ols(formula = 'w ~ x', data = data).fit() 
        res = LM.resid
        sse.append(sum(res**2))
    return sse
    
lam = np.arange(1.0, -1.1, -0.1)
sse = bxcx(c2,c1,lam)

#cbind = np.vstack((lam, sse))
cbind = pd.DataFrame({"lam":lam, "sse":sse})
print(cbind)

