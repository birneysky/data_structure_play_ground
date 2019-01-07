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
#include <sstream>
#include <exception>
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
    /**
     向以node为根的二分搜索树中添加元素e，递归算法
     
     @param node 结点
     @param e 元素e
     */
    void add_0(Node* node, E e);
public:
    /**
     向二分搜索树中添加元素e
     
     @param e 元素e
     */
    void add_0(E e);
private:
    /**
     向以node为根的二分搜索树中添加元素e，递归算法
     
     @param node 结点指针
     @param e 元素
     @return 返回插入新结点后新的二叉树的根
     */
    Node* add(Node* node, E e);
    
    /**
     以node 为根的二分搜索树中是否包含元素e
     
     @param node 结点指针
     @param e 元素
     @return 包含返回 true ，否则 返回 false
     */
    bool containts(Node* node, E e);
    
    /**
     以node 为根的搜索树进行前序遍历
     
     @param node 结点指针
     */
    void preOrder(Node* node);
    
    /**
     以node 为根的二叉树进行中序遍历
     
     @param node 结点指针
     */
    void inOrder(Node* node);
    
    /**
     以node 为根的二叉树树进行后续遍历
     
     @param node 结点指针
     */
    void postOrder(Node* node);
    
    
    /**
     以Node 为根的二叉树进行层序遍历

     @param node 节点指针
     */
    void levelOrder(Node* node);
    
    /**
     释放已 node 为根的整颗二叉树
     
     @param node 二叉树根结点
     */
    void free(Node* node);
    
    
    /**
     根据节点深度 以Node 为根的二叉树的字符串表示

     @param node 根结点
     @param depth 深度
     @param sstream 字符串流
     */
    void toString(Node* node, int depth, std::stringstream& sstream) const;
    
    
    /**
     寻找以node为根的二分搜索树中的最小结点

     @param node 根结点
     @return 返回最小元素结点的地址
     */
    Node* minimum(Node* node);
    
    
    /**
     寻找以node 为根的二分搜索树中的值最大的结点

     @param node 根结点
     @return 最大元素结点的地址
     */
    Node* maximum(Node* node);
    
    
    /**
     删除以node为根的BST中的最小值结点

     @param node 当前根结点
     @return 返回新的BST的根节点
     */
    Node* removeMin(Node* node);
    
    
    /**
     删除以node为根的BST中的最大值结点

     @param node 根结点
     @return 返回删除最大结点后的根结点
     */
    Node* removeMax(Node* node);
public:
    BST();
    ~BST();
    /**
     重载二分搜索树的 << 运算符，方便通过cout 输出
     
     @param os cout 引用
     @param bst 二叉树引用
     @return 返回 cout引用
     */
    friend std::ostream& operator <<(std::ostream& os,const BST<E>& bst) {
        std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
        std::stringstream sstream;
        bst.toString(bst.root, 0, sstream);
        os << sstream.str();
        return os;
    }
    
    /**
     获取二分搜素树中的节点个数

     @return 节点个数
     */
    int getSize();
    
    
    /**
     判断二分搜索树是否为空

     @return 为空返回YES ，否则返回NO
     */
    bool isEmpty();
    
    
    /**
     在二分搜索树中添加元素

     @param e 添加的元素e
     */
    void add(E e);
    
    /**
     二分搜索树中是否包含元素e
     
     @param e 元素
     @return 包含返回 true ，否则 返回 false
     */
    bool containts(E e);
    
    
    /**
     前序遍历
     */
    void preOrder();
    
    /**
     中序遍历
     */
    void inOrder();
    
    /**
     后序遍历
     */
    void postOrder();
    
    /**
     层序遍历，广度优先遍历
     */
    void levelOrder();
    
    /**
     寻找二分搜索树的最小元素

     @return 返回最小元素的值
     */
    E minimum();
    
    
    /**
     寻找二分搜索树的最大元素

     @return 返回最大元素的值
     */
    E maximum();
    
    /**
     删除值最小的结点

     @return 返回最小值
     */
    E removeMin();
    
    
    /**
     删除值最大的结点

     @return 返回最大值
     */
    E removeMax();
};


