 x1 = c(4,4,4,4, 6,6,6,6)
 x2 = c(2,2,3,3, 2,2,3,3)
 x3 = c(6,6,7,7, 8,9,9,9)
 y  = c(42,39,48,51, 49,53,61,60)

 cor( cbind(x1,x2,x3) )

 LMa = lm( y~x1 )
 LMb = lm( y~x2 )
 LMc = lm( y~x1 + x2 )
 LMd = lm( y~x2 + x1 )
 LMe = lm( y~x1 + x3 )
 LMf = lm( y~x3 + x1 )


# Note
 LMg = lm( y~x3 )

