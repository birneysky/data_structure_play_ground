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
    };

private:
    Node* root;
    int size;
public:
    Trie();
    ~Trie();
    int getSize();
    void add(std::string word);

};

#endif /* Trie_hpp */
