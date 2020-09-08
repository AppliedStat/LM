#!/usr/bin/python3

import pandas as pd
import statsmodels.formula.api as smf

x = [80,  220, 140, 120, 180, 100, 200, 160]
y = [0.60, 6.70, 5.30, 4.00, 6.55, 2.15, 6.60, 5.75]

data1 = pd.DataFrame({"x":x, "y":y})
LM = smf.ols(formula = 'y ~ x', data = data1).fit()
c3 = LM.fittedvalues
c4 = c3 ** 2
c5 = LM.resid #Residuals

data2 = pd.DataFrame({"c3":c3, "c4":c4, "c5":c5})
LM2 = smf.ols(formula = 'c5 ~ c3 + c4', data = data2).fit()
print(LM2.summary())

