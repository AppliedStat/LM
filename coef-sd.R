## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)
## 
##   coef.sd (extracts standardized model coefficients. 
##
##   Usage: LM = lm ( y ~ x1 + x2 + x3 )
##          coef.sd(LM) # standardized betas
## 
##    Note: coef(LM)    # ordinary betas
## ==================================================

coef.sd <- function(object,...) UseMethod("coef.sd")
coef.sd.default <- function(object,...) stop("No default method for vif. Sorry.")

## standardized Betas
coef.sd.lm.old <- 
function (object) {
    # b = coef(object)[-1]
    b =  object$coefficients[-1]
    sx = sd(object$model[-1])
    sy = sd(object$model[1])
    b.star = b * sx / sy
    return(b.star)
}

## standardized Betas
coef.sd.lm <- 
function (object) {
    # b = coef(object)[-1]
    b =  object$coefficients[-1]
    ## sx = sd( as.matrix(object$model[-1]) )
    tmp = as.matrix(object$model[-1]) 
    sx = apply(tmp, 2, sd)
    sy = sd( as.matrix(object$model[1]) )
    b.star = b * sx / sy
    return(b.star)
}

