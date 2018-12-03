#include "solution.hpp"
#include <vector>
#include <string>

std::vector<int> solution::twoSum(std::vector<int>& nums, int target) {
	std::vector<int> sums;
	for (int i = 0; i < nums.size(); i++ ){
		for(int j = 0; j < nums.size(); j++) {
			if(j != i && target == nums[i] + nums[j]) {
				sums.push_back(i);
				sums.push_back(j);
				return sums;
			}
		}
	}
	return sums;
}

solution::ListNode* solution::addTwoNumbers(ListNode* l1, ListNode* l2) {
    return nullptr;
}


int solution::lengthOfLongestSubstring(std::string s) {
    return 0;
}
