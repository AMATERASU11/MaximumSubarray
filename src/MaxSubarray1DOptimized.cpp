//Optimized Approach for 1D case of Maximum Subarray Problem (using Kadane's Algorithm)

#include <Rcpp.h>
using namespace Rcpp;

// Function to find the maximum subarray sum
//' @export
// [[Rcpp::export]]
int max_subarray_sum_opt_Rcpp(std::vector<int> &arr) {
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
  int maxEnding = arr[0];

  for (size_t i = 1; i < arr.size(); i++) {
    maxEnding = std::max(maxEnding + arr[i], arr[i]);
    res = std::max(res, maxEnding);
  }
  return res;
}
