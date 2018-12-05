//
//  BST.hpp
//  PlayGround
//
//  Created by birneysky on 2018/11/19.
//  Copyright © 2018 Grocery. All rights reserved.
//

#ifndef BST_hpp
#define BST_hpp

#include <iostream>
#include <queue>
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
public:
    void add_0(E e);
private:
    Node* add(Node* node, E e);
    bool containts(Node* node, E e);
    void preOrder(Node* node);
    void inOrder(Node* node);
    void postOrder(Node* node);
    void levelOrder(Node* node);
public:
    BST();
    ~BST();
    int getSize();
    bool isEmpty();
    void add(E e);
    bool containts(E e);
    void preOrder();
    void inOrder();
    void postOrder();
    void levelOrder();
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


/**
 二分搜索树中是否包含元素e

 @param e 元素
 @return 包含返回 true ，否则 返回 false
 */
template <typename E>
bool BST<E>::containts(E e) {
    return containts(root, e);
}


/**
 以node 为根的二分搜索树中是否包含元素e

 @param node 节点指针
 @param e 元素
 @return 包含返回 true ，否则 返回 false
 */
template <typename E>
bool BST<E>::containts(Node* node, E e) {
    if (nullptr == node) {
        return false;
    }
    
    if (e == node->e) {
        return true;
    } else if (e > node->e) {
        return containts(node->right, e);
    } else {
        return containts(node->left, e);
    }
}

template <typename E>
void  BST<E>::preOrder() {
    preOrder(root);
}


/**
 以node 为根的搜索树进行前序遍历

 @param node 节点指针
 */
template <typename E>
void BST<E>::preOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    std::cout << node->e << ' ';
    preOrder(node->left);
    preOrder(node->right);
}


/**
 中序遍历
 */
template <typename E>
void BST<E>::inOrder() {
    inOrder(root);
}

template <typename E>
void BST<E>::inOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    inOrder(node->left);
    std::cout << node->e << ' ';
    inOrder(node->right);
}

/**
 后序遍历
 */
template <typename E>
void BST<E>::postOrder() {
    postOrder(root);
}

template <typename E>
void BST<E>::postOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    postOrder(node->left);
    postOrder(node->right);
    std::cout << node->e << ' ';
}
/**
 层序遍历，广度优先遍历
 */
template <typename E>
void BST<E>::levelOrder() {
    levelOrder(root);
}

template <typename E>
void BST<E>::levelOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    std::queue<Node*> queue;
    queue.push(node);
    while (!queue.empty()) {
        Node* node =  queue.front();
        queue.pop();
        std::cout << node->e << ' ';
        if (node->left) {
            queue.push(node->left);
        }
        if (node->right) {
            queue.push(node->right);
        }
    }
}

#endif /* BST_hpp */
