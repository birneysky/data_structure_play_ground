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
#include <cstring>
#include "SolutionTest.hpp"
#include "Solution.hpp"
#include "FingerSolution.hpp"


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

template<typename T>
FingerSolution::ListNode* generateList_f(const std::vector<T>& vec) {
    FingerSolution::ListNode* node1 =  new FingerSolution::ListNode(0);
    FingerSolution::ListNode* curNode = nullptr;
    std::for_each(vec.begin(), vec.end(), [&node1,&curNode](const int& val){
        if (!curNode) {
            curNode = node1;
            curNode->val = val;
        } else {
            curNode->next = new FingerSolution::ListNode(val);
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
    std::vector<int> v3 {2,4,3,7,5};
    std::vector<int> v4 {5,6,4,3,4};
    Solution::ListNode* list3 = generateList(v3);
    Solution::ListNode* list4 =  generateList(v4);
    std::cout << "list3: "<< *list3 << std::endl;
    std::cout << "list4: " << *list4 << std::endl;
    Solution::ListNode* result1 =  s.addTwoNumbers(list3,list4);
    std::cout << "list3+list4: " <<  *result1 << std::endl;
    
    std::cout << "#### case3: " << std::endl;
    std::vector<int> v5 {9};
    std::vector<int> v6 {9};
    Solution::ListNode* list5 = generateList(v5);
    Solution::ListNode* list6 =  generateList(v6);
    std::cout << "list5: "<< *list5 << std::endl;
    std::cout << "list6: " << *list6 << std::endl;
    Solution::ListNode* result2 =  s.addTwoNumbers(list5,list6);
    std::cout << "list5+list6: " <<  *result2 << std::endl;
    
}

void SolutionTest::test_addTwoNumbers2() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    Solution s;
    std::cout << "#### case1: " << std::endl;
    std::vector<int> v1 {2,4,3,7,5,6,9};
    std::vector<int> v2 {5,6,4,3,4};
    Solution::ListNode* list1 = generateList(v1);
    Solution::ListNode* list2 =  generateList(v2);
    std::cout << "list1: "<< *list1 << std::endl;
    std::cout << "list2: " << *list2 << std::endl;
    Solution::ListNode* result =  s.addTwoNumbers2(list1,list2);
    std::cout << "list1+list2: " <<  *result << std::endl;
    
    std::cout << "#### case2: " << std::endl;
    std::vector<int> v3 {2,4,3,7,5};
    std::vector<int> v4 {5,6,4,3,4};
    Solution::ListNode* list3 = generateList(v3);
    Solution::ListNode* list4 =  generateList(v4);
    std::cout << "list3: "<< *list3 << std::endl;
    std::cout << "list4: " << *list4 << std::endl;
    Solution::ListNode* result1 =  s.addTwoNumbers2(list3,list4);
    std::cout << "list3+list4: " <<  *result1 << std::endl;
    
    std::cout << "#### case3: " << std::endl;
    std::vector<int> v5 {9};
    std::vector<int> v6 {9};
    Solution::ListNode* list5 = generateList(v5);
    Solution::ListNode* list6 =  generateList(v6);
    std::cout << "list5: "<< *list5 << std::endl;
    std::cout << "list6: " << *list6 << std::endl;
    Solution::ListNode* result2 =  s.addTwoNumbers2(list5,list6);
    std::cout << "list5+list6: " <<  *result2 << std::endl;
}

void SolutionTest::test_lengthOfLongestSubstring() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
}

void SolutionTest::test_findMedianSortedArrays() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
}

void SolutionTest::test_duplicate() {
    std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    int a[] = {2,3,1,0,2,5,3};
    FingerSolution s;
    std::cout << s.duplicate(a, 7) << std::endl;
    
    int b[] = {0,1,2,4,3,5,5};
    std::cout << s.duplicate(b, 7) << std::endl;
}

void SolutionTest::test_replaceBlank() {
    std::cout << "♥♥♥♥♥♥"  << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    FingerSolution s;
    auto testing = [&s](const std::string& testName,char str[],int length,const char* expected) {
        std::cout << testName << " begin: ";
        s.replaceBlank(str, length);
        if (!str || !expected) {
            std::cout << "failed." << std::endl;
        } else if(strcmp((const char*)str, (const char*)expected) == 0) {
            std::cout << "pass. str: " << str << std::endl;
        }
    };
    
    char a[] = {'w','e',' ','a','r','e',' ','h','a','p','p','y','\0','\0','\0','\0','\0'};
    testing(std::string("中间有空格😀"),a,sizeof(a)/sizeof(char),"we%20are%20happy");
    
    int len = 100;
    char b[100] = "hello   world";
    testing("中间有连续多个空格",b,len,"hello%20%20%20world");
    
    char c[100] = "     ";
    testing("全部是空格",c,len,"%20%20%20%20%20");
    
    char d[100] = "  are you kidding me?";
    testing("开始是连续空格",d,len,"%20%20are%20you%20kidding%20me?");
}

