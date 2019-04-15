#ifndef SOLUTION_H
#define SOLUTION_H
#include <vector>
#include <sstream>
#include <string>
#include <iostream>
#include <cassert>

class Solution{
private:
    /**
     对一个数组的[left,right]区间内的元素做快速排序的 partitionn 操作

     @param vector<int>nums 数组
     @param left 左索引值
     @param right 右索引值
     @return 返回标定点的索引
     */

    int partition(std::vector<int>& nums, int left, int right) {
        int val = nums[left];
        int j = left;
        for (int i = left + 1; i <= right; i++) {
            if (nums[i] < val) {
                j++;
                std::swap(nums[i],nums[j]);
            }
        }
        std::swap(nums[left],nums[j]);
        return j;
    }
    
    int findKthLargest(std::vector<int>& nums, int left, int right, int k) {
        int p = partition(nums, left, right);
        int kth = (int)(nums.size() - k);
        if (p == kth) {
            return p;
        } else if (p < kth) {
            return findKthLargest(nums, p+1, right,k);
        } else {
            return findKthLargest(nums, left, p-1,k);
        }
    }
    
    bool isALetterOrANumber(char ch) {
        return isLetter(ch) || isNumber(ch);
    }
    
    bool isLetter(char ch) {
        if ((ch >= 'A' && ch <= 'Z') ||
            (ch >= 'a' && ch <= 'z') ) {
            return true;
        }
        return false;
    }
    
