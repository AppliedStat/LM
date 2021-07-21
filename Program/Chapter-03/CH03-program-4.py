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

c3 = LM.resid

c1 = np.asarray(c1)
c3 = np.asarray(c3)
c1_order = np.argsort(c1, kind = 'stable')
c4 = c1[c1_order]
c5 = c3[c1_order]

# cbind = np.vstack((c1, c3, c4, c5))
cbind = pd.DataFrame({"c1":c1, "c2":c2, "c3":c3, "c4":c4})
print(cbind)

gr1 = c5[0:13]
gr2 = c5[13:25]

w, p = stats.levene(gr1, gr2)
print(p)
