// Naive Approach for 1D case of Maximum Subarray Problem

#include <Rcpp.h>
using namespace Rcpp;


// Function to find the sum of subarray with maximum sum
//' @export
// [[Rcpp::export]]
int max_subarray_sum_naive_Rcpp(std::vector<int> &arr) {
  if (arr.empty()) return 0;

  // Cas trivial : tous les éléments positifs
  if (std::all_of(arr.begin(), arr.end(), [](int x) { return x >= 0; })) {
    return std::accumulate(arr.begin(), arr.end(), 0);
  }

  // Cas trivial : tous les éléments négatifs
  if (std::all_of(arr.begin(), arr.end(), [](int x) { return x <= 0; })) {
    return *std::max_element(arr.begin(), arr.end());
  }

  int res = arr[0];

  for (size_t i = 0; i < arr.size(); i++) {
    int currSum = 0;
    for (size_t j = i; j < arr.size(); j++) {
      currSum += arr[j];
      res = std::max(res, currSum);
    }
  }
  return res;
}
