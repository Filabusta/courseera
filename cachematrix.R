## Put comments here that give an overall description of what your
## functions do
#My functions mimick the example to create a matrix which caches its inverse and then a function
#which returns the inverse of that matrix using the function solve

#1.  `makeCacheMatrix`: This function creates a special "matrix" object
#that can cache its inverse.

## Write a short comment describing this function
#The output of this function mirrors that of the example, creating a list which can be 
#read through the cacheSolve function.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }    
    get <- function() x
    setinv <- function(solve) inv <<- solve
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


#2.  `cacheSolve`: This function computes the inverse of the special
#"matrix" returned by `makeCacheMatrix` above. If the inverse has
#already been calculated (and the matrix has not changed), then
#`cacheSolve` should retrieve the inverse from the cache.


## Write a short comment describing this function
#This function determines if the value of getinv is null and if so returns the cached data,
#but if not it calculates the inverse, stores it in the newly created vector, and returns it.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
