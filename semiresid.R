semiresid = 
function (object) 
{
    resid  = object$residuals
    rdf    = object$df.residual
    stddev = sqrt(sum(resid^2)/rdf)
    resid / stddev
}

