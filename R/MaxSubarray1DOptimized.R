#' Find Maximum Subarray Sum (Kadane's Algorithm - Optimized)
#'
#' Computes the maximum sum of any contiguous subarray using Kadane's O(n) algorithm,
#' which dynamically tracks the optimal subarray ending at each position.
#'
#' @param arr A numeric vector containing the input array.
#'
#' @return A single numeric value representing the maximum subarray sum found.
#'
#' @details
#' Implements Kadane's algorithm, which efficiently solves the maximum subarray problem
#' in linear time by maintaining:
#' \itemize{
#'   \item \code{max_ending}: Maximum sum of subarrays ending at the current position.
#'   \item \code{res}: Global maximum sum encountered.
#' }
#' At each element, the algorithm decides whether to extend the previous subarray or
#' start a new one at the current position.
#'
#' @examples
#' # Basic usage
#' max_subarray_sum_opt(c(-2, 1, -3, 4, -1, 2, 1, -5, 4))  # Returns 6
#'
#' # Edge case: all negative numbers
#' max_subarray_sum_opt(c(-3, -1, -2))  # Returns -1
#'
#' @section Performance:
#' Time complexity: O(n) (linear time). \\
#' Space complexity: O(1) (constant space). \\
#' For large arrays (>1e6 elements), this is significantly faster than the
#' brute-force approach.
#'
#' @seealso
#' \code{\link{max_subarray_sum_naive}} for the brute-force O(n²) implementation,
#' useful for educational purposes but inefficient for large inputs.
#'
#' @references
#' Original algorithm: Kadane, J. (1984). "Design of an O(n) algorithm for the
#' maximum subarray problem". \emph{ACM}.
#'
#' @export
max_subarray_sum_opt <- function(arr) {
  # Cas trivial : tous les éléments sont positifs
  if (all(arr >= 0)) {
    return(sum(arr))
  }

  # Cas trivial : tous les éléments sont négatifs
  if (all(arr <= 0)) {
    return(max(arr))
  }

  # Cas général : algorithme de Kadane
  res <- arr[1]
  max_ending <- arr[1]

  for (i in 2:length(arr)) {
    max_ending <- max(max_ending + arr[i], arr[i])
    res <- max(res, max_ending)
  }

  return(res)
}

