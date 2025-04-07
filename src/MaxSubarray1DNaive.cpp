// Naive Approach for 1D case of Maximum Subarray Problem

#include <Rcpp.h>
#include <algorithm>
#include <numeric>

using namespace Rcpp;

// Function to find the sum of subarray with maximum sum
//' @export
// [[Rcpp::export]]
int max_subarray_sum_naive_Rcpp(IntegerVector arr) {
  int n = arr.size();
  if (n == 0) return 0;

  // Cas trivial : tous positifs
  bool all_positive = true;
  bool all_negative = true;
  int max_negative = arr[0];

  for (int i = 0; i < n; ++i) {
    if (arr[i] > 0) all_negative = false;
    if (arr[i] < 0) all_positive = false;
    if (arr[i] > max_negative) max_negative = arr[i];
  }

  if (all_positive) return sum(arr);
  if (all_negative) return max_negative;

  // Algorithme naïf standard
  int max_sum = arr[0];

  for (int i = 0; i < n; ++i) {
    int current_sum = 0;
    for (int j = i; j < n; ++j) {
      current_sum += arr[j];
      if (current_sum > max_sum) {
        max_sum = current_sum;
      }
    }
  }

  return max_sum;
}
