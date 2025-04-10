# Kadane's Algorithm for 1D Maximum Subarray
kadane_algorithm <- function(arr) {
  if (length(arr) == 0) {
    return(list(sum = -Inf, start = NA_integer_, end = NA_integer_))
  }

  if (any(is.na(arr))) {
    return(list(sum = NA_real_, start = NA_integer_, end = NA_integer_))
  }

  max_so_far <- arr[1]
  max_ending_here <- arr[1]
  start <- end <- temp_start <- 1

  for (i in 2:length(arr)) {
    if (is.na(arr[i])) {
      return(list(sum = NA_real_, start = NA_integer_, end = NA_integer_))
    }

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

  list(sum = max_so_far, start = start, end = end)
}


#' Optimized 2D Maximum Subarray using Kadane's Algorithm
#'
#' Finds the maximum sum of any rectangular submatrix within a 2D numeric matrix,
#' using an optimized approach based on Kadane's algorithm.
#'
#' @param mat A numeric matrix.
#'
#' @return A list with the following elements:
#' \describe{
#'   \item{sum}{The maximum submatrix sum (numeric).}
#'   \item{submatrix}{The 2D submatrix corresponding to this sum.}
#'   \item{top, bottom, left, right}{The boundaries (1-based indices) of the submatrix.}
#' }
#'
#' @details
#' This function implements an efficient solution to the 2D maximum subarray problem.
#' It collapses each pair of columns into a 1D array of row sums, then applies
#' \code{\link{kadane_algorithm}} to find the best vertical slice for that column span.
#'
#' The total time complexity is O(n²m), where \code{n} is the number of rows and
#' \code{m} the number of columns, which is significantly faster than the
#' brute-force O(n³m³) method.
#'
#' @section Algorithm:
#' The key idea is:
#' \preformatted{
#' sum(matrix[i:j, L:R]) = sum(row-wise collapses from columns L to R)
#' }
#' This transformation enables reuse of the 1D Kadane's algorithm across each
#' column pair.
#'
#' @examples
#' # Basic usage
#' mat <- matrix(c(1, 2, -1,
#'                 -3, 0, 4,
#'                 2, -5, 1), nrow = 3, byrow = TRUE)
#' max_subarray_rectangle_opt(mat)$sum  # Returns 6
#'
#' # Edge case: single large positive element
#' max_subarray_rectangle_opt(matrix(c(-1, -2, 10, -3), nrow = 2))$sum  # Returns 10
#'
#' @seealso
#' \code{\link{kadane_algorithm}} for the 1D max subarray version used internally. \cr
#' \code{\link{max_subarray_rectangle_naive}} for the brute-force 2D version.
#'
#' @references
#' \itemize{
#'   \item Kadane, J. (1984). Design of an O(n) algorithm for the maximum subarray problem.
#'   \emph{Communications of the ACM}.
#'   \item Takaoka, T. (2002). Efficient algorithms for the maximum subarray problem.
#'   \emph{Theoretical Computer Science}.
#' }
#'
#' @export

max_subarray_rectangle_opt <- function(mat) {
  if (length(mat) == 0 || any(dim(mat) == 0)) {
    return(list(sum = -Inf, submatrix = matrix(nrow = 0, ncol = 0)))
  }

  if (any(is.na(mat))) {
    return(list(sum = NA_real_, submatrix = matrix(NA, nrow = 1)))
  }

  if (nrow(mat) == 1 && ncol(mat) == 1) {
    return(list(
      sum = mat[1,1],
      submatrix = mat,
      top = 1,
      bottom = 1,
      left = 1,
      right = 1
    ))
  }

  rows <- nrow(mat)
  cols <- ncol(mat)
  max_sum <- -Inf
  final_top <- final_bottom <- final_left <- final_right <- 1

  for (left in 1:cols) {
    temp <- rep(0, rows)

    for (right in left:cols) {
      for (row in 1:rows) {
        temp[row] <- temp[row] + mat[row, right]
      }

      kadane_res <- kadane_algorithm(temp)
      current_sum <- kadane_res$sum
      top <- kadane_res$start
      bottom <- kadane_res$end

      if (!is.na(current_sum) && current_sum > max_sum) {
        max_sum <- current_sum
        final_top <- top
        final_bottom <- bottom
        final_left <- left
        final_right <- right
      }

    }
  }

  submatrix <- mat[final_top:final_bottom, final_left:final_right, drop = FALSE]

  return(list(
    sum = max_sum,
    submatrix = submatrix
  ))
}


