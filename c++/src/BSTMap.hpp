//
//  BSTMapMap.hpp
//  PlayGround
//
//  Created by birneysky on 2019/1/17.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef BSTMapMap_hpp
#define BSTMapMap_hpp

#include <iostream>
#include <queue>
#include <sstream>
#include <exception>
/* 二分搜索树
 每个节点的值大于其左子树所有节点值
 每个节点的值小于其右子树所有节点值
 其每一棵子树也是二分搜索树
 */
template <typename K,typename V>
class BSTMap {
    
private:
    class Node {
    public:
        K key;
        V value;
        Node* left;
        Node* right;
        Node(K key,V value) {
            this->key =key;
            this->value = value;
            left = nullptr;
            right = nullptr;
        }
        Node(const Node& node) {
            this->e = node.e;
            left = nullptr;
            right = nullptr;
        }
        
        ~Node(){
            std::cout << "~Node:" << this << " e:" << this->value << std::endl;
        }
    };
    
private:
    Node* root;
    int size;
private:
    /**
     向以node为根的二分搜索树中添加元素e，递归算法
     
     @param node 结点指针
     @param e 元素
     @return 返回插入新结点后新的二叉树的根
     */
    Node* add(Node* node, K key,V value);
    
    /**
     以node 为根的二分搜索树中是否包含元素e
     
     @param node 结点指针
     @param e 元素
     @return 包含返回 true ，否则 返回 false
     */
    bool containts(Node* node, K key);
    
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
     删除以node为根的BSTMap中的最小值结点，并释放该节点占用的内存
     
     @param node 当前根结点
     @return 返回新的BSTMap的根节点
     */
    Node* removeMin(Node* node);
    
    /**
     删除以node 为根的BSTMap中最小值的节点，不释放最小节点占用的内存，并将其返回
     
     @param node 当前根节点
     @param min 最小值节点指针引用
     @return 返回新的BSTMap的根节点
     */
    Node* deleteMin(Node* node, Node*& min);
    
    /**
     删除以node为根的BSTMap中的最大值结点，并释放该节点占用的内存
     
     @param node 根结点
     @return 返回删除最大结点后的根结点
     */
    Node* removeMax(Node* node);
    
    
    /**
     删除以node 为根的二分搜索树中值为e的节点，并释放该节点占用的内存，递归算法
     
     @param node 根节点
     @param e 元素值
     @return 返回删除节点后新的二分搜索树的根
     */
    Node* remove(Node* node, K key);
public:
    BSTMap();
    ~BSTMap();
    /**
     重载二分搜索树的 << 运算符，方便通过cout 输出
     
     @param os cout 引用
     @param BSTMap 二叉树引用
     @return 返回 cout引用
     */
    friend std::ostream& operator <<(std::ostream& os,const BSTMap<K,V>& BSTMap) {
        std::cout << "♥♥♥♥♥♥ " << __LINE__ << ' ' << __FUNCTION__ << " ♥♥♥♥♥♥" << std::endl;
        std::stringstream sstream;
        BSTMap.toString(BSTMap.root, 0, sstream);
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
    void add(K key,V value);
    
    /**
     二分搜索树中是否包含元素e
     
     @param e 元素
     @return 包含返回 true ，否则 返回 false
     */
    bool containts(K key);
    
    
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
    V minimum();
    
    /**
     寻找二分搜索树的最大元素
     
     @return 返回最大元素的值
     */
    V maximum();
    
    /**
     删除值最小的结点
     
     @return 返回最小值
     */
    V removeMin();
    
    
    /**
     删除值最大的结点
     
     @return 返回最大值
     */
    V removeMax();
    
    
    /**
     从二分搜索树中删除元素为e的的节点
     
     @param e e
     */
    void remove(K key);
};


template<typename K,typename V>
BSTMap<K,V>::BSTMap() {
    root = nullptr;
    size = 0;
}

template<typename K,typename V>
BSTMap<K,V>::~BSTMap() {
    std::cout << __FUNCTION__ << " : ";
    free(root);
    std::cout << std::endl;
}

template<typename K,typename V>
int BSTMap<K,V>::getSize() {
    return size;
}

template<typename K,typename V>
bool BSTMap<K,V>::isEmpty() {
    return size == 0;
}


template<typename K,typename V>
typename BSTMap<K,V>::Node* BSTMap<K,V>::add(Node *node, K key,V value) {
    if (node == nullptr) {
        size++;
        return new Node(key,value);
    }
    
    if (key > node->key) {
        node->right = add(node->right, key, value);
    } else if( key < node->key ) {
        node->left = add(node->left, key, value);
    }
    return node;
}

template<typename K,typename V>
void BSTMap<K,V>::add(K key,V value) {
    root = add(root, key, value);
}

template<typename K,typename V>
bool BSTMap<K,V>::containts(K key) {
    return containts(root, key);
}

template<typename K,typename V>
bool BSTMap<K,V>::containts(Node* node, K key) {
    if (nullptr == node) {
        return false;
    }
    
    if (key == node->key) {
        return true;
    } else if (key > node->key) {
        return containts(node->right, key);
    } else {
        return containts(node->left, key);
    }
}

template<typename K,typename V>
void  BSTMap<K,V>::preOrder() {
    preOrder(root);
}

template<typename K,typename V>
void BSTMap<K,V>::preOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    std::cout << node->e << ' ';
    preOrder(node->left);
    preOrder(node->right);
}



