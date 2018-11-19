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

template <typename E>
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
private:
    void add(Node node, E e);
public:
    BST();
    ~BST();
    int getSize();
    bool isEmpty();
    void add(E e);
    
};

template<typename E>
BST<E>::BST() {
    root = nullptr;
    size = 0;
}
template<typename E>
BST<E>::~BST() {
    
}

template<typename E>
int BST<E>::getSize() {
    return size;
}

template<typename E>
bool BST<E>::isEmpty() {
    return size == 0;
}


/**
 向二分搜索树中添加元素e

 @param e 元素e
 */
template <typename E>
void BST<E>::add(E e) {
    if (nullptr == root) {
        root = new Node(e);
        size++;
    } else {
        add(root, e);
    }
}

/**
 向以node为根的二分搜索树中添加元素e，递归算法
 
 @param node 根节点
 @param e 元素e
 */
template <typename E>
void BST<E>::add(Node node, E e) {
    
}

#endif /* BST_hpp */