template<typename E>
BST<E>::BST() {
    root = nullptr;
    size = 0;
}

template<typename E>
BST<E>::~BST() {
    std::cout << __FUNCTION__ << " : ";
    free(root);
    std::cout << std::endl;
}

template<typename E>
int BST<E>::getSize() {
    return size;
}

template<typename E>
bool BST<E>::isEmpty() {
    return size == 0;
}

template <typename E>
void BST<E>::add_0(E e) {
    if (nullptr == root) {
        root = new Node(e);
        size++;
    } else {
        add_0(root, e);
    }
}

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

template <typename E>
bool BST<E>::containts(E e) {
    return containts(root, e);
}

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

template <typename E>
void BST<E>::preOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    std::cout << node->e << ' ';
    preOrder(node->left);
    preOrder(node->right);
}



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

template<typename E>
void BST<E>::free(Node* node) {
    if (nullptr == node) {
        return;
    }
    
    if (node->left) {
        free(node->left);
        node->left = nullptr;
    }
    
    if (node->right) {
        free(node->right);
        node->right = nullptr;
    }
    
    if (!node->left && !node->right) {
        std::cout << node->e << ' ';
        delete node;
        node = nullptr;
    }
}

template<typename E>
void BST<E>::toString(Node* node, int depth, std::stringstream& sstream) const {
    auto depthstring = [](const int& depth) -> std::string {
        std::stringstream stream;
        for (int i = 0;i <= depth; i++) {
            stream << "-";
        }
        return stream.str();
    };
    if (nullptr == node) {
        sstream << depthstring(depth) << ' ' << "nullptr" << std::endl;
        return;
    }
    sstream << depthstring(depth) << ' ' << node->e << std::endl;
    toString(node->left, depth+1, sstream);
    toString(node->right, depth+1, sstream);
}


template<typename E>
E BST<E>::minimum() {
    Node* minNode =  minimum(root->left);
    if (minNode) {
        return minNode->e;
    } else {
        throw std::invalid_argument("bst is empty");
    }
}

template<typename E>
typename BST<E>::Node* BST<E>::minimum(Node* node){
    if (!node->left) {
        return node;
    }
    return minimum(node->left);
}


template<typename E>
E BST<E>::maximum() {
    Node* maxNode = maximum(root);
    if (maxNode) {
        return maxNode->e;
    } else {
        throw std::invalid_argument("BST is empty!");
    }
}

template<typename E>
typename BST<E>::Node* BST<E>::maximum(Node* node) {
    if (!node->right) {
        return node;
    }
    return maximum(node->right);
}

template<typename E>
E BST<E>::removeMin()  {
    if (getSize() == 0) {
        throw std::invalid_argument("BST is empty!");
    }
    E e = minimum();
    root = removeMin(root);
    return e;
}

template<typename E>
typename BST<E>::Node* BST<E>::removeMin(Node* node) {
    if (!node->left) {
        Node* rightNode = node->right;
        node->right = nullptr;
        delete node;
        size --;
        return rightNode;
    }
    
    node->left =  removeMin(node->left);
    return node;
}

template<typename E>
E BST<E>::removeMax() {
    if (size == 0) {
        throw std::invalid_argument("BST is eimpty");
    }
    
    E e = maximum();
    root = removeMax(root);
    return e;
}

template <typename E>
typename BST<E>::Node* BST<E>::removeMax(Node* node) {
    if (!node->right) {
        Node* leftNode = node->left;
        node->left = nullptr;
        delete node;
        size --;
        return leftNode;
    }
    
    node->right = removeMax(node->right);
    return node;
}


#endif /* BST_hpp */
