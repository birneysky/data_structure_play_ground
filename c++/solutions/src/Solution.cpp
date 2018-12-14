#include "solution.hpp"
#include <vector>
#include <string>

std::vector<int> Solution::twoSum(std::vector<int>& nums, int target) {
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

Solution::ListNode* Solution::addTwoNumbers(ListNode* l1, ListNode* l2) {

    if (!l1 || !l2 ) {
        return l1 ? l1 : l2;
    }
    
    int takerOver = 0;
    ListNode* p1 = l1;
    ListNode* p2 = l2;
    ListNode* pr = nullptr;
    ListNode* head = nullptr;
    while (p1 || p2 || 1 == takerOver) {
        int value = 0;
        if (p1) {
            value += p1->val;
        }
        if (p2) {
            value += p2->val;
        }
        value += takerOver;
        if (!pr) {
            pr = new ListNode(0);
            head = pr;
        } else {
            pr ->next = new ListNode(0);
            pr = pr->next;
        }
        if (value < 10) {
            pr->val = value;
            takerOver = 0;
        } else {
            pr->val = value-10;
            takerOver = 1;
        }
        if (p1) {
            p1 = p1->next;
        }
        if (p2) {
            p2 = p2->next;            
        }
    }
    return head;
}

Solution::ListNode* Solution::addTwoNumbers2(ListNode* l1, ListNode* l2) {
    ListNode* dummyHead = new ListNode(0);
    ListNode* p = l1;
    ListNode* q = l2;
    int carry = 0;
    ListNode* current = dummyHead;
    while (nullptr != p || nullptr != q) {
        int x = nullptr != p ? p->val : 0;
        int y = nullptr != q ? q->val : 0;
        int sum = carry + x + y;
        if (current->next)
            current->next->val = sum % 10;
        else
            current->next = new ListNode(sum % 10);
        carry = sum / 10;
        current = current->next;
        
        if (carry > 0)
            current->next = new ListNode(carry);
        
        if (p)
            p = p->next;
    
        if (q)
            q = q->next;
    }
    return dummyHead->next;
}


int Solution::lengthOfLongestSubstring(std::string s) {
    return 0;
}


double Solution::findMedianSortedArrays(std::vector<int>& nums1, std::vector<int>& nums2) {
    return 0.0;
}
