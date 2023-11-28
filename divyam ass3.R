# Assignment 3


#binomial distribution(success or failure)
#dbinom: density
#pbinom: distribution function (It'll give sum of dbinom from 1 to n)
#qbinom: its syntax is qbinom(p,size=,prob=), it will give x(number of things) as an output
#for binomial distribution
#mean = n*p
#variance = n*p*q
#sd = sqrt(n*p*q)

#normal distribution
#pnorm: it calculates what proportion of a normal distribution is less than a given value

#poisson distribution
#ppois: calculates cdf of poissons distribution

#hypergeometric distribution:(The hypergeometric test uses the hypergeometric 
#distribution to measure the statistical significance of having drawn a sample 
#consisting of a specific number of successes (out of total draws) from a 
#population of size containing successes.)
#phyper: calculates cdf for hypergeometric distribution



#1
#probability of x successes out of n is 
# nCx * p^x * q^(n-x)
# where n is total number of trials
#       x is number of successes we need
#       p is probability of individual success
#       q is (1-p) probability of individual failure
#we can use dbinom(x=7,size=12,prob=1/6)+dbinom(x=8,size=12,prob=1/6)+dbinom(x=9,size=12,prob=1/6)
#pbinom(n) will sum all dbinom from 0 to n
#to do the above in R using pbinom
pbinom(9,12,prob=1/6)-pbinom(6,12,prob=1/6)

#2
#pnorm(84,mean=72,sd=15.2) will calculate probability of distribution below 84 so we will subtract this probability from 1 
1-pnorm(84,mean=72,sd=15.2)

#3
#ppois(quantile,mean) it will take two parameters quantile and mean
#mean car arriving every hour is 5 and we need to calculate for 0 cars
ppois(0,5)
#cdf for 50 cars - cdf for 47 cars will give for 48,49,50 cars
ppois(50,50)-ppois(47,50)

#4
#it is hypergeometric distribution so its syntax is
#suppose sample is collected from whole population ;)
#d(how much success we need in sample,number of success in whole population,number of failure in whole population,size of sample taken)
dhyper(3,17,233,5)


#5
#it is binomial distribution question as its talking about success and failure
#to plot probability mass function we will use dbinom
pmf<-numeric(31)
for(i in 1:31)
{
  pmf[i]=dbinom(i,size=31,prob=0.447)
}
plot(1:31,pmf)
#to plot cdf we will use pbinom
pdf<-numeric(31)
for(i in 1:31)
{
  pdf[i]=pbinom(i,size=31,prob=0.447)
}
plot(1:31,pdf,type="l")
#for binomial distribution
#mean = n*p
#variance = n*p*q
#sd = sqrt(n*p*q)
mean<-31*0.447
variance<-31*0.447*(1-0.447)
sd<-sqrt(variance)
print(mean)
print(variance)
print(sd)
# Simulate a random sample of X values
samples <- rbinom(10000, size = 31, prob = 0.447)
mean_X <- mean(samples)
variance_X <- var(samples)
standard_deviation_X <- sd(samples)

#Binom is used when we have success and failure and we have to find how many successes we will get in n trials
#Poisson is used when we have to find probability of something happening in a given time interval
#Hypergeometric is used when we have to find the probability of something happening but we are given probability of a sample
#Normal is used when we have to find probability of something happening in a given time interval but we are given mean and sd