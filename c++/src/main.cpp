//
//  main.cpp
//  PlayGround
//
//  Created by birneysky on 2018/11/19.
//  Copyright © 2018 Grocery. All rights reserved.
//

#include <iostream>
#include "BST.hpp"

int main(int argc, const char * argv[]) {
    // insert code here...
    /* 二分搜索树
            每个节点的值大于其左子树所有节点值
            每个节点的值小于其右子树所有节点值
            其每一棵子树也是二分搜索树
        */
    
    BST<int> a = BST<int>();
    
    std::cout << "Hello, BST!\n";
    std::cout << a.getSize() << a.isEmpty() << std::endl;
    return 0;
}
