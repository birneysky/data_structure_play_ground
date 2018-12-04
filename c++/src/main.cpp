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
    
    return EXIT_SUCCESS;
}
