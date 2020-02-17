//
//  Trie.hpp
//  PlayGround
//
//  Created by birney on 2018/12/21.
//  Copyright © 2018年 Grocery. All rights reserved.
//

#ifndef Trie_hpp
#define Trie_hpp

#include <cstdio>
#include <unordered_map>
#include <iostream>

class Trie {
protected:
    struct Node {
        bool isWord;
        std::unordered_map<char, Node*> next;
        Node() {
            isWord = false;
        }
        
        Node(bool isWord) {
            this->isWord = isWord;
        }
        
        ~Node() {
            std::cout << "~Node: ";
            std::for_each(next.begin(), next.end(), [](std::pair<char, Node*> pair){
                std::cout << pair.first << ' ';
                delete pair.second;
            });
        }
        
    };

private:
    Node* root;
    int size;
public:
    Trie();
    ~Trie();
    int getSize();
    
    /**
     添加一个单词

     @param word 单词
     */
    void add(const std::string& word);
    
    
    /**
     判断是否包含一个单词

     @param word 单词
     @return 如果包含返回true ，否则返回false；
     */
    bool contains(const std::string& word);

};

#endif /* Trie_hpp */
