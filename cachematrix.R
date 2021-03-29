## makeCachedMatric makes 4 functions to avoid recalculating the inverse a matrix if it has been solved already. I think just looks at the name of the matrix and does not test to see if teh matrices are actually the same. First it initialized the data to provide vessels to subsequenclty fill. r

## set assigns values to parent directory using the <<- operator, get calls the matrix, setinv assign inverse to parent envirionment usign <<-, getinv calls the inv. Finally the program created a list of functions that are passed to cachesolve

## makeCachedMatrix takes a matrix as an argumbet and returns a list of functions that include data and information on the inv. If teh inv has already been solved in reports the solution that was stored form the cacheSolve program previously. Sixth attempt to commit and push changes

makeCacheMatrix<-function (x=matrix()) {
  inv<- NULL                  #### initiate
  set<- function(y) {
    x<<-y                     #### assign to parent directory
    inv<<- NULL
  }
  get<- function() {x}
  setinv<- function(inverse) {inv <<- inverse}     #### I don't entirely understand this but copied from mean example, perhaps this is storing the inv later
  getinv<- function() {inv}
  list(set=set, get=get,setinv=setinv,getinv=getinv)
}


## CacheSolve takes teh functions from makeCachedMatrix and makes and reports these invertede matrix if it is not already cahed in makeCachedMatrix and caches a new calculation. 

cacheSolve<- function(x,...) {
    inv<-x$getinv()                   
    if (!is.null(inv)){                  ##### dtermine if inv has been calculated
        message("getting cached data")  ##### note program only looks for name does not test to see if x=new input
        return(inv)}                    ##### return cached value
        data<-x$get()
        inv<-solve(data, ...)
        x$setinv(inv)
        inv
    }
