#first we will import the file 
data<-read.csv(file.choose())

#1A
#viewing first 10 rows of data
head(data,10)
#viewing dimension of data(calculating number of rows)
dim(data)
#1B
datamean <- mean(data$Wall.Thickness)
#1C
hist(data$Wall.Thickness)
#1D abline will add straight line to the plots (v for vertical line and h for horizontal line)
abline(v=12.8,col="red")


#2A
s30 <- c()
s50 <- c()
s500 <- c()
n =9000
for ( i in 1:n){
  s30[i] = mean(sample(data$Wall.Thickness,30, replace = TRUE))
  s50[i] = mean(sample(data$Wall.Thickness,50, replace = TRUE))
  s500[i] = mean(sample(data$Wall.Thickness,500, replace = TRUE))
}
hist(s30, col ="blue",main="Sample size=30",xlab ="wall thickness")
abline(v = mean(s30), col = "red")

hist(s50, col ="green", main="Sample size=50",xlab ="wall thickness")
abline(v = mean(s50), col = "red")

hist(s500, col ="red",main="Sample size=500",xlab ="wall thickness")
abline(v = mean(s500), col = "red")


#as we get the good bell shape curve so as we are increasing the sample size the distribution is approaching towards the normal