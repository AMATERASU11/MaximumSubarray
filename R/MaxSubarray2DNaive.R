max_subarray_rectangle_naive <- function(mat) {
  n <- nrow(mat)
  m <- ncol(mat)
  max_sum <- -Inf

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

          # Update max_sum if needed
          if (sub_sum > max_sum) {
            max_sum <- sub_sum
          }
        }
      }
    }
  }

  return(max_sum)
}
