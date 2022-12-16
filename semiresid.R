## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)

##  Semi-Studentized 
## ==================================================
semiresid = 
function (object) 
{
    resid  = object$residuals
    rdf    = object$df.residual
    stddev = sqrt(sum(resid^2)/rdf)
    resid / stddev
}

