# Read Data
 Yj = c( 6, 13, 18, 28, 52, 53, 61, 60)
 nj = c(59, 60, 62, 56, 63, 59, 62, 60)
 Xj = c(1.6907, 1.7242, 1.7552, 1.7842, 1.8113, 1.8369, 1.8610, 1.8839)
 # Table
 print( cbind(Xj,nj,Yj, nj-Yj, Yj/nj) )


# GLM
 # Using the logistic model
 # Wrong code
 out1 = glm( Yj ~ Xj, family=binomial("logit")  )

 # Correct code
 Yjnj = cbind(Yj,nj-Yj)
 out1 = glm( Yjnj ~ Xj, family=binomial("logit")  )
 summary ( out1 )


 # Fitted values
 fitted( out1 )

# Plot
 coef(out1)

 # Let's save them to b0 and b1
 b0 = coef(out1)[1]
 b1 = coef(out1)[2]

 # For the plot of the fitted pi with the logistic model (fitted logit curve)
 curve( exp(b0+b1*x)/(1+exp(b0+b1*x)), from=min(Xj), to=max(Xj) )

 # Add the plot of proportions at x (without the logitic model). 
 points(Xj, Yj/nj)

