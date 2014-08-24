## Some matrix functions, which caches the result of cumputation.

## Creates matrix
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  list(
    get = function() x,
    set = function(y){x <<- y; inverse <<- NULL},
    getinverse = function() inverse,
    setinverse = function(y) inverse <<- y
  )
}

## Returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  if (is.null(x$getinverse())) {
    inverse <- solve(x$get(), ...)
    x$setinverse(inverse)
  }
  x$getinverse()
}
