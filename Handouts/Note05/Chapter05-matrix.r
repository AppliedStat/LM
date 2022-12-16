url= "https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt"
mydata = read.table(url)

## On purpose, I used the same symbols as the minitab variables. 
c1 = mydata[,1]
c2 = mydata[,2]

LM = lm (c2 ~ c1)
c3 = resid(LM)
c4 = fitted(LM)

summary(LM)

k1  = length(c1)
c11 = rep(1,k1)

m1  = cbind(c11, c1) ## m1 = X matrix 

m11 = t(m1)          ## m11 = X' matrix
m2  = m11 %*% m1     ## m2  = X'X  Note: m2 = t(m1) %*% m1
m3  = solve(m2)      ## (X'X)^(-1)

## Check m2 %*% m3. It should give the 2x2 identity matrix.

c5  = m11 %*% c2     ## c5 = X'Y
c6  = m3  %*% c5     ## c6 = (X'X)^(-1) X'Y (beta hat)

m12 = m1  %*% m3     ## m12 = X (X'X)^(-1)
m4  = m12 %*% m11    ## m4  = X (X'X)^(-1) X' (H matrix)

## Check HHHH..... eg.: m4 %*% m4 %*% m4 - m4,
m4 %*% m4 %*% m4 - m4


c44 = m4 %*% c2      ## X (X'X)^(-1) X' Y = Y hat
## Note: In R, we can do the above in a single line.
##       Of course, we can use any alpha-numeric variable names. 
X=m1; Y=c2; c4tmp = X %*% solve( t(X)%*%X ) %*% t(X) %*% Y


## Compare beta's
coefficients(LM)
c6 


## c44 and c4tmp should be the same as the c4
cbind(c44, c4tmp, c4)


c33 = c2 - c4  ## c33 = e hat
cbind(c33,c3)


k11 = sum(c11*c33)  ## 1' * e-hat
k12 = sum(c1 *c33)  ## x1 * e-hat

## The followings should be zero.
c(k11, k12)


