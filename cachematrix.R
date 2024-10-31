## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#This function  creates a special "matrix" object 
makeCacheMatrix <- function(x = matrix()){
        mat <- NULL
        
        #Set the matrix
        set <- function(y){
                x <<- y 
                mat <<- NULL
        } 
        #get the matrix
        get <- function() x
        setinverse <- function(inverse) mat <<- inverse #This function sets the cached inverse matrix
        getinverse <- function() mat #This function gets the cached inverse matrix
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse) #This returns the above functions as a list
}



## Write a short comment describing this function

#This function solves/ calculates for the inverse of the matrix
cacheSolve <- function(x, ...){
        mat <- x$getinverse()
        #if cached, return the inverse with a message
        if(!is.null(mat)){
                message("getting cached data")
                return(mat)
        }
        #else, calculate inverse
        data <- x$get()
        mat <-  solve(data, ...)
        x$setinverse(mat)
       
        ## Return a matrix that is the inverse of 'x'
       
        mat  #return the inverse matrix
}
