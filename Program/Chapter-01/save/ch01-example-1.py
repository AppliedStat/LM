#!/usr/bin/python3

#------------------------------------
# Reading Data from URL
#------------------------------------
from urllib.request import urlopen

link = "https://raw.githubusercontent.com/statpnu/LM/master/CH01TA01.txt"
url  = urlopen(link) 
file = url.readlines()
url.close()

x=[]; y=[]  # Make spaces for x and y
for line in file[0:]:
    p = line.split() 
    x = x + [float(p[0])]
    y = y + [float(p[1])]
    
#------------------------------------
# Scatter plot
#------------------------------------
import matplotlib.pyplot as plot # https://matplotlib.org/
# If not installed on Windows 10, try: C:\> pip install matplotlib

plot.figure( figsize=(10,10) )
plot.scatter(x, y, c="black" )
# plot.show()

#------------------------------------
# Parameter estimation
#------------------------------------
# https://www.statsmodels.org
from statsmodels.formula.api import ols
from statsmodels.stats.anova import anova_lm
import pandas  # https://pandas.pydata.org

# This data structure is needed for anova_lm
data = pandas.DataFrame({"x": x, "y": y})

model = ols("y~x", data) # NB: ols("y~0+x", data)
OUT = model.fit()
OUT.summary()

# NB: Compare the following
# ols("y~  x", data).fit().summary()
# ols("y~0+x", data).fit().summary()

anova_lm(OUT)

