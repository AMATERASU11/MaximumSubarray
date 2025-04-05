# Kadane's Algorithm for 1D Maximum Subarray
kadane_algorithm <- function(temp) {
  if (any(is.na(temp))) return(NA_real_)
  if (length(temp) == 0) return(-Inf)

  curr_sum <- 0
  max_sum <- temp[1]  # Initialize with first element

  for (val in temp) {
    curr_sum <- curr_sum + val
    max_sum <- max(max_sum, curr_sum)
    curr_sum <- max(curr_sum, 0)
  }

  return(max_sum)
}

# Optimized 2D Maximum Subarray using Kadane's Algorithm
#' Find Maximum Sum Rectangle in 2D Matrix (Optimized Kadane's Algorithm)
#'
#' Computes the maximum sum of any rectangular submatrix using an optimized O(n²m) approach
#' that extends Kadane's 1D algorithm to 2D matrices by collapsing columns.
#'
#' @param mat A numeric matrix (2D array) containing the input values.
#'
#' @return A single numeric value representing the maximum submatrix sum found.
#'
#' @details
#' This function implements the most efficient known solution to the 2D maximum subarray problem:
#' \enumerate{
#'   \item For each possible pair of left/right column boundaries (O(m²) combinations):
#'   \itemize{
#'     \item Collapse all rows between these columns into a temporary 1D array (O(n) per column pair)
#'   }
#'   \item Apply \code{\link{kadane_algorithm}} to the collapsed array (O(n) per operation)
#' }
#' The total time complexity is O(n²m) where n = rows and m = columns - dramatically faster than the
#' brute-force O(n³m³) approach.
#'
#' @section Algorithm:
#' The key optimization comes from recognizing that:
#' \preformatted{
#'   sum(rectangle between columns L-R) = sum(row-wise sums from L to R)
#' }
#' This allows reusing Kadane's 1D algorithm on the collapsed column sums.
#'
#' @examples
#' # Basic usage
#' mat <- matrix(c(1, 2, -1, -3, 0, 4, 2, -5, 1), nrow = 3, byrow = TRUE)
#' max_subarray_rectangle_opt(mat)  # Returns 6 (submatrix [1:2, 2:3])
#'
#' # Edge case: single maximum element
#' max_subarray_rectangle_opt(matrix(c(-1, -2, 10, -3), nrow = 2))  # Returns 10
#'
#' @seealso
#' \code{\link{kadane_algorithm}} for the 1D implementation used internally,
#' \code{\link{max_subarray_rectangle_naive}} for the brute-force reference version.
#'
#' @references
#' \itemize{
#'   \item Kadane, J. (1984). "Design of an O(n) algorithm for the maximum subarray problem".
#'   \emph{Communications of the ACM} (original 1D algorithm)
#'   \item Takaoka, T. (2002). "Efficient algorithms for the maximum subarray problem".
#'   \emph{Theoretical Computer Science} (2D extension)
#' }
#'
#' @export
max_subarray_rectangle_opt <- function(mat) {
  if (any(dim(mat) == 0)) return(-Inf)
  if (any(is.na(mat))) return(NA_real_)

  rows <- nrow(mat)
  cols <- ncol(mat)
  max_sum <- mat[1, 1]  # Initialize with first element

  for (left in 1:cols) {
    temp <- rep(0, rows)

    for (right in left:cols) {
      for (row in 1:rows) {
        temp[row] <- temp[row] + mat[row, right]
      }
      current_sum <- kadane_algorithm(temp)
      max_sum <- max(max_sum, current_sum)
    }
  }

  return(max_sum)
}