void SolutionTest::test_printListReversingly_Recursively() {
    std::cout << "♥♥♥♥♥♥"  << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    std::vector<int> v1 {2,4,3,7,5,6,9};
    FingerSolution::ListNode* list1 = generateList_f(v1);
    std::cout << "origin list: " << *list1 << std::endl;
    FingerSolution s;
    s.printListReversingly_Recursively(list1);
    std::cout << std::endl;
}

void SolutionTest::test_printListReversingly_Iteratively() {
    std::cout << "♥♥♥♥♥♥"  << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    std::vector<int> v1 {2,4,3,7,5,6,9};
    FingerSolution::ListNode* list1 = generateList_f(v1);
    
    std::cout << "origin list: " << *list1 << std::endl;
    FingerSolution s;
    s.printListReversingly_Iteratively(list1);
    std::cout << std::endl;
}

void SolutionTest::test_constructBinaryTree() {
    std::cout << "♥♥♥♥♥♥"  << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    
    int a[8] = {1,2,4,7,3,5,6,8};
    int b[8] = {4,7,2,1,5,3,8,6};
    FingerSolution s;
    FingerSolution::TreeNode* root =  s.constructBinaryTree(a, b, 8);
    std::cout << root << std::endl;
}

void SolutionTest::test_printPermutations() {
    std::cout << "♥♥♥♥♥♥"  << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    int num[] = {0,0};
    FingerSolution s;
    s.printPermutations(num, 2, 0);
    std::cout << std::endl;
    
    
    int num1[] = {0,0,0};
    s.printPermutations(num1, sizeof(num1)/sizeof(int), 0);
    std::cout << std::endl;
}

void SolutionTest::test_absoluteValuationMethod() {
    std::cout << "♥♥♥♥♥♥"  << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
    FingerSolution s;
    std::cout << s.absoluteValuationMethod(8.28, 10, 0.15, 0.09) << std::endl;
}

void SolutionTest::test_moveZeroes() {
    Solution s;

    std::vector<int> nums1{6,7,3,0,4,0,0,1};
    std::vector<int> nums2{0,0,0,1,2,3,0,4,0,5,0,0,6};
    std::vector<int> nums3{0,1,0,3,12};
    std::vector<int> nums4{6,7,3,0,4,0,0,1};
    std::vector<int> nums5{0,0,0,1,2,3,0,4,0,5,0,0,6};
    std::vector<int> nums6{0,1,0,3,12};
    std::vector<int> nums7{6,7,3,0,4,0,0,1};
    std::vector<int> nums8{0,0,0,1,2,3,0,4,0,5,0,0,6};
    std::vector<int> nums9{0,1,0,3,12};
    std::vector<int> nums10{6,7,3,0,4,0,0,1};
    std::vector<int> nums11{0,0,0,1,2,3,0,4,0,5,0,0,6};
    std::vector<int> nums12{0,1,0,3,12};
    
    s.moveZeroes(nums1);
    s.moveZeroes(nums2);
    s.moveZeroes(nums3);
    
    s.moveZeroes1(nums4);
    s.moveZeroes1(nums5);
    s.moveZeroes1(nums6);
    
    s.moveZeroes2(nums7);
    s.moveZeroes2(nums8);
    s.moveZeroes2(nums9);
    s.moveZeroes2(nums10);
    s.moveZeroes2(nums11);
    s.moveZeroes2(nums12);
}

void SolutionTest::test_removeDuplicates() {
    Solution s;
    std::vector<int> nums1{1,1,2};
    int length1 = 2;
    
    std::vector<int> nums2{0,0,1,1,1,2,2,3,3,4};
    int length2 = 5;
    
    std::vector<int> nums3;
    int length3 = 0;
    
    assert(s.removeDuplicates(nums1)==length1);
    assert(s.removeDuplicates(nums2)==length2);
    assert(s.removeDuplicates(nums3)==length3);
}

