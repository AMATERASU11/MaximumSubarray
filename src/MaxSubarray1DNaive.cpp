// Naive Approach for 1D case of Maximum Subarray Problem

#include <Rcpp.h>
#include <algorithm>
#include <numeric>

using namespace Rcpp;

// Function to find the sum of subarray with maximum sum
//' @export
 // [[Rcpp::export]]
 List max_subarray_sum_naive_Rcpp(IntegerVector arr) {
   int n = arr.size();
   if (n == 0) return List::create(Named("sum") = 0, Named("subarray") = IntegerVector());

   // General case
   int max_sum = arr[0];
   int start = 0, end = 0;

   for (int i = 0; i < n; ++i) {
     int current_sum = 0;
     for (int j = i; j < n; ++j) {
       current_sum += arr[j];
       if (current_sum > max_sum) {
         max_sum = current_sum;
         start = i;
         end = j;
       }
     }
   }

   IntegerVector subarray = arr[Range(start, end)];
   return List::create(Named("sum") = max_sum, Named("subarray") = subarray);
 }

