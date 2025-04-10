#include <Rcpp.h>
using namespace Rcpp;

//' @export
 // [[Rcpp::export]]
 List max_subarray_rectangle_naive_Rcpp(NumericMatrix mat) {
   int n = mat.nrow();
   int m = mat.ncol();

   if (n == 0 || m == 0)
     return List::create(Named("sum") = R_NegInf, Named("submatrix") = NumericMatrix(0, 0));


   double maxSum = mat(0, 0);
   int top = 0, bottom = 0, left = 0, right = 0;

   for (int up = 0; up < n; ++up) {
     for (int l = 0; l < m; ++l) {
       for (int down = up; down < n; ++down) {
         for (int r = l; r < m; ++r) {
           double sum = 0.0;
           for (int i = up; i <= down; ++i) {
             for (int j = l; j <= r; ++j) {
               sum += mat(i, j);
             }
           }
           if (sum > maxSum) {
             maxSum = sum;
             top = up;
             bottom = down;
             left = l;
             right = r;
           }
         }
       }
     }
   }

   // Extract submatrix
   NumericMatrix submatrix(bottom - top + 1, right - left + 1);
   for (int i = 0; i <= bottom - top; ++i)
     for (int j = 0; j <= right - left; ++j)
       submatrix(i, j) = mat(top + i, left + j);

   return List::create(
     Named("sum") = maxSum,
     Named("submatrix") = submatrix
   );
 }
