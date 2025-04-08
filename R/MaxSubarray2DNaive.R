#' Find Maximum Sum Rectangle in 2D Matrix (Brute-Force Approach)
#'
#' Computes the maximum sum of any rectangular submatrix using a naive brute-force
#' algorithm by checking all possible submatrices.
#'
#' @param mat A numeric matrix (2D array) containing the input values.
#'
#' @return A list with the following elements:
#' \describe{
#'   \item{sum}{The maximum submatrix sum (numeric).}
#'   \item{submatrix}{The 2D submatrix corresponding to this sum.}
#'   \item{top, bottom, left, right}{The row and column boundaries of the submatrix.}
#' }
#'
#' @details
#' This function implements the brute-force solution to the 2D maximum subarray problem
#' by evaluating every possible submatrix defined by:
#' \itemize{
#'   \item A starting row (\code{up}) and column (\code{left})
#'   \item An ending row (\code{down}) and column (\code{right})
#' }
#' For each such rectangle, it computes the sum and keeps track of the maximum.
#'
#' @section Performance Warning:
#' This approach has \strong{O(n³m³)} time complexity, where \code{n} is the number of rows
#' and \code{m} is the number of columns. It becomes impractical for matrices larger than
#' about 20x20. For better performance, consider using
#' \code{\link{max_subarray_rectangle_opt}}, which uses Kadane's algorithm.
#'
#' @examples
#' # Basic usage
#' mat <- matrix(c(1, 2, -1,
#'                 -3, 0, 4,
#'                 2, -5, 1), nrow = 3, byrow = TRUE)
#' max_subarray_rectangle_naive(mat)$sum  # Returns 6
#'
#' # Edge case: all negative values
#' mat2 <- matrix(c(-1, -2, -3, -4), nrow = 2)
#' max_subarray_rectangle_naive(mat2)$sum  # Returns -1
#'
#' @seealso
#' \code{\link{max_subarray_rectangle_opt}} for the optimized O(n²m) version. \cr
#' \code{\link{max_subarray_sum_naive}} for the 1D brute-force version.
#'
#' @references
#' \itemize{
#'   \item Bentley, J. (1984). Programming Pearls: Algorithm Design Techniques.
#'   \emph{Communications of the ACM}.
#' }
#'
#' @export
max_subarray_rectangle_naive <- function(mat) {
  n <- nrow(mat)
  m <- ncol(mat)

  if (n == 0 || m == 0) {
    return(list(sum = -Inf, submatrix = matrix(nrow = 0, ncol = 0)))
  }

  # Cas trivial : tous les éléments sont positifs
  if (all(mat >= 0)) {
    return(list(sum = sum(mat), submatrix = mat))
  }

  # Cas trivial : tous les éléments sont négatifs
  if (all(mat <= 0)) {
    max_val <- max(mat)
    return(list(sum = max_val, submatrix = matrix(max_val, nrow = 1)))
  }

  max_sum <- -Inf
  top <- bottom <- left <- right <- 1

  for (up in 1:n) {
    for (l in 1:m) {
      for (down in up:n) {
        for (r in l:m) {
          sub_sum <- sum(mat[up:down, l:r])
          if (sub_sum > max_sum) {
            max_sum <- sub_sum
            top <- up
            bottom <- down
            left <- l
            right <- r
          }
        }
      }
    }
  }

  return(list(
    sum = max_sum,
    submatrix = mat[top:bottom, left:right, drop = FALSE]
  ))
}

