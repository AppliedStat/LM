## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)
## 
##   Collections of Linear Model Diagnostic Tools
## ==================================================

# ---------------------------------------------------
# MSE
# Usage: LM = lm ( y ~ x1 + x2)
#        MSE (LM)
MSE =
function (object)
{
    deviance(object)/df.residual(object)
}


# ---------------------------------------------------
# Semi-studentized Residuals
# Usage: LM = lm ( y ~ x1 + x2)
#        semiresid (LM)
semiresid =
function (object)
{
    stddev = sqrt( deviance(object)/df.residual(object) )
    resid(object) / stddev
}

# ---------------------------------------------------
PRESS <- function(object ) {
  press.resid = resid(object) / (1-hatvalues(object));
  sum(press.resid^2);
}

# ---------------------------------------------------
vif <- function(object, ...)
UseMethod("vif")

vif.default <- function(object, ...)
stop("No default method for vif.  Sorry.")

vif.lm <- function(object, ...) {
  V <- summary(object)$cov.unscaled
  Vi <- crossprod(model.matrix(object))
        nam <- names(coef(object))
  if(k <- match("(Intercept)", nam, nomatch = F)) {
                v1 <- diag(V)[-k]
                v2 <- (diag(Vi)[-k] - Vi[k, -k]^2/Vi[k,k])
                nam <- nam[-k]
        } else {
                v1 <- diag(V)
                v2 <- diag(Vi)
                warning("No intercept term detected. Results may surprise.")
        }
        structure(v1*v2, names = nam)
}

