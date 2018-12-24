//
//  Trie.cpp
//  PlayGround
//
//  Created by birney on 2018/12/21.
//  Copyright © 2018年 Grocery. All rights reserved.
//

#include "Trie.hpp"
#include "string"

Trie::Trie() {
    root = new Node();
    size = 0;
}

Trie::~Trie() {
    delete root;
}


int Trie::getSize() {
    return size;
}

void Trie::add(const std::string& word) {
    Node* cur = root;
    for(int i = 0; i < word.size(); i++) {
        char ch = word.at(i);
        /// 如果不存在 ch 就添加一个
        if (cur->next.find(ch) == cur->next.end()) {
            cur->next.insert(std::make_pair(ch, new Trie::Node()));
        }
        cur = cur->next.at(ch);
    }
    
    if (!cur->isWord) {
        size++;
        cur->isWord = true;
    }
    
}

bool Trie::contains(const std::string& word) {
    Node* cur = root;
    for (int i = 0; i < word.size(); i++) {
        char ch = word.at(i);
        if (cur->next.find(ch) == cur->next.end()) {
            return false;
        }
        cur = cur->next.at(ch);
    }
    
    return cur->isWord;
}
