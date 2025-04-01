// Naive Approach for 1D case of Maximum Subarray Problem

#include <bits/stdc++.h>
using namespace std;

// Function to find the sum of subarray with maximum sum
int maxSubarraySum(vector<int> &arr) {
  int res = arr[0];

  // Outer loop for starting point of subarray
  for(int i = 0; i < arr.size(); i++) {
    int currSum = 0;

    // Inner loop for ending point of subarray
    for(int j = i; j < arr.size(); j++) {
      currSum = currSum + arr[j];

      // Update res if currSum is greater than res
      res = max(res, currSum);
    }
  }
  return res;
}
