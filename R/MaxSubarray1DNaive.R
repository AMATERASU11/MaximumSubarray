#' Find Maximum Subarray Sum (Brute-Force Approach)
#'
#' Computes the maximum sum of any contiguous subarray using a naive O(n²) approach
#' by checking all possible subarrays.
#'
#' @param arr A numeric vector containing the input array.
#'
#' @return A list with the following elements:
#' \describe{
#'   \item{sum}{The maximum subarray sum (numeric).}
#'   \item{subarray}{The contiguous subarray (vector) that yields this sum.}
#' }
#'
#' @details
#' This function implements the brute-force solution to the maximum subarray problem
#' by iterating over all possible combinations of starting and ending indices of
#' subarrays, computing their sums, and recording the maximum found.
#'
#' @examples
#' # Basic usage
#' max_subarray_sum_naive(c(-2, 1, -3, 4, -1, 2, 1, -5, 4))$sum      # Returns 6
#' max_subarray_sum_naive(c(-2, 1, -3, 4, -1, 2, 1, -5, 4))$subarray # Returns 4 -1 2 1
#'
#' # Edge case: all negative numbers
#' max_subarray_sum_naive(c(-3, -1, -2))$sum  # Returns -1
#'
#' @section Performance Warning:
#' This function has quadratic time complexity (O(n²)) and is not recommended for
#' large inputs (n > 1,000). Use \code{\link{max_subarray_sum_opt}} instead.
#'
#' @seealso
#' \code{\link{max_subarray_sum_opt}} for an optimized O(n) implementation using Kadane's algorithm.
#'
#' @references
#' Bentley, J. (1984). "Programming Pearls: Algorithm Design Techniques".
#' \emph{Communications of the ACM}.
#'
#' @export

max_subarray_sum_naive <- function(arr) {
  n <- length(arr)

  # Cas général
  max_sum <- arr[1]
  start <- 1
  end <- 1

  for (i in seq_along(arr)) {
    curr_sum <- 0
    for (j in i:n) {
      curr_sum <- curr_sum + arr[j]
      if (curr_sum > max_sum) {
        max_sum <- curr_sum
        start <- i
        end <- j
      }
    }
  }

  return(list(
    sum = max_sum,
    subarray = arr[start:end]
  ))
}
