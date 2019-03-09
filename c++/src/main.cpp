//
//  main.cpp
//  PlayGround
//
//  Created by birneysky on 2018/11/19.
//  Copyright © 2018 Grocery. All rights reserved.
//

#include <iostream>
#include <vector>
#include <sstream>
#include "BST.hpp"
#include "Trie.hpp"
#include "BSTMap.hpp"
#include "FileReader.hpp"
#include "TreeSet.hpp"
#include "TreeMap.hpp"
#include "AVLTree.hpp"

struct student {
    std::string name = "liuhua";
    int age = 0;
    float scores = 3;
    friend std::ostream& operator <<(std::ostream& os, const student& student){
        std::stringstream stream;
        stream << "{ name:" << student.name << ",age:" << student.age << ",socre:" << student.scores << " }";
        os << stream.str();
        return os;
    }
};

void testTrie(std::vector<std::string>& words) {
    Trie trie;
    trie.add("cat");
    trie.add("pig");
    trie.add("apple");
    trie.add("phone");
    trie.add("cat");
    std::cout << trie.getSize() << std::endl;
    std::cout << trie.contains("cat") << std::endl;
    std::cout << trie.contains("hah") << std::endl;
    std::cout << trie.contains("phone") <<  std::endl;
    
    std::for_each(words.begin(), words.end(), [&trie](const std::string& str){
        trie.add(str);
    });
}

void testTreeMap(std::vector<std::string>& words) {
    TreeMap<std::string,int> treeMap;
    std::for_each(words.begin(), words.end(), [&treeMap](const std::string& word){
        if (treeMap.contains(word)) {
            treeMap.set(word, treeMap.get(word)+1);
        } else {
            treeMap.add(word,1);
        }
    });
    std::cout << "Total difference words: " << treeMap.getSize() << std::endl;
    std::cout << "Frequency of PRIDE: " << treeMap.get("pride") << std::endl;
    std::cout << "Frenquency of PREJUDICE: " << treeMap.get("prejudice") << std::endl;
}

void testTreeSet(std::vector<std::string>& words) {
    TreeSet<std::string> treeSet;
}

void testAVL(std::vector<std::string>& words) {
    AVLTree<int, int> avlTree;
}

int main(int argc, const char * argv[]) {
    student stu;
    stu.age = 30;
    stu.name = "hanmeimei";
    stu.scores = 500;
    std::cout << stu << std::endl;
    
    student ttt;
    std::cout << ttt << std::endl;
    

    
    FileReader fileReader("pride-and-prejudice.txt");
    std::vector<std::string> words;
    fileReader.readAllWords(words);
    //testTrie(words);
    //testTreeMap(words);
    
    
    
    return EXIT_SUCCESS;
}
