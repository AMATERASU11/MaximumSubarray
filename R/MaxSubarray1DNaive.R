#' Find Maximum Subarray Sum (Brute-Force Approach)
#'
#' Computes the maximum sum of any contiguous subarray using a naive O(n²) approach
#' by checking all possible subarrays.
#'
#' @param arr A numeric vector containing the input array.
#'
#' @return A single numeric value representing the maximum subarray sum found.
#'
#' @details
#' This function implements the brute-force solution to the maximum subarray problem
#' by iterating through all possible starting and ending indices of subarrays,
#' calculating their sums, and keeping track of the maximum encountered.
#'
#' @examples
#' # Basic usage
#' max_subarray_sum_naive(c(-2, 1, -3, 4, -1, 2, 1, -5, 4))  # Returns 6
#'
#' # Edge case: all negative numbers
#' max_subarray_sum_naive(c(-3, -1, -2))  # Returns -1
#'
#' @section Warning:
#' This function has quadratic time complexity (O(n²)) and should not be used for
#' large input sizes (n > 1000). For better performance, use [Kadane's algorithm](https://en.wikipedia.org/wiki/Maximum_subarray_problem).
#'
#' @seealso
#' \code{\link{max_subarray_sum_opt}} for an optimized O(n) implementation using Kadane's algorithm.
#'
#' @export
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
