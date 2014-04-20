## makeCacheMatrix - creates a "special" matrix which can cache its
## inverse. Remark: matrix supplied needs to be invertible.
##
## cacheSolve - computes the inverse of the special matrix generated with
## makeCacheMatrix. If the cache has already been calculated and the special matrix
## has not been changes, the cacheSolve retrieves the cached inverse value.

## Function makeCacheMatrix contains a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse
## 5. assemble a list of all the functions defined above

makeCacheMatrix <- function(x = matrix()) {
        #set the inverse value to NULL
        inv <- NULL
        # 1. set the value of the matrix
        set <- function(y) {
                x <<- y
                # set inv back to NULL because the matrix changed
                inv <<- NULL
        }
        # 2. get the value of the matrix
        get <- function() x
        # 3. set the inverse
        setinv <- function(inverse) inv <<- inverse
        # 4. get the inverse
        getinv <- function() inv
        
        # 5. assemble a list of all the functions defined above
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## cacheSolve - calculates the inverse of the special
## matrix supplied from the makeCacheMatrix function.
## 1. check if the inverse has already been calculated.
## If true, get the inverse from the cache and skip the
## calculation. 
## 2. If false, 3. calculates the inverse of the
## matrix and 4. sets the value of the inverse in the cache with
## the setinv function. 5. returns the newly calculated value.

cacheSolve <- function(x, ...) {
        # 1. check if the inverse is calculated and cached
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        # 2. not cached, place the matrix into data
        data <- x$get()
        # 3. calculate the inverse
        inv <- solve(data, ...)
        # 4. afterwards, cache the inverse
        x$setinv(inv)
        # 5. finally, return the newly calculated inverse
        inv
}