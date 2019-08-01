## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)
## 
##   VIF (Variance Inflation Factor)
##
##   Usage: LM = lm ( y ~ x1 + x2 + x3 )
##          vif (LM)
## Note: With the help of Dr. Venables
## ==================================================


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

