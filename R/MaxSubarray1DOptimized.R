#' Find Maximum Subarray Sum (Kadane's Algorithm - Optimized)
#'
#' Computes the maximum sum of any contiguous subarray using Kadane's O(n) algorithm,
#' which dynamically tracks the optimal subarray ending at each position.
#'
#' @param arr A numeric vector containing the input array.
#'
#' @return A list with the following elements:
#' \describe{
#'   \item{sum}{The maximum subarray sum (numeric).}
#'   \item{subarray}{The contiguous subarray corresponding to this sum.}
#' }
#'
#' @details
#' Implements Kadane's algorithm, which efficiently solves the maximum subarray problem
#' in linear time by maintaining:
#' \itemize{
#'   \item \code{max_ending_here}: The max sum of any subarray ending at the current index.
#'   \item \code{max_so_far}: The global maximum subarray sum found so far.
#' }
#' At each index, the algorithm decides whether to extend the previous subarray or
#' start a new one. Index tracking is used to extract the final subarray.
#'
#' @examples
#' # Basic usage
#' max_subarray_sum_opt(c(-2, 1, -3, 4, -1, 2, 1, -5, 4))$sum      # Returns 6
#' max_subarray_sum_opt(c(-2, 1, -3, 4, -1, 2, 1, -5, 4))$subarray # Returns 4 -1 2 1
#'
#' # Edge case: all negative numbers
#' max_subarray_sum_opt(c(-3, -1, -2))$sum  # Returns -1
#'
#' @section Performance:
#' Time complexity: O(n) (linear time). \cr
#' Space complexity: O(1) (constant space). \cr
#' For large vectors (>1e6 elements), this algorithm is optimal.
#'
#' @seealso
#' \code{\link{max_subarray_sum_naive}} for the brute-force O(n²) implementation,
#' useful for educational purposes but inefficient for large inputs.
#'
#' @references
#' Kadane, J. (1984). "Design of an O(n) algorithm for the maximum subarray problem".
#' \emph{Communications of the ACM}.
#'
#' @export

max_subarray_sum_opt <- function(arr) {
  n <- length(arr)

  # Cas général : Kadane
  max_so_far <- arr[1]
  max_ending_here <- arr[1]
  start <- 1
  end <- 1
  temp_start <- 1

  for (i in 2:n) {
    if (arr[i] > max_ending_here + arr[i]) {
      max_ending_here <- arr[i]
      temp_start <- i
    } else {
      max_ending_here <- max_ending_here + arr[i]
    }

    if (max_ending_here > max_so_far) {
      max_so_far <- max_ending_here
      start <- temp_start
      end <- i
    }
  }

  return(list(sum = max_so_far, subarray = arr[start:end]))
}


