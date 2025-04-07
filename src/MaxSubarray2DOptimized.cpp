//Optimized Approach for 2D case of Maximum Subarray Problem (using Kadane's Algorithm)


#include <Rcpp.h>
#include "utils.h"
using namespace Rcpp;

// Kadane's algorithm to find the maximum sum
// subarray in a 1D array
int kadaneAlgorithm(std::vector<int>& temp) {
  int rows = temp.size();
  int currSum = 0;
  int maxSum = INT_MIN;

  for (int i = 0; i < rows; i++) {
    currSum += temp[i];

    // Update maxSum if the current sum is greater
    if (maxSum < currSum) {
      maxSum = currSum;
    }

    // If the current sum becomes negative, reset it to 0
    if (currSum < 0) {
      currSum = 0;
    }
  }

  return maxSum;
}

// Function to find the maximum sum rectangle in a 2D matrix
//' @export
// [[Rcpp::export]]
int max_subarray_rectangle_opt_Rcpp(std::vector<std::vector<int>> &mat) {
 int rows = mat.size();
  int cols = mat[0].size();
 if (rows == 0 || cols == 0)  return INT_MIN;

 // Cas trivial : tous les éléments positifs
 if (all_non_negative(mat)) {
   return total_sum(mat);
 }

 // Cas trivial : tous les éléments négatifs
 if (all_non_positive(mat)) {
   return max_element_2d(mat);
 }

 int maxSum = INT_MIN;
 std::vector<int> temp(rows);

 for (int left = 0; left < cols; left++) {
   std::fill(temp.begin(), temp.end(), 0);

   for (int right = left; right < cols; right++) {
     for (int row = 0; row < rows; row++) {
       temp[row] += mat[row][right];
     }

     int sum = kadaneAlgorithm(temp);
     maxSum = std::max(maxSum, sum);
   }
 }

 return maxSum;
}
