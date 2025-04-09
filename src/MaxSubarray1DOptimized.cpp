//Optimized Approach for 1D case of Maximum Subarray Problem (using Kadane's Algorithm)

#include <Rcpp.h>
using namespace Rcpp;

//' @export
 // [[Rcpp::export]]
 List max_subarray_sum_opt_Rcpp(IntegerVector arr) {
   int n = arr.size();
   if (n == 0) return List::create(Named("sum") = 0, Named("subarray") = IntegerVector());

   // Cas triviaux
   bool all_positive = true;
   bool all_negative = true;
   int max_val = arr[0];
   int total_sum = 0;

   for (int i = 0; i < n; ++i) {
     if (arr[i] < 0) all_positive = false;
     if (arr[i] > 0) all_negative = false;
     if (arr[i] > max_val) {
       max_val = arr[i];
     }
     total_sum += arr[i];
   }

   if (all_positive) return List::create(Named("sum") = total_sum, Named("subarray") = arr);
   if (all_negative) return List::create(Named("sum") = max_val, Named("subarray") = IntegerVector::create(max_val));

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
