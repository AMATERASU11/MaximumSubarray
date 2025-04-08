#ifndef UTILS_H
#define UTILS_H

#include <Rcpp.h>

using namespace Rcpp;

bool all_non_negative(const NumericMatrix &mat);
bool all_non_positive(const NumericMatrix &mat);
int total_sum(const NumericMatrix &mat);
int max_element_2d(const NumericMatrix &mat);

#endif
