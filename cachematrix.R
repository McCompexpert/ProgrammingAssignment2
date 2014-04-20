## makeCacheMatrix - creates a "special" matrix which can cache its
## inverse. Remark: matrix supplied needs to be invertible.
##
## cacheSolve - computes the inverse of the special matrix generated with
## makeCacheMatrix. If the cache is calculated and the special matrix
## has not been changes, the cacheSolve retrieves the cached inverse value.

## Function makeCacheMatrix contains a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse


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
        getinv <- function() inverse
        
        # assemble a list of all the functions defined above
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Function cacheSolve returns chached inverse if the original 
## matrix has not changed

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
