// Naive Approach for 2D case of Maximum Subarray Problem

#include <Rcpp.h>
using namespace Rcpp;

//' @export
// [[Rcpp::export]]
int max_subarray_rectangle_naive_Rcpp(std::vector<std::vector<int>> &mat) {

  int n = mat.size();
  int m = mat[0].size();
  int maxSum = INT_MIN;

  for (int up = 0; up < n; up++) {
    for (int left = 0; left < m; left++) {
      for (int down = up; down < n; down++) {
        for (int right = left; right < m; right++) {

          // Find the sum of submatrix(up, right, down, left)
          int sum = 0;
          for (int i = up; i <= down; i++) {
            for (int j = left; j <= right; j++) {
              sum += mat[i][j];
            }
          }

          // Update maxSum if sum > maxSum.
          if (sum > maxSum) {
            maxSum = sum;
          }
        }
      }
    }
  }

  return maxSum;
}
