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
#include "DenseGraph.hpp"
#include "SparseGraph.hpp"
#include "ReadGraph.hpp"

using namespace Playground;

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

void testGraph() {
    //DenseGraph d(3, false);
    
    int n = 20; /// 20个节点
    int m = 100; /// 100 条边
    
    srand((unsigned int)time(nullptr));
    
    SparseGraph g1(n, false);
    for (int i = 0; i < m; i++) {
        int a = rand() % n;
        int b = rand() % n;
        g1.addEdge(a,b);
    }
    
    for (int v = 0; v < n; v++) {
        std::cout << v << " : ";
        SparseGraph::adjIterator adj(g1, v);
        for (int w = adj.begin(); !adj.end(); w = adj.next()) {
            std::cout << w << " ";
        }
        std::cout << std::endl;
    }
    
    std::cout << std::endl;
    
    DenseGraph g2(n, false);
    for (int i = 0; i < m; i++) {
        int a = rand() % n;
        int b = rand() % n;
        g2.addEdge(a,b);
    }
    
    for (int v = 0; v < n; v++) {
        std::cout << v << " : ";
        DenseGraph::adjIterator adj(g2, v);
        for (int w = adj.begin(); !adj.end(); w = adj.next()) {
            std::cout << w << " ";
        }
        std::cout << std::endl;
    }
    

    std::cout << std::endl;
}

void testReadGraph () {
    SparseGraph g1(13, false);
    ReadGraph<SparseGraph> readGraph1(g1,"testG1.txt");
    std::cout << g1 << std::endl;

    DenseGraph g2(6, false);
    ReadGraph<DenseGraph> readGraph2(g2,"testG2.txt");
    std::cout << g2 << std::endl;
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
    
    //testGraph();
    testReadGraph();
    
    return EXIT_SUCCESS;
}
