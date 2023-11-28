#Assignment 5


#unif is used for uniform distribution (Uniform distribution is a type of probability distribution in which all outcomes are equally likely)
#exp is used for exponential distrubution (Exponential distribution is a continuous probability distribution that often concerns the amount of time until some specific event happens.)
#gamma is used for gamma distrubution (Gamma distribution term is mostly used as a distribution which is defined as two parameters – shape parameter and inverse scale parameter, having continuous probability distribution)
#1
#a)for more than 45 waiting time 
#we know that answer will be (60-45)/60 = 0.25
#answer will be 1-(waiting time less then or equal to 45)
1-punif(45,0,60)
#b)for waiting time between 20 and 30 (10/60) = 0.6
punif(30,0,60)-punif(10,0,60)

#2
#a)for density function at x=3
dexp(3,rate=0.5)

#b) plotting graph
y<-numeric(6)
for(i in 0:5)
{
  y[i]=dexp(i,rate=0.5)
}
plot(0:5,y)
#or can be done by 
x1<-seq(from = 0, to = 5, by = 0.01) 
gr1<-dexp(x1, rate=0.5)
plot(gr1)

#c)probability that it takes atmost 3 hours is
pexp(3,rate=0.5)

#d)graph for cumulative probablities
x<- seq(0,5,by=0.01)
graph2 <- pexp(x,rate=0.5)
plot(graph2)


#e)simulate 1000 exp distribution function
x2<-rexp(1000, rate=0.5) #e
plot(x2)
plot(density(x2))


#3gamma distribution with alpha as shape and scale is 1/rate 
#a)
1-pgamma(1,shape=2,scale=1/3) 

#b) ulta dhundna h so qgamma
qgamma(0.7,shape=2,scale=1/3,lower.tail=FALSE) 