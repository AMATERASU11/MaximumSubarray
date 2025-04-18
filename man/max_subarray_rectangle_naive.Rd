% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MaxSubarray2DNaive.R
\name{max_subarray_rectangle_naive}
\alias{max_subarray_rectangle_naive}
\title{Find Maximum Sum Rectangle in 2D Matrix (Brute-Force Approach)}
\usage{
max_subarray_rectangle_naive(mat)
}
\arguments{
\item{mat}{A numeric matrix (2D array) containing the input values.}
}
\value{
A single numeric value representing the maximum submatrix sum found.
}
\description{
Computes the maximum sum of any rectangular submatrix using a naive O(n³m³) approach
by checking all possible submatrices.
}
\details{
This function implements the brute-force solution to the 2D maximum subarray problem
by iterating through all possible combinations of:
\itemize{
\item Starting row (\code{up}) and column (\code{left})
\item Ending row (\code{down}) and column (\code{right})
}
For each submatrix defined by these bounds, it calculates the sum and tracks the maximum.
}
\section{Performance Warning}{

This implementation has \strong{O(n³m³)} time complexity (where n = rows, m = columns),
making it \strong{prohibitively slow} for matrices larger than 20x20.
For practical use, prefer optimized algorithms like the \strong{extended Kadane's approach}
(O(n²m) time).
}

\examples{
# Basic usage
mat <- matrix(c(1, 2, -1, -3, 0, 4, 2, -5, 1), nrow = 3, byrow = TRUE)
max_subarray_rectangle_naive(mat)  # Returns 6 (submatrix [1:2, 2:3])

# Edge case: all negative values
max_subarray_rectangle_naive(matrix(c(-1, -2, -3, -4), nrow = 2))  # Returns -1

}
\references{
\itemize{
\item Bentley, J. (1984). "Programming Pearls: Algorithm Design Techniques".
\emph{Communications of the ACM} (explains the 1D-to-2D extension).
}
}
\seealso{
\code{\link{max_subarray_rectangle_opt}} for an optimized O(n²m) implementation,
\code{\link{max_subarray_sum_naive}} for the 1D version of this algorithm.
}
