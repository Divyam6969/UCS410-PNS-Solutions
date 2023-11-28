#1 it is given that it is t distribution
#use rt(n,df) to generate distribution with n values and given df
#as df = n-1 so df = 99
lol<-rt(100,99)
hist(lol,main="Histogram")

#2 it is given that it is chi square distribution (use rchisq(n.df))
hist(rchisq(100,2))
hist(rchisq(100,10))
hist(rchisq(100,25))

#3
x<-seq(-6,6,length=100)
dt(x,1)
dt(x,4)
dt(x,10)
dt(x,30)

plot(x,dt(x,30),type = "l",col="red")
lines(x,dt(x,1),type = "l",col = "green")
lines(x,dt(x,4),type = "l",col = "pink")
lines(x,dt(x,10),type = "l",col = "blue")


#4 its given that the distribution is f distribution
#a To find the 95th percentile of the F-distribution with (10, 20) degrees of freedom.
df(.95,10,20)

#b To calculate the area under the curve for the interval [0, 1.5] and the interval [1.5, +∞) of
# F-curve with v1 = 10 and v2 = 20 (USE pf()).
pf(1.5,10,20,lower.tail = TRUE)
pf(1.5,10,20,lower.tail = FALSE)

#c To calculate the quantile for a given area (= probability) under the curve for a F-curve with v1 = 10 and v2 = 20 that corresponds to q = 0.25, 0.5, 0.75 and 0.999. (use the qf())
qf(0.25,10,20)
qf(0.5,10,20)
qf(0.75,10,20)
qf(0.999,10,20)

#generate 1000 values and make histogram
hist(rf(1000,10,20))
