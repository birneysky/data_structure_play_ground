//
//  FingerSolution.cpp
//  solutions
//
//  Created by birneysky on 2018/12/15.
//  Copyright © 2018 Grocery. All rights reserved.
//

#include "FingerSolution.hpp"
#include <iostream>
#include <stack>
#include <cmath>

int FingerSolution::duplicate(int numbers[], int length) {
    if (!numbers || length <= 0) {
        return -1;
    }
    
    for (int i = 0; i < length; i++) {
        if (numbers[i] < 0 || numbers[i] > length -1) {
            return -1;
        }
    }
    
	for ( int i = 0; i < length;i++) {
        while (numbers[i] != i) {
            int v = numbers[i];
            if (v == numbers[v]) {
                return v;
            }
            std::swap(numbers[i], numbers[v]);
        }
	}
    return -1;
}

bool FingerSolution::find(int* matrix,int rows, int columns, int number) {
    if (!matrix && rows > 0 && columns > 0) {
        int row = 0;
        int column = columns -1;
        while (row < rows && column > 0) {
            int v = matrix[row*column+column];
            if (number > v) {
                row ++;
            } if (number < v) {
                column --;
            } else {
                return true;
            }
        }
    }
    return false;
}



/*
    0     1    2    3    4    5    6     7    8      9    10     11     12    13    14    15   16
   'w'   'a'  '  '  'a'    'r'   'e'   ' '    'h'   'a'    'p'    'p'    'y'    '\0'
                                                                                   ^                         ^
 
 0     1    2    3    4    5    6     7    8      9    10     11     12    13    14    15   16
 'w'  'a'  '  '   'a'    'r'   'e'  ' '          '%'   '2'   '0'     'h'     'a'   'p'    'p'   'y'   '\0'
                                 ^          ^
 
 0     1    2    3    4    5    6     7    8      9    10     11     12    13    14    15   16
 'w'  'a'  '  '               'a'  'r'   'e'   '%'    '2'   '0'     'h'     'a'   'p'    'p'   'y'   '\0'
             ^           ^
 */
void FingerSolution::replaceBlank(char string[], int length) {
    if (!string || length <= 0) {
        return;
    }
    int originLength = 0;
    int numberOfBlank = 0;
    int i = 0;
    while (string[i] != '\0') {
        originLength ++;
        if (string[i] == ' ') {
            numberOfBlank++;
        }
        i++;
    }
    /// 乘以2的原因是，字符串中本身包含空格
    int newLenth = originLength + numberOfBlank * 2;
    if (newLenth > length) {
        return;
    }
    
    int p2 = newLenth;
    int p1 = originLength;
    
    while (p2 > p1 && p1 >= 0) {
        if (string[p1] == ' ') {
            string[p2--] = '0';
            string[p2--] = '2';
            string[p2--] = '%';
            p1--;
        } else {
            string[p2--] = string[p1--];            
        }
    }
}

void FingerSolution::printListReversingly_Recursively(ListNode* node) {
    if (!node) {
        std::cout << "nullprt" << "->";
        return;
    } else {
        printListReversingly_Recursively(node->next);
        std::cout << node->val << "-->";
    }
}

void FingerSolution::printListReversingly_Iteratively(ListNode* node) {
    std::stack<ListNode*> stack;
    ListNode* cur = node;
    while (cur) {
        stack.push(cur);
        cur = cur->next;
    }
    
    while (!stack.empty()) {
        std::cout << stack.top()->val << "-->";
        stack.pop();
    }
}

FingerSolution::TreeNode* FingerSolution::constructBinaryTree(int* preorder,int* inorder, int length) {
    return constructBinaryTree(preorder, preorder + length - 1, inorder, inorder + length - 1);
}

FingerSolution::TreeNode*  FingerSolution::constructBinaryTree(int* startPreorder,int* endPreorder,int* startInorder,int* endInorder) {
    
    
    int rootValue = startPreorder[0];
    TreeNode* root = new TreeNode(rootValue);
//    long subInorderLen = endInorder - startInorder + 1;
//    int* endLeftSubInorder = nullptr;
//    int* startLeftSubInorder = nullptr;
//    for (int i = 0; i < subInorderLen; i++) {
//        if (startInorder[i] == rootValue) {
//            endLeftSubInorder = startInorder + (i - 1);
//        }
//    }
    
    return root;
}


void FingerSolution::printPermutations(int* number, int len, int index) {
    
    if (index == len) {
        std::stringstream stream;
        for ( int i = 0; i < len; i++) {
            stream << number[i];
        }
        std::cout << stream.str() << ' ';
        return;
    }
    
    for (int i = 0; i < 10; i++) {
        number[index] = i;
        printPermutations(number, len, index+1);
    }
}

double FingerSolution::absoluteValuationMethod(double curCashFlow, int years, double averageGrowthRate, double averageDiscountRate) {
    double finalCashFlow = 0;
    for( int i = 1; i <= years; i++) {
        double temp = curCashFlow * pow(1+averageGrowthRate,years) / pow(1+averageDiscountRate,years);
        std::cout << temp << std::endl;
        finalCashFlow += temp;
    }
    return finalCashFlow;
}

