#to use integral2 we will have to install a library package called pracma
install.packages("pracma")

#to attach this package do
library("pracma")


#if a function is join probability distribution its integration over integrate(function)dxdy = 1 over the given range
#1A
fun<-function(x,y)
{
  return((4*x+6*y)/5)
}

val<-integral2(fun,xmin=0,xmax=1,ymin=0,ymax=1)
#and since val = 1 so we can say that it is joint probability distribution

#1B to find marginal distribution at x
newfunc<-function(y)
{
  return(fun(1,y))
}
marg_x<-integrate(newfunc,0,1)

#1C to find marginal distribution at y
newfunc2<-function(x)
{
  return(fun(x,0))
}
marg_y<-integrate(newfunc2,0,1)

#1D
#in finding expectance we will multiply xy with function(x,y)
funcbitch<-function(x,y){
  return (x*y*(4*x+6*y)/5)
}
ans<-integral2(funcbitch,xmin=0,xmax=1,ymin=0,ymax=1)
print(ans)



#2A
funclol <- function(x,y){
  return ((x+y)/30)
}
jointWaaliMatrix <- matrix(c(funclol(0,0:2),funclol(1,0:2),funclol(2,0:2),funclol(3,0:2)),nrow = 4,ncol = 3,byrow=TRUE)
jointWaaliMatrix
#2B
sum(jointWaaliMatrix)
#and since sum is 1 we can say that it is joint probability mass function

#2C,2D Marginal distrubition is sum of rows or sum of values of colums
#in apply function first it will take matrix second it will take 1 for rowwise and 2 for column wise 
apply(jointWaaliMatrix,1,sum)
apply(jointWaaliMatrix,2,sum)

#2E conditional probability at x=0 and y=1
jointWaaliMatrix[1,2]/apply(jointWaaliMatrix,2,sum)[2]

#2F
#first we will find marginal probabilities in g and h 
g<-apply(jointWaaliMatrix,1,sum)
h<-apply(jointWaaliMatrix,2,sum)
x<-c(0:3)
EX<-sum(x*g)
print(EX)
EX_square<-sum(x*x*g)
print(EX_square)
VarX=EX_square-(EX)*EX
print(VarX)
y<-c(0:2)
EY<-sum(y*h)
print(EY)
EY_square<-sum(y*y*h)
print(EY_square)
VarY=EY_square-(EY)*EY
print(VarY)

fun2<-function(x,y){
  x*y*(x+y)/30
}
mat2<-matrix(c(fun2(0,0:2),fun2(1,0:2),fun2(2,0:2),fun2(3,0:2)),nrow=4,ncol=3,byrow=TRUE)
eXY<-sum(mat2)

covariance<-eXY-EX*EY
print(covariance)
correlation<-covariance/(sqrt(VarX*VarY))
print(correlation)