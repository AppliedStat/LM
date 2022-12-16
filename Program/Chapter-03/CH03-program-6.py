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

import seaborn as sns
# The below may be needed for install seaborn and pandas (numexpr), etc
# sudo apt-get update -y
# sudo apt-get install -y python3-seaborn
# sudo apt-get install -y python3-pandas
# sudo apt-get install -y python3-numexpr   # latest numexpr is needed for pandas
import numpy as np
import scipy.stats as stats
import pandas as pd

import statsmodels.formula.api as smf
import matplotlib.pyplot as plt

data1 = pd.DataFrame({"c1":c1, "c2":c2})
LM = smf.ols(formula = 'c2 ~ c1', data = data1).fit()

c3 = LM.resid
LM_sum = LM.summary()

# get the residual standard error
squared_sigma = LM.mse_resid
s = squared_sigma ** 0.5

c13 = np.sort(c3)
n = len(c3)

c14 = []
for k in range(1,n+1):
    c11 = (k - 0.375)/(n + 0.25)
    c12 = stats.norm.ppf(c11)
    c14.append(s * c12)
    
c14 = np.asarray(c14)

fig = plt.figure(figsize = (4,4), dpi = 100)
data2 = pd.DataFrame({"c13":c13, "c14":c14})
sns.regplot(x="c14",y="c13",data=data2)
#sns.lmplot(x="c14",y="c13",data=data2)
plt.savefig('ex4a.png')


