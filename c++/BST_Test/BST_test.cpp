//
//  main.cpp
//  BST_Test
//
//  Created by birneysky on 2018/12/3.
//  Copyright © 2018 Grocery. All rights reserved.
//

#include <iostream>
#include <vector>
#include "BST.hpp"

int main(int argc, const char * argv[]) {
    
    int a[] = {50,30,70,60,20,35,75,18,55,25,68,63,100};
/*
*                               50
*                      /                   \
*                      30                   70
*                  /       \             /      \
*                 20       35        60        75
*              /     \                /    \        \
*             18      25         55     68      100
*                                            /
*                                           63
*/
    
    std::vector<int> va(a,a+sizeof(a)/sizeof(int));
    
    BST<int> bst = BST<int>();
    for (std::vector<int>::const_iterator it = va.begin(); it != va.end(); it++) {
        bst.add_0(*it);
    }
    BST<int> bst1 = BST<int>();
    std::for_each(va.begin(), va.end(), [&bst1](const int& value) {
        bst1.add(value);
    });
    std::cout << "bst preOrder: ";
    bst.preOrder();
    std::cout << std::endl;
    
    std::cout << "bst1 preOrder: ";
    bst1.preOrder();
    std::cout << std::endl;
    
    std::cout << "bst inOrder: ";
    bst.inOrder();
    std::cout << std::endl;
    
    std::cout << "bst1 inOrder: ";
    bst1.inOrder();
    std::cout << std::endl;
 
    std::cout << "bst postOrder: ";
    bst.postOrder();
    std::cout << std::endl;
    
    std::cout << "bst1 postOrder: ";
    bst1.postOrder();
    std::cout << std::endl;

    std::cout << "bst levelOrder: ";
    bst.levelOrder();
    std::cout << std::endl;
    std::cout << "Hello, BST!\n";
    std::cout << bst.getSize() << bst.isEmpty() << std::endl;
    std::cout << bst << std::endl;
    return EXIT_SUCCESS;
}
