//Optimized Approach for 1D case of Maximum Subarray Problem (using Kadane's Algorithm)

#include <bits/stdc++.h>
using namespace std;

// Function to find the maximum subarray sum
int maxSubarraySum(vector<int> &arr) {
  int res = arr[0];
  int maxEnding = arr[0];

  for (int i = 1; i < arr.size(); i++) {

    // Find the maximum sum ending at index i by either extending
    // the maximum sum subarray ending at index i - 1 or by
    // starting a new subarray from index i
    maxEnding = max(maxEnding + arr[i], arr[i]);

    // Update res if maximum subarray sum ending at index i > res
    res = max(res, maxEnding);
  }
  return res;
}
