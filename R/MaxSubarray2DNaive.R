#' Find Maximum Sum Rectangle in 2D Matrix (Brute-Force Approach)
#'
#' Computes the maximum sum of any rectangular submatrix using a naive O(n³m³) approach
#' by checking all possible submatrices.
#'
#' @param mat A numeric matrix (2D array) containing the input values.
#'
#' @return A single numeric value representing the maximum submatrix sum found.
#'
#' @details
#' This function implements the brute-force solution to the 2D maximum subarray problem
#' by iterating through all possible combinations of:
#' \itemize{
#'   \item Starting row (`up`) and column (`left`)
#'   \item Ending row (`down`) and column (`right`)
#' }
#' For each submatrix defined by these bounds, it calculates the sum and tracks the maximum.
#'
#' @section Performance Warning:
#' This implementation has \strong{O(n³m³)} time complexity (where n = rows, m = columns),
#' making it \strong{prohibitively slow} for matrices larger than 20x20.
#' For practical use, prefer optimized algorithms like the \strong{extended Kadane's approach}
#' (O(n²m) time).
#'
#' @examples
#' # Basic usage
#' mat <- matrix(c(1, 2, -1, -3, 0, 4, 2, -5, 1), nrow = 3, byrow = TRUE)
#' max_subarray_rectangle_naive(mat)  # Returns 6 (submatrix [1:2, 2:3])
#'
#' # Edge case: all negative values
#' max_subarray_rectangle_naive(matrix(c(-1, -2, -3, -4), nrow = 2))  # Returns -1
#'
#' @seealso
#' \code{\link{max_subarray_rectangle_opt}} for an optimized O(n²m) implementation,
#' \code{\link{max_subarray_sum_naive}} for the 1D version of this algorithm.
#'
#' @references
#' \itemize{
#'   \item Bentley, J. (1984). "Programming Pearls: Algorithm Design Techniques".
#'   \emph{Communications of the ACM} (explains the 1D-to-2D extension).
#' }
#'
#' @export
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
