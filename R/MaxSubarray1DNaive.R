
max_subarray_sum_naive <- function(arr) {
  res <- arr[1]

  # Outer loop for starting index
  for (i in seq_along(arr)) {
    curr_sum <- 0

    # Inner loop for ending index
    for (j in i:length(arr)) {
      curr_sum <- curr_sum + arr[j]

      # Update result if current sum is greater
      res <- max(res, curr_sum)
    }
  }

  return(res)
}
