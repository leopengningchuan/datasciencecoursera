## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    setmat <- function(y) {
        x <<- y
        m <<- NULL
    }
    getmat <- function() x
    setinv <- function(inverse) m <<- inverse
    getinv <- function() m
    list(setmat = setmat, getmat = getmat,
         setinv = setinv,
         getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$getmat()
    m <- solve(data, ...)
    x$setinv(m)
    m
}


# a <- rbind(c(1, -1/4), c(-1/4, 1))
# b <- rbind(c(5, -1/5), c(-1/5, 5))