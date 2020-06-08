## This script will perform matrix inversion in R.
## To do this I will write two functions.

## The first function creates a special matrix that can cache it's inverse for possible future use.

makeCacheMatrix <- function(x = matrix()) {
            m <- NULL
## x is initialised            as a function arguement while m is initialised as an object within the makeCacheMatrix() environment 
set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
## The above function resets             the initialised variables.
get <- function() x
## Defines the getter for the vector x            
setinverse <- function(inverse) m <<- inverse
## Defines the setter for the matrix m            
getinverse <- function() m
## Defines the getter for the matrix m            
list(set = set, get = get,
                 setmean = setmean,
                 getinverse = getinverse)
## Returns a named list of defined objects to the parent environment
}

## The next function calculates the inverse of the special matrix returned by the first function.
## It either retrives the inverse from the cache (if the matrix has not changed), or calculates the new mean and set it's value in the cache via the `setinverse` function

cacheSolve <- function(x, ...) {
            m <- x$getinverse()
## Attempts to retrive an inverse from the object the function is called with            
if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
            }
## either caches the inverse from makeCacheMatrix or computes one and store it there            
data <- x$get()
            m <- solve(data, ...)
            x$setinverse(m)
            m
## Exicute the solve function and return an inverse
}
