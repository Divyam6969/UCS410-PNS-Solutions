#Assignment 2

#1 
#Sample function will take these arguments sample(x=,size=,replace=,prob=)
#x will be the vector, size will be the output size, replace=TRUE will allow to take repeated values, and prob will take a vector of probabiloity weights of each vector
#sample(x=c("Gold","Silver","Bronze"),size=10,replace=TRUE,prob=c(20,30,50))
coins <- c(rep("gold", 20), rep("silver", 30), rep("bronze", 50))
sample_space <- sample(coins, 10, replace = FALSE)
print(sample_space)
q2 <- sample(x=c("success","failure"),replace=TRUE,size=10,prob=c(90,10))
print(q2)


#2
#question2 can be done in 2 ways
#one way is actually solving it and another way is simulating it
#actual solving is 
#there are n people so probability of two people having birthday on same date is
# 1 - probability(No two people having birthday on same day)
# 1 - ((365/365)*(364/365)*(363/365)*.....(365-(n-1))/365)
# 1 - product(k=0 to n-1)[(365-k)/365]
prob1 <- 1
n <- 100
for(k in 0:n-1)
{
  prob1 = prob1 * ((365-k)/365)
}
print(1-prob1)
#Another method is sampling 
#we will take different values of n and we will take a sample of n size 1000 times and check that how many of my samples out of 1000 has repeating birthday then we will plot graph
calc <- function(n) {
  count <- 0
  for (i in 1:1000) {
    lolsample <- sample(1:365, size = n, replace = TRUE)
    if (length(lolsample) != length(unique(lolsample))) {
      count <- count + 1
    }
  }
  prob <- count / 1000
  return(prob)
}
n <- 1000  # Doing it for 1000 values of n
y <- numeric(n)  # Initialize an empty numeric vector to store results
smallest<-0
flag<- 0 
for (i in 1:n) {
  y[i] <- calc(i)  # Assign the result to the ith element of 'y'
  if(calc(i)>=0.5 & flag==0)
  {
    smallest<-i
    flag =1
  }
}
plot(x = 1:1000, y, type = "l", xlab = "No. of people", ylab = "Probability")
cat("Smallest value of n for which prob>=0.5 is",smallest)


#3
#P(A union B) = P(A) + P(B) - P(A intersection B)
#Conditional probability of A dependent on B
#P(A/B) = P(A intersection B) / P(B)
#Conditional probability of B dependent on A
#P(B/A) = P(A intersection B) / P(A)
#So comparing above two equations we get P(A/B)*P(B) = P(B/A)*P(A)
#So now (P(A/B)*P(B))/P(A)=P(B/A)
#In the given question
#P(cloud) = 0.4
#P(rain) = 0.2
#P(cloud on rainy day) = 0.5
#P(rain on cloudy day) = ?
# answer will be P(cloud on rainy day) * P(rainy)/P(cloudy)
conditional_probability <- function(p_rain, p_cloudy_given_rain, p_cloudy) {
  p_rain_given_cloudy <- (p_cloudy_given_rain * p_rain) / p_cloudy
  return(p_rain_given_cloudy)
}
p_cloudy <- 0.4   # Probability of it being cloudy
p_rain <- 0.2     # Probability of rain on a given day
p_cloudy_given_rain <- 0.85  # Probability of clouds on a rainy day
# Calculate the conditional probability of rain given that it's cloudy
probability_rain_given_cloudy <- conditional_probability(p_rain, p_cloudy_given_rain, p_cloudy)
# Print the result
cat("The probability of rain given that it's cloudy is:", probability_rain_given_cloudy)


#4
#to load iris dataset
data(iris)
#head(iris) will print first 6 rows of dataset by default and if we write head(iris,n) it will print first n rows
head(iris) 
#to print stucture of iris
str(iris)
#to find range of sepal length of iris flowers
range(iris$Sepal.Length)
#to find mean of sepal length of iris flowers
mean(iris$Sepal.Length)
#to find median of sepal length of iris flowers
median(iris$Sepal.Length)
#quantile
q1<-quantile(iris$Sepal.Length,prob=0.25)
q3<-quantile(iris$Sepal.Length,prob=0.75)
iqR<-q1-q3
cat("Q1:",q1," Q3:",q3," IQR",q3-q1)
#standard deviation
sd(iris$Sepal.Length)
#variance
var(iris$Sepal.Length)
#summary 
summary(iris)
#to find mod
#we can use tables function which will create a table of values and freq
#after creating table sort them in decreasing order
#then take first value of that sorted table
#now take the names of that first value it will be the mod
names(sort(table(iris$Sepal.Length),decreasing=TRUE)[1])
mode <- as.numeric(names(sort(table(iris$Sepal.Length),decreasing=TRUE)[1]))
print(mode)


#extra questions
#find mean of all sepal length whose length is in interquantile range
# Calculate the interquartile range for sepal length
quartiles <- quantile(iris$Sepal.Length, probs = c(0.25, 0.75))
lower_bound <- quartiles[1]
upper_bound <- quartiles[2]
# Filter the dataset to include only rows within the interquartile range
sepal_length_within_iqr <- subset(iris, Sepal.Length >= lower_bound & Sepal.Length <= upper_bound)
# Calculate the mean of sepal length within the interquartile range
mean_sepal_length_within_iqr <- mean(sepal_length_within_iqr$Sepal.Length)
mean_sepal_length_within_iqr

