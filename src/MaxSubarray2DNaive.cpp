// Naive Approach for 2D case of Maximum Subarray Problem

#include <Rcpp.h>
#include "utils.h"
using namespace Rcpp;


//' @export
// [[Rcpp::export]]
int max_subarray_rectangle_naive_Rcpp(std::vector<std::vector<int>> &mat) {
  int n = mat.size();
  if (n == 0) return INT_MIN;
  int m = mat[0].size();
  if (m == 0) return INT_MIN;

  // Cas trivial : tous les éléments positifs
  if (all_non_negative(mat)) {
    return total_sum(mat);
  }

  // Cas trivial : tous les éléments négatifs
  if (all_non_positive(mat)) {
    return max_element_2d(mat);
  }

  int maxSum = INT_MIN;

  for (int up = 0; up < n; up++) {
    for (int left = 0; left < m; left++) {
      for (int down = up; down < n; down++) {
        for (int right = left; right < m; right++) {
          int sum = 0;
          for (int i = up; i <= down; i++) {
            for (int j = left; j <= right; j++) {
              sum += mat[i][j];
            }
          }
          maxSum = std::max(maxSum, sum);
        }
      }
    }
  }

  return maxSum;
}
