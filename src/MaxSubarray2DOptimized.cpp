#include <Rcpp.h>
#include "utils.h"
using namespace Rcpp;

// Kadane's algorithm to find the maximum sum subarray in a 1D array
List kadaneAlgorithm(NumericVector& arr) {
  int n = arr.size();
  double maxSum = arr[0];
  double currSum = arr[0];
  int start = 0, end = 0, tempStart = 0;

  for (int i = 1; i < n; ++i) {
    if (arr[i] > currSum + arr[i]) {
      currSum = arr[i];
      tempStart = i;
    } else {
      currSum += arr[i];
    }

    if (currSum > maxSum) {
      maxSum = currSum;
      start = tempStart;
      end = i;
    }
  }

  return List::create(
    Named("sum") = maxSum,
    Named("start") = start,
    Named("end") = end
  );
}

// [[Rcpp::export]]
List max_subarray_rectangle_opt_Rcpp(NumericMatrix mat) {
  int rows = mat.nrow();
  int cols = mat.ncol();

  if (rows == 0 || cols == 0) {
    return List::create(Named("sum") = R_NegInf, Named("submatrix") = NumericMatrix(0, 0));
  }

  double maxSum = mat(0, 0);
  int final_top = 0, final_bottom = 0, final_left = 0, final_right = 0;
  NumericVector temp(rows);

  for (int left = 0; left < cols; ++left) {
    std::fill(temp.begin(), temp.end(), 0);

    for (int right = left; right < cols; ++right) {
      for (int row = 0; row < rows; ++row) {
        temp[row] += mat(row, right);
      }

      List kadane_result = kadaneAlgorithm(temp);
      double currentSum = kadane_result["sum"];
      int top = kadane_result["start"];
      int bottom = kadane_result["end"];

      if (currentSum > maxSum) {
        maxSum = currentSum;
        final_top = top;
        final_bottom = bottom;
        final_left = left;
        final_right = right;
      }
    }
  }

  // Extract submatrix
  NumericMatrix submatrix(final_bottom - final_top + 1, final_right - final_left + 1);
  for (int i = 0; i <= final_bottom - final_top; ++i)
    for (int j = 0; j <= final_right - final_left; ++j)
      submatrix(i, j) = mat(final_top + i, final_left + j);

  return List::create(
    Named("sum") = maxSum,
    Named("submatrix") = submatrix
  );
}
