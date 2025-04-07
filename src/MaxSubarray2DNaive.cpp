#include <Rcpp.h>
#include "utils.h"
using namespace Rcpp;

// Function to find the maximum sum rectangle in a 2D matrix
//' @export
 // [[Rcpp::export]]
 int max_subarray_rectangle_naive_Rcpp(NumericMatrix mat) {
   int n = mat.nrow();  // Nombre de lignes
   int m = mat.ncol();  // Nombre de colonnes

   // Cas trivial : tous les éléments positifs
   if (all_non_negative(mat)) {
     return total_sum(mat);
   }

   // Cas trivial : tous les éléments négatifs
   if (all_non_positive(mat)) {
     return max_element_2d(mat);
   }

   int maxSum = INT_MIN;

   // Parcours de toutes les sous-matrices possibles
   for (int up = 0; up < n; up++) {
     for (int left = 0; left < m; left++) {
       for (int down = up; down < n; down++) {
         for (int right = left; right < m; right++) {
           int sum = 0;
           for (int i = up; i <= down; i++) {
             for (int j = left; j <= right; j++) {
               sum += mat(i, j);  // Accès aux éléments de la matrice
             }
           }
           maxSum = std::max(maxSum, sum);  // Mise à jour de la somme maximale
         }
       }
     }
   }

   return maxSum;
 }
