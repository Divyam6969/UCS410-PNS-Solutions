#Assignment 1

#1
vector<-c(5,10,15,20,25,30)
print(max(vector))
print(min(vector))
#or we could've done it using sequence
lol<-seq(5,30,5)
print(max(lol))
print(min(lol))
#seq has these arguments seq(from=,to=,by=,length.out=,along.width=)
#length.out will take a number as an argument for eg
div1<-seq(0,10,length.out=4) #this will create (0,3.33,6.67,10)
#similarly along.width will take a vector as an argument and print a sequence of same legnth as that vector


#2
#remember if we have to use return write it like return(1) or return(ans) ;) dont forget the brackets
divyam<-function(n)
{
  if(n<0)
  {
    print("number is negative")
  }
  else if(n==0)
  {
    print(1)
  }
  else
  {
    ans = 1
    for(i in 1:n)
    {
      ans = ans*i
    }
    print(ans)
  }
}
divyam(0)


#3
#to take input there are two ways readline() and scan()
#if we're using readline it will take input as a string the we will have to convert it for eg.
#rollNo<-readline("Number enter croww")
#rollNo<-as.numeric(rollNo)
fibonacci<-function(n)
{
  if(n==0)
  {
    return(0)
  }
  else if(n==1)
  {
    return(1)
  }
  else
  {
    return(fibonacci(n-1)+fibonacci(n-2))
  }
}
n<-readline("Enter the number: ")
n<-as.numeric(n)
for(i in 0:n)
{
  print(fibonacci(i))
}

#Above has so much time complexity we can do it using dp
fibonacci <- function(n) {
  if (n <= 0) {
    return(NULL)
  }
  if (n == 1) {
    return(c(0))
  }
  # Initialize an array to store Fibonacci numbers
  fib <- numeric(n)
  fib[1] <- 0
  fib[2] <- 1
  # Calculate Fibonacci numbers using dynamic programming
  for (i in 3:n) {
    fib[i] <- fib[i - 1] + fib[i - 2]
  }
  return(fib)
}
# Specify 'n' to get the Fibonacci series up to n numbers
n <- 10
result <- fibonacci(n)
cat(paste("Fibonacci series up to", n, "numbers:", toString(result)))


#4
#modulus(%%), exponent(^), integer division(%/%)
cat("Welcome to the divyams calculator ;)\nEnter + to add\nEnter - to subtract\nEnter / to divide\nEnter * to multiply\nEnter exit to exit")
while(TRUE)
{
  op <- readline("Enter the operator: ")
  if(op=="exit")
  {
    break
  }
  a <- readline("Enter a: ")
  b <- readline("Enter b: ")
  a <- as.numeric(a)
  b <- as.numeric(b)
  if(op=="+")
  {
    print(a+b)
  }
  if(op=="-")
  {
    print(a-b)
  }
  if(op=="/")
  {
    print(a/b)
  }
  if(op=="*")
  {
    print(a*b)
  }
}


#5
#BarPlot
help("barplot")
#we use "names.arg" to label bars on x-acis
# Data
marks <- c(88, 89, 96, 97, 93)
# Create a barplot
barplot(marks, names.arg = 1:length(marks), xlab = "Students", ylab = "Marks")

#Plot
x<-rnorm(100)
y<-rnorm(100)
#rnorm(n) will create random n numbers whereas runif(n,a,b) will create random n numbers between a and b 
plot(x,y,xlab="year",ylab="money",main = "Graph ;)")

#piechart
labels<-c("divyam","shawn","justin","gustav")
values<-c(20,25,34,76)
pie(values,labels=labels)

#histogram (it will print values vs frequence)
help("hist")
x <- c(21, 23, 56, 90, 20, 7, 94, 12,
       57, 76, 69, 45, 34, 32, 49, 55, 57)
hist(x, main = "Histogram of Vector x",xlab = "Values",col.lab = "darkgreen",col.main = "darkgreen")




