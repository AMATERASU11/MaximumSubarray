//Optimized Approach for 1D case of Maximum Subarray Problem (using Kadane's Algorithm)

#include <Rcpp.h>
using namespace Rcpp;

//' @export
 // [[Rcpp::export]]
 List max_subarray_sum_opt_Rcpp(IntegerVector arr) {
   int n = arr.size();
   if (n == 0) return List::create(Named("sum") = 0, Named("subarray") = IntegerVector());

   // Kadane avec tracking des indices
   int max_so_far = arr[0];
   int max_ending_here = arr[0];
   int start = 0, end = 0, temp_start = 0;

   for (int i = 1; i < n; ++i) {
     if (arr[i] > max_ending_here + arr[i]) {
       max_ending_here = arr[i];
       temp_start = i;
     } else {
       max_ending_here += arr[i];
     }

     if (max_ending_here > max_so_far) {
       max_so_far = max_ending_here;
       start = temp_start;
       end = i;
     }
   }

   IntegerVector subarray = arr[Range(start, end)];
   return List::create(Named("sum") = max_so_far, Named("subarray") = subarray);
 }
