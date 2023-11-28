#Assignment 4

#Expected value or mean is
#Summation of x*p(x) from 1 to n  or integration of x*f(x) from 0 to inf

#1
x<-c(0,1,2,3,4)
px<-c(0.41,0.37,0.16,0.05,0.01)
#three methods to find expected value/mean when x and f(x) are given
sum(x*px)
weighted.mean(x*px)*length(x) #it finds weighted mean so multiply it by length
c(x%*%px)  #%*% does matrix multiplication


#2
lol<-function(n)
{
  return(n*0.1*exp(-0.1*n))

}
integrate(lol,0,Inf)


#3
#Net profit will be 6x-4(3-x) = 10x-12
#and we know E(y) = 10*E(x)-12
#first we will find expected value of x
Ex <- sum(c(0,1,2,3),c(0.1,0.2,0.2,0.5))
Ey <- 10*Ex -12
print(Ey)


#4
#First moment is E(x) = integration of x * p(x)
#Second moment is E(x^2)=integration of x^2 * p(x)
#Kth moment is E(x^k)=integration of x^k * p(x)
m1<-function(x)
{
  x*0.5*exp(-abs(x))
}
m2<-function(x)
{
  (x^2)*0.5*exp(-abs(x))
}
moment1<-integrate(m1,lower=1,upper=10)
moment2<-integrate(m2,lower=1,upper=10)
#Mean = first moment
#variance = second moment - (Mean^2)
cat("Mean is:",moment1$value,"\n")
cat("Variance is:",moment2$value - (moment1$value^2))


#5
#Since y=x^2 so x=root(y), we will put root(y) in function and change the function and to find for x=3 use y=9
f<-function(y){
  (3/4)*(1/4)**(sqrt(y)-1)
}
print(f(9))

#Now x is given 1,2,3,4,5 so Y will be its squares 1,4,9,16,25 and yk that first moment=  mean = (y*f(y)) and variance = sum(y*y*f(y))-mean^2
x<-c(1:5)
y<-x**2
m1<-sum(y*f(y))
m2<-sum((y*y)*f(y))
m2-m1*m1
