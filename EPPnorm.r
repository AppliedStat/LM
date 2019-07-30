# See Table 2 of Looney & Gulledge (1985). Am Stistician, v.39, pp.75-70. 

EPPnorm <- function(n, iter=10000, levels, a) { 
  rr = numeric(iter)
  if (missing(levels)) {
     levels=c(0,.005,.010,.025,.050,.100,.250,.500,.750,.900,.950,.975,.990,.995)
  }
  if (missing(a)) { a = ifelse(n <= 10, 3/8, 1/2) }
  for ( i in 1:iter ) { 
      z = rnorm(n) 
      p = ppoints(n,a=a)
      rr[i] = cor( qnorm(p), sort(z) )
  }
  quantile(rr, probs=levels)
}

# Usage: EPPnorm(10, iter=10000, a=3/8)

