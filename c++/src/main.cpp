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


int main(int argc, const char * argv[]) {
    student stu;
    stu.age = 30;
    stu.name = "hanmeimei";
    stu.scores = 500;
    std::cout << stu << std::endl;
    
    student ttt;
    std::cout << ttt << std::endl;
    
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
    
    FileReader fileReader("pride-and-prejudice.txt");
    std::vector<std::string> words;
    fileReader.readAllWords(words);
    std::for_each(words.begin(), words.end(), [&trie](const std::string& str){
        trie.add(str);
    });
    return EXIT_SUCCESS;
}
