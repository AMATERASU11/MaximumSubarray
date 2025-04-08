#include <Rcpp.h>
#include <numeric>
#include <climits>
using namespace Rcpp;

// Fonction pour vérifier si tous les éléments sont positifs ou nuls
bool all_non_negative(const NumericMatrix &mat) {
  for (int i = 0; i < mat.nrow(); i++) {
    for (int j = 0; j < mat.ncol(); j++) {
      if (mat(i, j) < 0) return false;
    }
  }
  return true;
}

// Fonction pour vérifier si tous les éléments sont négatifs ou nuls
bool all_non_positive(const NumericMatrix &mat) {
  for (int i = 0; i < mat.nrow(); i++) {
    for (int j = 0; j < mat.ncol(); j++) {
      if (mat(i, j) > 0) return false;
    }
  }
  return true;
}

// Fonction pour calculer la somme totale de la matrice
int total_sum(const NumericMatrix &mat) {
  int sum = 0;
  for (int i = 0; i < mat.nrow(); i++) {
    for (int j = 0; j < mat.ncol(); j++) {
      sum += mat(i, j);
    }
  }
  return sum;
}

// Fonction pour trouver l'élément maximal dans la matrice
int max_element_2d(const NumericMatrix &mat) {
  int maxVal = INT_MIN;
  for (int i = 0; i < mat.nrow(); i++) {
    for (int j = 0; j < mat.ncol(); j++) {
      maxVal = std::max(maxVal, static_cast<int>(mat(i, j)));
    }
  }
  return maxVal;
}
