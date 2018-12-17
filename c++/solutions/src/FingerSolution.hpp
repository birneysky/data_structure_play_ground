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
    void printListReversingly(ListNode* node);
    
    
    void constructBinaryTree(int* preorder,int* inorder, int length);
    
    
    
    
};

#endif /* FingerSolution_hpp */