    bool isNumber(char ch) {
        return (ch >= '0' && ch <= '9');
    }
    
    
    /**
     判断两个字符是否相同
     
     这里相同的定义是 'a' 'A' 是认为是相同的
     所以如果 a 和 b 全部都是字母，那么要注意大小写字母不敏感的逻辑
     
     @param a 字符a
     @param b 字符b
     @return 如果相同返回YES，否则返回NO
     */
    bool isSampleLetter(char a, char b) {
        if (isLetter(a) && isLetter(b)) {
            return a == b || abs(a - b) == 32;
        }
        
        return a == b;
    }
    
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
        for( int i = j; i < nums.size(); i++) {
            /// 由于是有序数组，所以当前元素和前一个元素不同时，说明出现了新的元素
            if (nums[i] != nums[i-1]) {
                nums[j] = nums[i];
                j ++;
            }
        }
        return j;
    }
    
    /** 27
     给定一个数组 nums 和一个值 val，你需要原地移除所有数值等于 val 的元素，返回移除后数组的新长度。
     
     不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
     
     元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

    nums = [3,2,2,3], val = 3 =====> [2,2] ,2
    nums = [0,1,2,2,3,0,4,2], val = 2 =====> [0, 1, 3, 0, 4] ,5
     
     @param nums 数组
     @param val 待删除元素的值
     @return 返回删除元素后数组的长度
     */
    int removeElement(std::vector<int>& nums, int val) {
        int k = 0;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != val) {
//                if (i != k) {
                    nums[k++] = nums[i];
//                }
            }
        }


        return k;
    }
    
    /** 75
     给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
     
     此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

     [2,0,2,1,1,0] ====> [0,0,1,1,2,2]
     
     @param nums 数组

     */
    
    void sortColors(std::vector<int>& nums) {
        int colorCounts[3] = {0};
        for (int i = 0; i < nums.size(); i++) {
            colorCounts[nums[i]] ++;
        }
        
        for (int i = 0; i < colorCounts[0]; i++) {
            nums[i] = 0;
        }
        
        for (int i = 0; i < colorCounts[1]; i++) {
            nums[i + colorCounts[0]] = 1;
        }
        
        for (int i = 0; i < colorCounts[2]; i++) {
            nums[i + colorCounts[0] + colorCounts[1]] = 2;
        }
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
        /// 始终让[0,k)区间内，重复元素最多有2个
        for (int i = k; i < nums.size(); i++) {
            if (i != k) {
                nums[k] = nums[i];
            }
            /// 检查 k 之前前2个元素是否与 k相等，如果相等说明有nums[k],nums[k-1],nums[k-2]均相等，这时 k 的位置应该保持不变
            /// 如果 nums[k] 与 nums[k-1],nums[k-2] 其中一个不相等，说明没有超过两个的重复元素，这时 k 应该向后移动一位
            if (nums[k] != nums[k-1] ||
                nums[k] != nums[k-2]) {
                k++;
            }
        }
        return k;
    }
    
    
    /** 88
     给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
     初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
     你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
     
     
     nums1 = [1,2,3,0,0,0], m = 3
     nums2 = [2,5,6],       n = 3      =======>  [1,2,2,3,5,6]

     @param nums1 数组1
     @param m 数组1 长度
     @param nums2 数组2
     @param n 数组2 长度
     */
    void merge(std::vector<int>& nums1, int m, std::vector<int>& nums2, int n) {
        std::vector<int> aux(m,0); /// auxiliar
        for (int i = 0; i < m; i++) {
            aux[i] = nums1[i];
        }
        
        int i = 0; /// 记录 nums1 当前考察元素的索引
        int j = 0; ///  记录 nums2 当前考察元素的索引
        for(int k = 0; k < m+n; k++) {
            if (i >= m) {
                nums1[k] = nums2[j++];
            } else if (j >= n) {
                nums1[k] = aux[i++];
            } else if (aux[i] < nums2[j]) {
                nums1[k] = aux[i++];
            } else {
                nums1[k] = nums2[j++];
            }
        }
    }
    
    
    /**
     125
     给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
     
     说明：本题中，我们将空字符串定义为有效的回文串。
     
     示例 1:
     
     输入: "A man, a plan, a canal: Panama"
     输出: true
     示例 2:
     
     输入: "race a car"
     输出: false

     @param s 字符串
     @return 如果是 返回 true ，否则 返回 false
     */
    bool isPalindrome(std::string s) {
        if (s.length() == 0) {
            return true;
        }
        
        int l = 0;
        int r = 0;

        for (int i = (int)s.length()-1; i >= 0; i--) {
            if (isALetterOrANumber(s.at(i))) {
                r = (int)i;
                break;
            }
        }
        
        while (l < r) {
            while(!isALetterOrANumber(s[l])) {
                l++;
            }
            
            while(!isALetterOrANumber(s[r])) {
                r --;
            }
            
            if (l >= r) {
                return true;
            }
            
            if (isSampleLetter(s[l],s[r])) {
                l++;
                r--;
            } else {
                return false;
            }
        }
        
        return true;
    }
    
    /**
     167
     给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
     
     函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
     
     返回的下标值（index1 和 index2）不是从零开始的。
     你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。

     @param numbers 目标数组
     @param target 目标值
     @return 返回索引数组
     */
    std::vector<int> twoSum_167(std::vector<int>& numbers, int target) {
        std::vector<int> result;
        int left = 0;
        int right = (int)numbers.size() - 1;
        while (left < right) {
            if (numbers[left] + numbers[right] == target) {
                result.push_back(left);
                result.push_back(right);
                break;
            } else if (numbers[left] + numbers[right] < target) {
                left ++;
            } else {
                right --;
            }
        }
        return result;
    }
    
    /**
     215
     在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

     [3,2,1,5,6,4] 和 k = 2  ====> 5
     [3,2,3,1,2,4,5,5,6] 和 k = 4 ====> 4
     
     @param nums 数组1
     @param k k
     @return 返回元素的值
     */
    
    int findKthLargest(std::vector<int>& nums, int k) {
        assert(k > 0 && k < nums.size());
        int left = 0;
        int right = (int)(nums.size() -1);
        int kth = findKthLargest(nums,left,right,k);
        return nums[kth];
    }
    
    
    
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
    
    
    /**
     334
     给定一个未排序的数组，判断这个数组中是否存在长度为 3 的递增子序列。
     
     数学表达式如下:
     
     如果存在这样的 i, j, k,  且满足 0 ≤ i < j < k ≤ n-1，
     使得 arr[i] < arr[j] < arr[k] ，返回 true ; 否则返回 false 。
     说明: 要求算法的时间复杂度为 O(n)，空间复杂度为 O(1) 。

     @param nums  数组
     @return 存在 返回 true ，否则 返回 false
     */
    bool increasingTriplet(std::vector<int>& nums) {
        return true;
    }
    
#pragma mark - Byte Dance
    /**  3
     给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

     输入: "abcabcbb"
     输出: 3
     解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
     
     输入: "bbbbb"
     输出: 1
     解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
     
     输入: "pwwkew"
     输出: 3
     解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
     
     @param s 字符串你
     @return 最长子串的长度
     */
    int lengthOfLongestSubstring1(std::string s) {
        return  0;
    }
    

    /**
      编写一个函数来查找字符串数组中的最长公共前缀。

     输入: ["flower","flow","flight"]
     输出: "fl"
     
     输入: ["dog","racecar","car"]
     输出: ""
     解释: 输入不存在公共前缀。
     
     说明:
     
     所有输入只包含小写字母 a-z 。
     
     @param strs 字符串
     @return 最长公共前缀4
     */
    std::string longestCommonPrefix(std::vector<std::string>& strs) {
        return "";
    }
    
    
    
};

#endif
