//
//  StdLibraryCPlusPlus.m
//  StdLibraryCPlusPlus
//
//  Created by birneysky on 2019/8/8.
//  Copyright © 2019 Grocery. All rights reserved.
//

#import <XCTest/XCTest.h>
#include <memory>
#include <iostream>
#include "Foo.hpp"

@interface StdLibraryCPlusPlus : XCTestCase

@end

@implementation StdLibraryCPlusPlus

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)test_explicit_constructor {
    /// c++  构造函数默认会进行隐式类型转化，比如下面这个调用，将整数10 转化为了Foo 对象
    doSomething(10);
    
    /// explicit 之后 类型不在隐式转化
    doSomething1(ExplicitFoo(20));
    
    // doSomething1(100) error
}

- (void)test_unique_prt_simple {
    std::unique_ptr<int> foo = std::unique_ptr<int>(new int(10));
    std::unique_ptr<int> bar;
    /// bar = foo  error
    std::cout << "1 foo: " <<  foo << "foo value:" << *foo << std::endl;
    std::cout << "1 bar: " <<  bar  << std::endl;
    std::cout << "1 *foo crahed" << std::endl;
    bar = std::move(foo);
    std::cout << "============= std::move(foo)=============" << std::endl;
    std::cout << "2 foo:" << foo << std::endl;
    std::cout << "2 bar:" << bar << "bar value:" << *bar << std::endl;
    /// unique_prt 对象拥护所持有指针的唯一所有权，转移指针所有权，需要是使用move
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
