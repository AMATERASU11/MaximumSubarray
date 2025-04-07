// Naive Approach for 1D case of Maximum Subarray Problem

#include <Rcpp.h>
using namespace Rcpp;


// Function to find the sum of subarray with maximum sum
//' @export
// [[Rcpp::export]]
int max_subarray_sum_naive_Rcpp(std::vector<int> &arr) {
  int res = arr[0];

  // Outer loop for starting point of subarray
  for(size_t i = 0; i < arr.size(); i++) {
    int currSum = 0;

    // Inner loop for ending point of subarray
    for(size_t j = i; j < arr.size(); j++) {
      currSum = currSum + arr[j];

      // Update res if currSum is greater than res
      res = std::max(res, currSum);
    }
  }
  return res;
}
