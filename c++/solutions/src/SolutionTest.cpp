//
//  SolutionTest.cpp
//  solutions
//
//  Created by birney on 2018/12/5.
//  Copyright © 2018年 Grocery. All rights reserved.
//

#include <iostream>
#include <vector>
#include <sstream>
#include "SolutionTest.hpp"
#include "solution.hpp"


template<typename T>
std::ostream& operator<<(std::ostream& out,std::vector<T> vec) {
    std::stringstream stream;
    typename std::vector<T>::iterator begin = vec.begin();
    typename std::vector<T>::iterator end = vec.end();
    if (begin != end) {
        stream << "[" << *begin;
        begin ++;
    } else {
        stream << "[";
    }
    
    std::for_each(begin, end, [&stream](T& value) {
        stream << "," << value;
    });
    stream << "]";
    out << stream.str();
    return out;
}

template<typename T>
Solution::ListNode* generateList(const std::vector<T>& vec) {
    Solution::ListNode* node1 =  new Solution::ListNode(0);
    Solution::ListNode* curNode = nullptr;
    std::for_each(vec.begin(), vec.end(), [&node1,&curNode](const int& val){
        if (!curNode) {
            curNode = node1;
            curNode->val = val;
        } else {
            curNode->next = new Solution::ListNode(val);
            curNode = curNode->next;
        }
    });
    return node1;
}

void freeList(Solution::ListNode* head) {
    
}

void SolutionTest::test_twoSum() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    Solution s;
    int a[] = {2,7,11,15};
    int target = 9;
    std::vector<int> nums(a,a+sizeof(a)/sizeof(int));
    std::vector <int> resut =  s.twoSum(nums,target);
    std::cout << resut << std::endl;
}
void SolutionTest::test_addTwoNumbers() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    Solution s;
    std::cout << "#### case1: " << std::endl;
    std::vector<int> v1 {2,4,3,7,5,6,9};
    std::vector<int> v2 {5,6,4,3,4};
    Solution::ListNode* list1 = generateList(v1);
    Solution::ListNode* list2 =  generateList(v2);
    std::cout << "list1: "<< *list1 << std::endl;
    std::cout << "list2: " << *list2 << std::endl;
    Solution::ListNode* result =  s.addTwoNumbers(list1,list2);
    std::cout << "list1+list2: " <<  *result << std::endl;
    
    std::cout << "#### case2: " << std::endl;
    
}
void SolutionTest::test_lengthOfLongestSubstring() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
}

void SolutionTest::test_findMedianSortedArrays() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
}
