## ==================================================
## 
## R Function (MTHSC 805, by C. Park)
##   PRESS (Prediction sum of squares)
##
## ==================================================

PRESS <- function(object ) {
  press.resid = resid(object) / (1-hatvalues(object));
  sum(press.resid^2);
}

