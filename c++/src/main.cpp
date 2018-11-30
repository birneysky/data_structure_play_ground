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

struct student {
    std::string name;
    int age;
    float scores;
    friend std::ostream& operator <<(std::ostream& os, const student& student){
        std::stringstream stream;
        stream << "{ name:" << student.name << ",age:" << student.age << ",socre:" << student.scores << " }";
        os << stream.str();
        return os;
    }
};


int main(int argc, const char * argv[]) {

//    int a[] = {50,30,70,60,20,35,75,18,55,25,68,63,100};
//    std::vector<int> va(a,a+sizeof(a)/sizeof(int));
    std::vector<int> va{50,30,70,60,20,35,75,18,55,25,68,63,100};
    BST<int> bst = BST<int>();
    for (std::vector<int>::const_iterator it = va.begin(); it != va.end(); it++) {
        bst.add_0(*it);
    }
    BST<int> bst1 = BST<int>();
    std::for_each(va.begin(), va.end(), [&bst1](const int& value) {
        bst1.add(value);
    });
    
    std::cout << "Hello, BST!\n";
    std::cout << bst.getSize() << bst.isEmpty() << std::endl;
    
    student stu;
    stu.age = 30;
    stu.name = "hanmeimei";
    stu.scores = 500;
    std::cout << stu << std::endl;
    
    return EXIT_SUCCESS;
}
