## The following functions can compute and cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            m <<- NULL
            x <<- y
            
      }
      get <- function() x
      setinv <- function(solve) m <<- solve
      getinv <- function() m
      list(set = set, get = get,
           setinv = setinv,
           getinv = getinv)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse## has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse ## from the cache

cacheSolve <- function(x, ...) {
      m <- x$getinv()
      if(!is.null(m)) {
            message("Data Cached")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinv(m)
      m
}
