//Optimized Approach for 1D case of Maximum Subarray Problem (using Kadane's Algorithm)

#include <Rcpp.h>
using namespace Rcpp;

// Function to find the maximum subarray sum
//' @export
 // [[Rcpp::export]]
 int max_subarray_sum_opt_Rcpp(IntegerVector arr) {
   int n = arr.size();
   if (n == 0) return 0;

   // Vérification des cas triviaux en une passe
   bool all_positive = true;
   bool all_negative = true;
   int max_val = arr[0];
   int sum = 0;

   for (int i = 0; i < n; ++i) {
     if (arr[i] < 0) all_positive = false;
     if (arr[i] > 0) all_negative = false;
     if (arr[i] > max_val) max_val = arr[i];
     sum += arr[i];
   }

   if (all_positive) return sum;
   if (all_negative) return max_val;

   // Algorithme de Kadane
   int max_so_far = arr[0];
   int max_ending_here = arr[0];

   for (int i = 1; i < n; ++i) {
     max_ending_here = std::max(arr[i], max_ending_here + arr[i]);
     max_so_far = std::max(max_so_far, max_ending_here);
   }

   return max_so_far;
 }
