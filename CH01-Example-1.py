#!/usr/bin/python3

#====================================
# (1) Reading Data 
#====================================

# -----------------------------------
# Write the data into x1 and y1 variables directly.
# -----------------------------------
x1 = [ 80, 30, 50, 90, 70, 60,120, 80,100, 50,
       40, 70, 90, 20,110,100, 30, 50, 90,110, 
       30, 90, 40, 80, 70 ]
y1 = [399,121,221,376,361,224,546,352,353,157,
      160,252,389,113,435,420,212,268,377,421, 
      273,468,244,342,323 ]

# -----------------------------------
# Read From Hard disc and write into x2 and y2
# -----------------------------------
f = open("S:/data/CH01TA01.txt", "r")
file2 = f.read().splitlines()
print(file2)
f.close()

# Write the data in the file into x2 and y2 variables
x2 = []; y2 = []  # Make space for the data 

for line in file2[0:]:
    p = line.split()
    x2 = x2 + [float(p[0])]
    y2 = y2 + [float(p[1])]

# Double-check if they are read well
for i in range(len(x2)): 
    print(x2[i],y2[i])    

# -----------------------------------
# From URL
# -----------------------------------
# See the URL: https://github.com/AppliedStat/LM
# If your computer is connected to Internet, then the following should work:
from urllib.request import urlopen
link = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt"
url  = urlopen(link) 
file3= url.readlines()
print(file3)
url.close()

# Write the data in the file into x3 and y3 variables
x3 = []  # Make space for the data 
y3 = []  # Make space for the data 
for line in file3[0:]:
    p = line.split() 
    x3 = x3 + [float(p[0])]
    y3 = y3 + [float(p[1])]
#   y3 += [float(p[1])]      # Same as the above
#   y3.append(float(p[1]))

# Double-check if they are read well
print(x3) 
print(y3)
for i in range(len(x3)): 
    print(x3[i],y3[i])    

# -----------------------------------
# For convenience,
# -----------------------------------
x = x1
y = y1

#====================================
# (2) Scatter plot
#====================================
import matplotlib.pyplot as plot # https://matplotlib.org/
# Windows10: C:\> pip install matplotlib
# The below may be needed for upgrading pip.
# Windows10: C:\> python -m pip install  --upgrade pip  --user

plot.figure( figsize=(10,10) )
plot.scatter(x, y, c="black" )
# plot.savefig("ch01-example1.eps")
plot.show()

#====================================
# (3) Parameter estimation
#====================================
# https://www.statsmodels.org
# Windows10: C:\> pip install -U statsmodels --user
from statsmodels.formula.api import ols   
from statsmodels.stats.anova import anova_lm
import pandas  # https://pandas.pydata.org

# This data structure is needed for ols and anova_lm
data = pandas.DataFrame({"x": x, "y": y})

model = ols("y~x", data) # NB: ols("y~0+x", data)
OUT = model.fit()
OUT.summary()

# NB: Compare the following
# ols("y~  x", data).fit().summary()
# ols("y~0+x", data).fit().summary()
anova_lm(OUT)

#====================================
# (4) Some Math
#====================================
# To compare with Minitab codes
# NB: Cx (x=1,2,..) are variables in Minitab
C2 = y
C1 = x

C3 = OUT.fittedvalues

C4 = C2 - C3
C5 = C4**2

for i in range(len(C1)):   # ugly
    print(C1[i],C2[i],C3[i],C4[i],C5[i])

for i in range(len(C1)):   # better 
    print("%5d %5d %10.5f %10.5f %10.5f" %(C1[i],C2[i],C3[i],C4[i],C5[i]))

C11 = sum(C4)
C12 = sum(C2)
C13 = sum(C3)

import numpy as np  # We need np.multiply from numpy (https://www.numpy.org/)
# Windows10: C:\> pip install -U numpy 
C14 = np.multiply(C1,C4)
C15 = np.multiply(C3,C4)
C16 = np.multiply(C2,C4)

C14 = sum(C14)
C15 = sum(C15)
C16 = sum(C16)
C17 = sum(C5)

print(C11, C12, C13, C14, C15, C16, C17)   # ugly
print((" %11.7G"*7) %(C11, C12, C13, C14, C15, C16, C17))  # better

