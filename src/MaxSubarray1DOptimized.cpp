//Optimized Approach for 1D case of Maximum Subarray Problem (using Kadane's Algorithm)

#include <Rcpp.h>
using namespace Rcpp;

// Function to find the maximum subarray sum
//' @export
// [[Rcpp::export]]
int max_subarray_sum_opt_Rcpp(std::vector<int> &arr) {
  int res = arr[0];
  int maxEnding = arr[0];

  for (size_t i = 1; i < arr.size(); i++) {

    // Find the maximum sum ending at index i by either extending
    // the maximum sum subarray ending at index i - 1 or by
    // starting a new subarray from index i
    maxEnding = std::max(maxEnding + arr[i], arr[i]);

    // Update res if maximum subarray sum ending at index i > res
    res = std::max(res, maxEnding);
  }
  return res;
}