template<typename K,typename V>
void BSTMap<K,V>::inOrder() {
    inOrder(root);
}

template<typename K,typename V>
void BSTMap<K,V>::inOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    inOrder(node->left);
    std::cout << node->e << ' ';
    inOrder(node->right);
}

template<typename K,typename V>
void BSTMap<K,V>::postOrder() {
    postOrder(root);
}

template<typename K,typename V>
void BSTMap<K,V>::postOrder(Node* node) {
    if (nullptr == node) {
        return;
    }
    postOrder(node->left);
    postOrder(node->right);
    std::cout << node->e << ' ';
}

template<typename K,typename V>
void BSTMap<K,V>::levelOrder() {
    levelOrder(root);
}

template<typename K,typename V>
void BSTMap<K,V>::levelOrder(Node* node) {
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

template<typename K,typename V>
void BSTMap<K,V>::free(Node* node) {
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
        std::cout << node->value << ' ';
        delete node;
        node = nullptr;
    }
}

template<typename K,typename V>
void BSTMap<K,V>::toString(Node* node, int depth, std::stringstream& sstream) const {
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


template<typename K,typename V>
V BSTMap<K,V>::minimum() {
    Node* minNode =  minimum(root->left);
    if (minNode) {
        return minNode->value;
    } else {
        throw std::invalid_argument("BSTMap is empty");
    }
}

template<typename K,typename V>
typename BSTMap<K,V>::Node* BSTMap<K,V>::minimum(Node* node){
    if (!node->left) {
        return node;
    }
    return minimum(node->left);
}


template<typename K,typename V>
V BSTMap<K,V>::maximum() {
    Node* maxNode = maximum(root);
    if (maxNode) {
        return maxNode->value;
    } else {
        throw std::invalid_argument("BSTMap is empty!");
    }
}

template<typename K,typename V>
typename BSTMap<K,V>::Node* BSTMap<K,V>::maximum(Node* node) {
    if (!node->right) {
        return node;
    }
    return maximum(node->right);
}

template<typename K,typename V>
V BSTMap<K,V>::removeMin()  {
    if (getSize() == 0) {
        throw std::invalid_argument("BSTMap is empty!");
    }
    V v = minimum();
    root = removeMin(root);
    return v;
}

template<typename K,typename V>
typename BSTMap<K,V>::Node* BSTMap<K,V>::removeMin(Node* node) {
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

template<typename K,typename V>
typename BSTMap<K,V>::Node* BSTMap<K,V>::deleteMin(Node* node,Node*& min) {
    if (!node->left) {
        Node* rightNode = node->right;
        node->right = nullptr;
        min = node;
        size --;
        return rightNode;
    }
    node->left = deleteMin(node->left,min);
    return node;
}

template<typename K,typename V>
V BSTMap<K,V>::removeMax() {
    if (size == 0) {
        throw std::invalid_argument("BSTMap is eimpty");
    }
    
    V v = maximum();
    root = removeMax(root);
    return v;
}

template<typename K,typename V>
typename BSTMap<K,V>::Node* BSTMap<K,V>::removeMax(Node* node) {
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

template<typename K,typename V>
void BSTMap<K,V>::remove(K key) {
    root = remove(root,key);
}

template<typename K,typename V>
typename BSTMap<K,V>::Node* BSTMap<K,V>::remove(Node* node, K key) {
    if (!node) {
        return nullptr;
    }
    
    if (key > node->key) {
        node->right = remove(node->right, key);
        return node;
    } else if (key < node->key) {
        node->left = remove(node->left, key);
        return node;
    } else { /// 等于e
        /// 左子树为空
        if (!node->left) {
            Node* rightNode = node->right;
            node->right = nullptr;
            delete node;
            size --;
            return rightNode;
        }
        /// 右子树为空
        if (!node->right) {
            Node* leftNode = node->left;
            node->left = nullptr;
            delete node;
            size --;
            return leftNode;
        }
        
        /// 左右子树都不为空的情况
        /// 使用右子树中最小的元素替换删除节点，该节点是比待删除节点大的最小节点
        Node* successor = nullptr;
        Node* rightRoot = deleteMin(node->right, successor);
        assert(successor);
        successor->right = rightRoot;
        successor->left = node->left;
        node->left = nullptr;
        node->right = nullptr;
        delete node;
        return successor;
    }
}

#endif /* BSTMapMap_hpp */
