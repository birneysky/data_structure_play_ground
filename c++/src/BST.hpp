//
//  BST.hpp
//  PlayGround
//
//  Created by birneysky on 2018/11/19.
//  Copyright © 2018 Grocery. All rights reserved.
//

#ifndef BST_hpp
#define BST_hpp

#include <stdio.h>

export template <typename E>
class BST {
    
protected:
    class Node {
    public:
        E e;
        Node* left;
        Node* right;
        Node(E e) {
            this->e =e;
            left = nullptr;
            right == nullptr;
        }
    };

private:
    Node* root;
    int size;
public:
    BST();
    ~BST();
    int getSize();
    bool isEmpty();
    
    
};

template<typename T>
BST<T>::BST() {
    root = nullptr;
    size = 0;
}
template<typename T>
BST<T>::~BST() {
    
}

template<typename T>
int BST<T>::getSize() {
    return size;
}
template<typename T>
bool BST<T>::isEmpty() {
    return size == 0;
}



#endif /* BST_hpp */
