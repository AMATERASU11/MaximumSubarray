#include "utils.h"
#include <numeric>
#include <climits>

bool all_non_negative(const std::vector<std::vector<int>> &mat) {
  for (const auto &row : mat)
    for (int val : row)
      if (val < 0) return false;
      return true;
}

bool all_non_positive(const std::vector<std::vector<int>> &mat) {
  for (const auto &row : mat)
    for (int val : row)
      if (val > 0) return false;
      return true;
}

int total_sum(const std::vector<std::vector<int>> &mat) {
  int sum = 0;
  for (const auto &row : mat)
    sum += std::accumulate(row.begin(), row.end(), 0);
  return sum;
}

int max_element_2d(const std::vector<std::vector<int>> &mat) {
  int maxVal = INT_MIN;
  for (const auto &row : mat)
    for (int val : row)
      maxVal = std::max(maxVal, val);
  return maxVal;
}
