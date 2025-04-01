# Kadane's Algorithm for 1D Maximum Subarray
kadane_algorithm <- function(temp) {
  curr_sum <- 0
  max_sum <- -Inf

  for (val in temp) {
    curr_sum <- curr_sum + val
    if (max_sum < curr_sum) {
      max_sum <- curr_sum
    }
    if (curr_sum < 0) {
      curr_sum <- 0
    }
  }

  return(max_sum)
}

# Optimized 2D Maximum Subarray using Kadane's Algorithm
max_subarray_rectangle_opt <- function(mat) {
  rows <- nrow(mat)
  cols <- ncol(mat)
  max_sum <- -Inf

  for (left in 1:cols) {
    temp <- rep(0, rows)

    for (right in left:cols) {
      # Update temp with column values
      for (row in 1:rows) {
        temp[row] <- temp[row] + mat[row, right]
      }

      # Apply Kadane's algorithm to the collapsed 1D array
      sum <- kadane_algorithm(temp)

      # Update global max
      max_sum <- max(max_sum, sum)
    }
  }

  return(max_sum)
}
