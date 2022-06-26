abc_ab <- function(x,y) {
  x+y
}

above10 <- function(x){
  use <- x > 10
  x[use]
}

above <- function(x,n){
  use <- x> n
  x[use]
}


columnmean <- function(y, namode=TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
  	means[i] <- mean(y[,i], na.rm=namode) 
  }
  means
  
}

le <- 10

f <- function(x){
	le <-2
	le^2 + g(x)
}

g<- function(x){
	x*le
}
# 너꺼 안쓰고, 호출시점에서 찾을꺼야.


make.anything <- function(data,fixed=c(T,T)){
	params <- fixed
	function(x){
		print(x)
		print(params)
		print(data)
	}
}
