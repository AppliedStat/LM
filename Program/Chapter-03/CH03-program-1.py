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

x = []
y = []
for line in file:
    p = line.split()
    x.append(float(p[0]))
    y.append(float(p[1]))

#====================================
# (2) Residuals Plot
#====================================
import statsmodels.formula.api as smf
import pandas as pd

data1 = pd.DataFrame({"x":x, "y":y})
lm = smf.ols(formula = 'y ~ x', data = data1).fit()

import matplotlib.pyplot as plt
import statsmodels.api as sm

fitted = lm.predict()
resids = lm.resid
std_resids = lm.resid_pearson

# 4 plots in one window
fig = plt.figure(figsize = (8, 8), dpi = 100)

## raw residuals vs. fitted
ax1 = fig.add_subplot(2, 2, 1)
ax1.plot(fitted, resids,  'o')
l = plt.axhline(y = 0, color = 'grey', linestyle = 'dashed')
ax1.set_xlabel('Fitted values')
ax1.set_ylabel('Residuals')
ax1.set_title('Residuals vs Fitted')

## q-q plot
ax2 = fig.add_subplot(2, 2, 2)
sm.qqplot(std_resids, line='s', ax = ax2)
ax2.set_title('Normal Q-Q')

## scale-location
ax3 = fig.add_subplot(2, 2, 3)
ax3.plot(fitted, abs(std_resids)**.5,  'o')
ax3.set_xlabel('Fitted values')
ax3.set_ylabel('Sqrt(|standardized residuals|)')
ax3.set_title('Scale-Location')

## residuals vs. leverage
ax4 = fig.add_subplot(2, 2, 4)
sm.graphics.influence_plot(lm, criterion = 'Cooks', size = 2, ax = ax4)

plt.tight_layout()
fig.savefig('regplots.png')
