max_subarray_sum_opt <- function(arr) {
  res <- arr[1]
  max_ending <- arr[1]

  for (i in 2:length(arr)) {
    # At each step, choose whether to extend the current subarray or start a new one
    max_ending <- max(max_ending + arr[i], arr[i])

    # Update the global maximum if needed
    res <- max(res, max_ending)
  }

  return(res)
}
