set.seed(1)

par( mfrow=c(2,2) )
## ==============================================
## When normal samples used with qnorm 

nn = rnorm(500)
hist(nn)

qqnorm(nn)
qqline(nn, col = 2)

# the same as the above.
pp = ppoints(nn)
qq = qnorm(pp) 
nn.sort = sort(nn)
plot( qq, nn.sort,  xlab="theoretical quantiles" )
abline( lm( nn.sort ~ qq),  col="red" )

## ==============================================
## When beta-dist samples used with qqnorm
## beta-dist has lighter tails than normal dist. 

par( mfrow=c(2,2) )
bb = rbeta(500, 3,3)
hist(bb)

qqnorm(bb)
qqline(bb, col = 2)


## ==============================================
## When t-dist. samples used with qnorm 
## two distributions do not match (t-dist havier than norm)
set.seed(1)
par( mfrow=c(2,2) )

cc = rt(500, df=3)
hist(cc)

qqnorm(cc)
qqline(cc, col = 2)

pp = ppoints(cc)
qq = qnorm(pp) 
cc.sort = sort(cc)
plot( qq, cc.sort,  xlab="theoretical quantiles" )
abline( lm( cc.sort ~ qq),  col="red" )


## ==============================================
## When t-dist. samples used with qt 
## two distributions do match (t-dist and qt)
## almost linear
qqt = qt(pp, df=3)
plot( qqt, cc.sort,  xlab="theoretical quantiles" )
abline( lm( cc.sort ~ qqt),  col="red" )




