#ifndef SOLUTION_H
#define SOLUTION_H
#include <vector>
#include <sstream>
#include <iostream>

class Solution{
public:
    struct ListNode {
        int val;
        ListNode *next;
        ListNode(int x) : val(x), next(NULL) {}
        friend std::ostream& operator<<(std::ostream& out, ListNode& head) {
            std::stringstream stream;
            ListNode* pNode = &head;
            while (pNode) {
                stream << pNode->val << "->";
                if (!pNode->next) {
                    stream << "nullptr";
                }
                pNode = pNode->next;
            }
            out << stream.str();
            return out;
        }
    };
public:
	/*  1
	给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的 两个 整数。
	你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
	eg:	给定 nums = [2, 7, 11, 15], target = 9
		因为 nums[0] + nums[1] = 2 + 7 = 9
		所以返回 [0, 1]
     
        Given an array of integers, return indices of the two numbers such that they add up to a specific target.
        You may assume that each input would have exactly one solution, and you may not use the same element twice.
	*/
	std::vector<int> twoSum(std::vector<int>& nums, int target);
    
    /*  2
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
    ListNode* addTwoNumbers2(ListNode* l1, ListNode* l2);
    
    /* 3
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
    
    /* 4
            定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
            请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
            你可以假设 nums1 和 nums2 不会同时为空
            eg1:
                nums1 = [1, 3]
                nums2 = [2]
                则中位数是 2.0
            eg2:
                nums1 = [1, 2]
                nums2 = [3, 4]
                则中位数是 (2 + 3)/2 = 2.5
     
        There are two sorted arrays nums1 and nums2 of size m and n respectively.
        Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
        You may assume nums1 and nums2 cannot be both empty.
        */
    double findMedianSortedArrays(std::vector<int>& nums1, std::vector<int>& nums2);
    
    
    /**
     283
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     @param nums 数组
     @note 说明:
     
     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。
     */
    void moveZeroes(std::vector<int>& nums) {
        int i = 0; /// 索引 i 记录当前考察的元素
        int j = 0; /// 索引 j 记录当前第一个值为 0 元素的索引
        while (i < nums.size() && j < nums.size()) {
            if (nums[i] != 0 && nums[j] == 0) {
                std::swap(nums[i++], nums[j++]);
                continue;
            }
            
            if (nums[i] == 0 && nums[j] != 0) {
                i++;
                j++;
                continue;
            }
            
            if (nums[i] == 0 && nums[j] == 0) {
                i++;
                continue;
            }
            
            
            if (nums[i] != 0 && nums[j] != 0) {
                i++;
                j++;
                continue;
            }
        }
    }
    
    /**
     * 283
     */
    void moveZeroes1(std::vector<int>& nums) {
        std::ios::sync_with_stdio(false);
        std::cin.tie(0);
        int j = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != 0) {
                if (i != j) {
                    std::swap(nums[i], nums[j]);
                }
                j++;
            }
        }
    }
    
    /**
     * 283
     */
    void moveZeroes2(std::vector<int>& nums) {
        std::ios::sync_with_stdio(false);
        std::cin.tie(0);
        int j = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != 0) {
                if (i != j) {
                    nums[j] = nums[i];
                }
                j++;
            }
        }
        
        for (int i = j; i < nums.size(); i++) {
            nums[i] = 0;
        }
    }
    
    
    /** 26
     给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
     
     不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。

     例如
        给定数组 nums = [1,1,2],
        函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
     
        你不需要考虑数组中超出新长度后面的元素。
     
     nums = [0,0,1,1,1,2,2,3,3,4] =====>  [0, 1, 2, 3, 4] return 5;
     @param nums 数组
     @return 去重后数组的长度
     */
    int removeDuplicates(std::vector<int>& nums) {
        if (nums.size() == 0) {
            return 0;
        }
        int j = 1; /// 索引j 似的[0,j] 区间内都是不重复的元素
        for( int i = j+1; i < nums.size(); i++) {
            /// 由于是有序数组，所以当前元素和前一个元素不同时，说明出现了新的元素
            if (nums[i] != nums[i-1]) {
                nums[j] = nums[i];
                j ++;
            }
        }
        return j;
    }
    
    
    /** 80
     给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素最多出现两次，返回移除后数组的新长度。
     
     不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。

      [1,1,1,2,2,3], ===> length = 5  1, 1, 2, 2, 3
      [0,0,1,1,1,1,2,3,3] ===> length = 7   0, 0, 1, 1, 2, 3, 3
     @param nums  数组
     @return 去重后数组的长度
     */
    int removeDuplicates_2(std::vector<int>& nums) {
        
        int k = 2;
        if (nums.size() <= k) {
            return (int)nums.size();
        }
        for (int i = k; i < nums.size(); i++) {
            if (nums[i] != nums[i-2]) {
                nums[k++] = nums[i];
            }
        }
        return k;
    }
    
    
};

#endif
