kadane_1d <- function(array) {
  max_sum <- -Inf
  current_sum <- 0
  start <- 0
  end <- 0
  temp_start <- 0

  for (i in seq_along(array)) {
    current_sum <- current_sum + array[i]

    if (current_sum > max_sum) {
      max_sum <- current_sum
      start <- temp_start
      end <- i
    }

    if (current_sum < 0) {
      current_sum <- 0
      temp_start <- i + 1
    }
  }

  return(list(max_sum = max_sum, start = start, end = end))
}

max_submatrix_sum <- function(matrix) {
  rows <- nrow(matrix)
  cols <- ncol(matrix)

  max_sum <- -Inf
  final_top <- 0
  final_bottom <- 0
  final_left <- 0
  final_right <- 0

  for (top in 1:rows) {
    temp <- rep(0, cols)

    for (bottom in top:rows) {
      for (col in 1:cols) {
        temp[col] <- temp[col] + matrix[bottom, col]
      }

      kadane_result <- kadane_1d(temp)
      current_sum <- kadane_result$max_sum
      start <- kadane_result$start
      end <- kadane_result$end

      if (current_sum > max_sum) {
        max_sum <- current_sum
        final_top <- top
        final_bottom <- bottom
        final_left <- start + 1
        final_right <- end + 1
      }
    }
  }

  return(list(max_sum = max_sum, top_left = c(final_top, final_left),
              bottom_right = c(final_bottom, final_right)))
}
