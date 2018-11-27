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

/* 二分搜索树
 每个节点的值大于其左子树所有节点值
 每个节点的值小于其右子树所有节点值
 其每一棵子树也是二分搜索树
 */
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
            right = nullptr;
        }
    };

private:
    Node* root;
    int size;
private:
    void add_0(Node* node, E e);
    Node* add(Node* node, E e);
public:
    BST();
    ~BST();
    int getSize();
    bool isEmpty();
    void add_0(E e);
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
void BST<E>::add_0(E e) {
    if (nullptr == root) {
        root = new Node(e);
        size++;
    } else {
        add_0(root, e);
    }
}

/**
 向以node为根的二分搜索树中添加元素e，递归算法
 
 @param node 节点
 @param e 元素e
 */
template <typename E>
void BST<E>::add_0(Node* node, E e) {
    if (e == node->e) {
        return;
    }
    
    if (e > node->e) {
        if (node->right) {
            add_0(node->right, e);
        } else {
            size++;
            node->right = new Node(e);
        }
    } else {
        if (node->left) {
            add_0(node->left, e);
        } else {
            size++;
            node->left = new Node(e);
        }
    }
}


/**
 向以node为根的二分搜索树中添加元素e，递归算法

 @param node 节点指针
 @param e 元素
 @return 返回插入新节点后新的二叉树的根
 */
template <typename E>
typename BST<E>::Node* BST<E>::add(Node *node, E e) {
    if (node == nullptr) {
        size++;
        return new Node(e);
    }
    
    if (e > node->e) {
        node->right = add(node->right, e);
    } else if( e < node->e ) {
        node->left = add(node->left, e);
    }
    return node;
}

template <typename E>
void BST<E>::add(E e) {
    root = add(root, e);
}

#endif /* BST_hpp */
