## ==================================================
##  R Function by Chanseok Park
## (MTHSC 805-Clemson University, IE-68722-PNU)
## 
##   PRESS (Prediction sum of squares)
##
## ==================================================

PRESS <- function(object ) {
  press.resid = resid(object) / (1-hatvalues(object));
  sum(press.resid^2);
}

