
url = "https://raw.githubusercontent.com/AppliedStat/LM/master/CH01TA01.txt"
mydata = read.table(url)


c1 = mydata[,1]   # X
c2 = mydata[,2]   # Y

# Sort 
par ( mfrow=c(2,1) )
plot(c1,c2)
plot( sort(c1), sort(c2) )

cbind(c1,c2)
cbind( sort(c1), sort(c2) )

# Another Sort 
c1.order = order(c1)
c1s = c1 [ c1.order ]
c2s = c2 [ c1.order ]

cbind(c1s, c2s)

par ( mfrow=c(2,1) )
plot(c1,c2)
plot( c1s, c2s )


# Split into two groups based on x values (smaller x and larger x)

x1a = c1s[1:13]
x1b = c1s[14:25]

y1a = c2s[1:13]
y1b = c2s[14:25]


par ( mfrow=c(2,1) )
plot(c1,c2)

plot(c1,c2, type="n")
points(x1a, y1a, col="blue", pch=1)
points(x1b, y1b, col="red",  pch=2)



