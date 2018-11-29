#include "solution.hpp"
#include <vector>

std::vector<int> solution::twoSum(std::vector<int>& nums, int target) {
	std::vector<int> sums;
	for (int i = 0; i < nums.size(); i++ ){
		for(int j = 0; i < nums.size(); j++) {
			if(j != i && target == nums[i] + nums[j]) {
				sums.push_back(nums[i]);
				sums.push_back(nums[j]);
				return sums;
			}
		}
	}
	return sums;
}
