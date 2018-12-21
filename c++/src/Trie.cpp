//
//  Trie.cpp
//  PlayGround
//
//  Created by birney on 2018/12/21.
//  Copyright © 2018年 Grocery. All rights reserved.
//

#include "Trie.hpp"


Trie::Trie() {
    root = new Node();
    size = 0;
}

Trie::~Trie() {
    delete root;
    root = nullptr;
}


int Trie::getSize() {
    return size;
}

void Trie::add(std::string word) {
    Node* cur = root;
    for(int i = 0; i < word.size(); i++) {
        char ch = word.at(i);
        if (cur->next.at(ch) == null) {
            cur->next.insert(ch,new Node())
        } else {
            cur = cur->next.at(ch);
        }
    }
}
