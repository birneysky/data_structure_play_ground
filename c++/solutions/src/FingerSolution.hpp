//
//  FingerSolution.hpp
//  solutions
//
//  Created by birneysky on 2018/12/15.
//  Copyright © 2018 Grocery. All rights reserved.
//

#ifndef FingerSolution_hpp
#define FingerSolution_hpp
#include <ostream>
#include <sstream>

/// https://github.com/zhedahht/CodingInterviewChinese2
class FingerSolution {
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
    
    struct TreeNode {
        int value;
        TreeNode* left;
        TreeNode* right;
        TreeNode(int val): value(val),left(nullptr),right(nullptr){}
    };
private:
    
    /**
     根据前序和中序遍历的子序列构建二叉树，并返回二叉树的根；

     @param startPreorder 前序遍历子序列首地址
     @param endPreorder 前序遍历子序列尾地址
     @param startInorder 中序遍历子序列首地址
     @param endInorder 中序遍历子序列尾地址
     @return 返回二叉树的根
     */
    TreeNode* constructBinaryTree(int* startPreorder,int* endPreorder,int* startInorder,int* endInorder);
public:
    
    /** 3
     找出数组中的一个重复数字
     一个长度为你的数组里的所有数字都在0~n-1的范围内。数组中某些元素是重复的，但是不知道有几个数字重复了，
     也不知道重复了几次，请找出数组中任意一个重复的数字。
     
     eg:
     {2,3,1,0,2,5,3}, 那么输出的输出的重复数字应该是2或者3
     
     @param numbers 数组
     @param length 数组长度
     @return 返回重复的数字，如果没有返回-1
     */
    int duplicate(int numbers[], int length);
    
    
    /** 4
     一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序
     输入上述性质的二维数组 matrix，和 一个数 number，判断该数组中是否包含这个整数

     @param matrix 二维数字
     @param rows 行
     @param columns 列
     @param number 查找目标
     @return 如果存在返回true ，否则返回 false；
     */
    bool find(int* matrix,int rows, int columns, int number);
    
    
    /**
     请实现一个函数，把字符串中的每个空格替换成“%20”，
     输入：“we are happy." 输出"we%20are%20happy."

     @param string 输入字符串
     @param length 字符串长度
     */
    void replaceBlank(char string[], int length);
    
    
    /**
     反向打印一个列表

     @param node 链表头结点
     */
    void printListReversingly_Recursively(ListNode* node);
    
    void printListReversingly_Iteratively(ListNode* node);
    
    
    /**
     输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输
     // 入的前序遍历和中序遍历的结果中都不含重复的数字。
     // 例如输入前序遍历序列{1,2, 4, 7, 3, 5, 6, 8}
     // 和中序遍历序列{4, 7, 2, 1, 5, 3, 8, 6}，则重建出
     //              1
     //          /       \
     //         2         3
     //        /        /   \
     //       4        5     6
     //         \           /
     //           7        8
     @param preorder 前序遍历
     @param inorder 中序遍历
     @param length 数组长度
     */
    TreeNode* constructBinaryTree(int* preorder,int* inorder, int length);
    
    
    /**
     打印是一个n位正整数的全排列
     
     如果输入 num[] = {0,0} len = 3 index = 0
     输出的数据应该是[0,99] 范围内的所有整数
     
     @param number n位数的数组，每一个元素表示一位，每个元素的取值范围[0,9]
     @param len 数组长度
     @param index 索引
     */
    void printPermutations(int* number, int len, int index);

};

#endif /* FingerSolution_hpp */
