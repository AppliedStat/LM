#!/usr/bin/python3

#====================================
# (1) Reading Data 
#====================================
x = [1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 
     1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 
     1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 
     2009, 2010, 2011, 2012, 2013, 2014, 2015]
y = [7.22, 7.86, 7.25, 7.45, 7.54, 7.11, 6.93, 7.55, 7.51, 7.53,
     7.08, 6.27, 6.59, 7.59, 6.54, 7.24, 6.18, 7.91, 6.78, 6.62,
     6.29, 6.36, 6.78, 5.98, 6.18, 6.08, 5.59, 5.95, 4.32, 4.73,
     5.39, 4.93, 4.63, 3.63, 5.35, 5.29, 4.68] 

#====================================
# (2) Scatter plot
#====================================
import matplotlib.pyplot as plot # https://matplotlib.org/
import numpy as np               # https://www.numpy.org
year = np.array(x).reshape((-1,1))
area = np.array(y).reshape((-1,1))

plot.figure( figsize=(10,10) )
plot.scatter(year, area, c="black" )
# plot.show()

#====================================
# (3) Parameter estimation
#====================================
# https://www.statsmodels.org
# Windows10: C:\> pip install -U statsmodels --user
from statsmodels.formula.api import ols
from statsmodels.stats.anova import anova_lm
import pandas   # https://pandas.pydata.org

# This data structure is needed for  ols and anova_lm
data = pandas.DataFrame({"year": x, "area": y})
model = ols("area~year", data=data) # NB: ols("y~0+x", data)
OUT = model.fit()
print(OUT.summary())

# NB: Compare the following
# ols("area~year", data).fit().summary()
# ols("area~0+year", data).fit().summary()

print(anova_lm(OUT))

#------------------------------------------
# Scatter plot with the fitted line
#------------------------------------------
plot.figure( figsize=(10,10) )
plot.scatter(year, area, c="black" )
plot.plot(year, OUT.fittedvalues, c="red", linewidth=1 )
plot.xlabel("Year")
plot.ylabel("Extended area")
plot.show()
# plot.savefig("ch01-example2a.eps")


#====================================
# (4) To compare with Figure 2 of Witt (2013).
#====================================
# NB: Shorten the data by slicing.
#    (it starts with zero and ends with 34).
data2 = pandas.DataFrame({"yr": x[0:34], "ar": y[0:34]})
model2 = ols("ar~yr", data=data2) # NB: ols("y~0+x", data)
OUT2 = model2.fit()
print(OUT2.summary())
print(anova_lm(OUT2))

#------------------------------------------
# Scatter plot with the fitted line
#------------------------------------------
yr = year[0:34] # NB: slicing (takes 34 observations)
ar = area[0:34] # NB: it starts with zero and ends with 34.
plot.figure( figsize=(10,10) )
plot.scatter(yr, ar, c="black" )
plot.plot(yr, OUT2.fittedvalues, c="red", linewidth=1 )
plot.xlabel("Year")
plot.ylabel("Extended area")
plot.show()
# plot.savefig("ch01-example2b.eps")