void SolutionTest::test_removeDuplicates_2() {
    Solution s;
    std::vector<int> nums1 {1,1};
    int length1 = 2;
    
    std::vector<int> nums2 {0,0,1,1,1,2,2,3,3,4};
    int length2 = 9;
    
    std::vector<int> nums3;
    int length3 = 0;
 
    
    std::vector<int> nums4 {0,0,0,0,1,1,2};
    int length4 = 5;
    
    std::vector<int> nums5 {0,0,1,1,1,1,2,2,2,3,4};
    int length5 = 8;
    
    std::vector<int> nums6 {0,0,0,1,1,1,2,2,2,3,3,4,4,4,5,5,5,6,6,7,7,8,8,9};
    int length6 = 19;
    
    std::vector<int> nums7 {0,1,2,3,4,5,6,7,8,9,10};
    int length7 = 11;
    
    assert(s.removeDuplicates_2(nums1) == length1);
    assert(s.removeDuplicates_2(nums2) == length2);
    assert(s.removeDuplicates_2(nums3) == length3);
    assert(s.removeDuplicates_2(nums4) == length4);
    assert(s.removeDuplicates_2(nums5) == length5);
    assert(s.removeDuplicates_2(nums6) == length6);
    assert(s.removeDuplicates_2(nums7) == length7);
}


void SolutionTest::test_removeElement() {
    Solution s;
    std::vector<int> nums1 {3,2,2,3};
    int val1 = 3;
    int length1 = 2;
    
    std::vector<int> nums2 {0,1,2,2,3,0,4,2};
    int val2 = 2;
    int length2 = 5;
    
    assert(s.removeElement(nums1, val1) == length1);
    assert(s.removeElement(nums2, val2) == length2);

}


void SolutionTest::test_merge() {
    Solution s;
    std::vector<int> nums1 {1,2,3,0,0,0};
    int m = 3;
    std::vector<int> nums2 {2,5,6};
    int n = 3;
    
    s.merge(nums1, m, nums2, n);
    
}


void SolutionTest::test_findKthLargest() {
    Solution s;
    std::vector<int> nums1 {5,8,9,2,1,6,7,10,3,4,0};
    int k = s.findKthLargest(nums1, 1);
    assert(k == 10);
    
    std::vector<int> nums2 {5,8,0,2,1,6,7,10,3,4,9};
    int k2 = s.findKthLargest(nums2,3);
    assert(k2 == 8);
    
    std::vector<int> nums3 {5,3,9,2,1,6,7,10,8,4,0};
    int k3 = s.findKthLargest(nums3, 4);
    assert(k3 == 7);
    
    std::vector<int> nums4 {5,8,9,2,1,6,7,10,3,4,0};
    int k4 = s.findKthLargest(nums4, 5);
    assert(k4 == 6);
}

void SolutionTest::test_sortColors() {
    Solution s;
    std::vector<int> nums1 {1,0,0,2,1,2,2,0,0};
    s.sortColors(nums1);
    
    std::vector<int> nums2 {1,1,1,2,2,2,2,2,2,2,0,0,0,0,0,1,1,1,2,2,2,2,0,0,0};
    s.sortColors(nums2);
    
    std::vector<int> nums3 {1,0,2,0,0,1,0,2,0,0,1,0,2,0,0,2,2,2,0,1,0};
    s.sortColors(nums3);
    
}

void SolutionTest::test_twoSum_167() {
    Solution s;
    
    std::vector<int> num1 {1,2,3,4,5,6,7,8,13,20,24,26,50};
    auto result1 =  s.twoSum_167(num1, 26);
    
    std::vector<int> num2 {2,7,11,15};
    auto result2 = s.twoSum_167(num2, 9);
    
}


void SolutionTest::test_isPalindrome() {
    Solution s;
    
    std::string s1 = "A man, a plan, a canal: Panama";
    auto result1 =  s.isPalindrome(s1);
    assert(result1);
    
    std::string s2 = "race a car";
    auto result2 = s.isPalindrome(s2);
    assert(!result2);
    
    std::string s3 = "a";
    auto result3 = s.isPalindrome(s3);
    assert(result3);
    
    std::string s4 = "";
    auto result4 = s.isPalindrome(s4);
    assert(result4);
    
    std::string s5 = " ";
    auto result5 = s.isPalindrome(s5);
    assert(result5);

    std::string s6 = "0P";
    auto result6 = s.isPalindrome(s6);
    assert(!result6);
    
    std::string s7 = "1b1";
    auto result7 = s.isPalindrome(s7);
    assert(result7);
}
