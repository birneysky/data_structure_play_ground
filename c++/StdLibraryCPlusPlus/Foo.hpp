//
//  Foo.hpp
//  StdLibraryCPlusPlus
//
//  Created by birneysky on 2019/8/9.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef Foo_hpp
#define Foo_hpp

#include <iostream>
#include <sstream>

class Foo {
private:
    int val_;
public:
    Foo(int x) {
        val_ = x;
    }

    friend std::ostream& operator<<(std::ostream& os, const Foo& foo) {
        std::stringstream sstream;
        sstream << "<foo>{ value:" << foo.val_ << "}";
        os << sstream.str();
        return os;
    }
    
};


class ExplicitFoo {
private:
    int val_;
public:
    explicit ExplicitFoo(int x) {
        val_ = x;
    }
    
    friend std::ostream& operator<<(std::ostream& os, const ExplicitFoo& foo) {
        std::stringstream sstream;
        sstream << "<ExplicitFoo>{ value:" << foo.val_ << "}";
        os << sstream.str();
        return os;
    }
    
};

void doSomething(const Foo& foo) {
    std::cout << "doSomething print foo:" << foo << std::endl;
}

void doSomething1(const ExplicitFoo& foo) {
    std::cout << "doSomething print foo:" << foo << std::endl;
}

#endif /* Foo_hpp */
