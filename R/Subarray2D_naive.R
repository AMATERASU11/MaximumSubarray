max_subarray_rectangle_naive <- function(mat) {
  n <- nrow(mat)
  m <- ncol(mat)
  max_sum <- -Inf
  best_up <- best_left <- best_down <- best_right <- NULL

  for (up in 1:n) {
    for (left in 1:m) {
      for (down in up:n) {
        for (right in left:m) {

          # Sum the submatrix from (up, left) to (down, right)
          sub_sum <- 0
          for (i in up:down) {
            for (j in left:right) {
              sub_sum <- sub_sum + mat[i, j]
            }
          }

          # Update max_sum and coordinates if needed
          if (sub_sum > max_sum) {
            max_sum <- sub_sum
            best_up <- up
            best_left <- left
            best_down <- down
            best_right <- right
          }
        }
      }
    }
  }

  # Extract the submatrix
  max_submatrix <- mat[best_up:best_down, best_left:best_right]

  return(list(max_sum = max_sum, max_submatrix = max_submatrix))
}
