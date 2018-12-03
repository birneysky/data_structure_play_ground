#ifndef SOLUTION_H
#define SOLUTION_H
#include <vector>


class solution{
protected:
    struct ListNode {
         int val;
         ListNode *next;
         ListNode(int x) : val(x), next(NULL) {}
    };
public:
	/*
	给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的 两个 整数。
	你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
	eg:	给定 nums = [2, 7, 11, 15], target = 9
		因为 nums[0] + nums[1] = 2 + 7 = 9
		所以返回 [0, 1]
     
        Given an array of integers, return indices of the two numbers such that they add up to a specific target.
        You may assume that each input would have exactly one solution, and you may not use the same element twice.
	*/
	std::vector<int> twoSum(std::vector<int>& nums, int target);
    
    /*
        给出两个 非空 的链表用来表示两个非负的整数。
        其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
        如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
        您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
         eg: 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
         输出：7 -> 0 -> 8
         原因：342 + 465 = 807
     
        You are given two non-empty linked lists representing two non-negative integers.
        The digits are stored in reverse order and each of their nodes contain a single digit.
        Add the two numbers and return it as a linked list.
        You may assume the two numbers do not contain any leading zero, except the number 0 itself.
        */
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2);
    
    /*
            给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
            Given a string, find the length of the longest substring without repeating characters
            eg1:  输入: "abcabcbb"
                   输出: 3
                   解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
     
            eg2:  输入: "bbbbb"
                    输出: 1
                    解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
     
            eg3:  输入: "pwwkew"
                     输出: 3
                     解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
                     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
        */
    int lengthOfLongestSubstring(std::string s);
};

#endif
