//
//  PlayGroundTests.m
//  PlayGroundTests
//
//  Created by birneysky on 2019/6/3.
//  Copyright © 2019 Grocery. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "SparseGraph.hpp"
#include "DenseGraph.hpp"
#include "ReadGraph.hpp"
#include "Component.hpp"
#include "Path.hpp"
#include "ShortestPath.hpp"

@interface PlayGroundTests : XCTestCase

@end

@implementation PlayGroundTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testSparseGraphAdjIterator {
    /// 测试稀疏图迭代器
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
}

- (void)testDenseGraphAdjIterator {
    /// 测试稠密图迭代器
    int n = 20; /// 20个节点
    int m = 100; /// 100 条边
    
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

- (void)testReadGraph {
    SparseGraph g1(13, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG1Path = [currentBuldle pathForResource:@"testG1" ofType:@"txt"];
    ReadGraph<SparseGraph> readGraph1(g1,testG1Path.UTF8String);
    std::cout << g1 << std::endl;
    
    DenseGraph g2(6, false);
    NSString* testG2Path = [currentBuldle pathForResource:@"testG2" ofType:@"txt"];
    ReadGraph<DenseGraph> readGraph2(g2,testG2Path.UTF8String);
    std::cout << g2 << std::endl;
}

- (void)testComponentSparseGraph_count {
    SparseGraph g1(13, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG1Path = [currentBuldle pathForResource:@"testG1" ofType:@"txt"];
    ReadGraph<SparseGraph> readGraph1(g1,testG1Path.UTF8String);
    std::cout << g1 << std::endl;
    
    Playground::Component<SparseGraph> c1(g1);
    XCTAssertEqual(c1.count(), 3);
}

- (void)testComponentDenseGraph_count {
    DenseGraph g2(6, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG2Path = [currentBuldle pathForResource:@"testG2" ofType:@"txt"];
    ReadGraph<DenseGraph> readGraph2(g2,testG2Path.UTF8String);
    std::cout << g2 << std::endl;

    Playground::Component<DenseGraph> c2(g2);
    XCTAssertEqual(c2.count(), 1);
}

- (void)testComponent_isConnected {
    SparseGraph g1(13, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG1Path = [currentBuldle pathForResource:@"testG1" ofType:@"txt"];
    ReadGraph<SparseGraph> readGraph1(g1,testG1Path.UTF8String);
    std::cout << g1 << std::endl;
    
    Playground::Component<SparseGraph> c1(g1);
    std::cout << c1 << std::endl;
    XCTAssertEqual(c1.isConnected(7, 8), true);
    XCTAssertEqual(c1.isConnected(2, 7), false);
    XCTAssertEqual(c1.isConnected(6, 9), false);
    XCTAssertEqual(c1.isConnected(9, 11), true);
}

- (void)testPath_hasPath {
    SparseGraph g1(13, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG1Path = [currentBuldle pathForResource:@"testG1" ofType:@"txt"];
    ReadGraph<SparseGraph> readGraph1(g1,testG1Path.UTF8String);
    std::cout << g1 << std::endl;
    
    Playground::Path<SparseGraph> path(g1,0);
    XCTAssertEqual(path.hasPath(2), true);
    XCTAssertEqual(path.hasPath(7), false);
    XCTAssertEqual(path.hasPath(4), true);
    XCTAssertEqual(path.hasPath(3), true);
    XCTAssertEqual(path.hasPath(5), true);
    XCTAssertEqual(path.hasPath(1), true);
    
    
}

- (void)testPath_showPath {
    SparseGraph g2(6, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG1Path = [currentBuldle pathForResource:@"testG2" ofType:@"txt"];
    ReadGraph<SparseGraph> readGraph1(g2,testG1Path.UTF8String);
    std::cout << g2 << std::endl;
    
    Playground::Path<SparseGraph> p(g2,0);
    std::cout << "path 0---1 : " << std::endl;
    p.showPath(1);
    
    std::cout << "path 0---2 : " << std::endl;
    p.showPath(2);
    
    std::cout << "path 0---3 : " << std::endl;
    p.showPath(3);
    
    std::cout << "path 0---4 : " << std::endl;
    p.showPath(4);
    
    std::cout << "path 0---5 : " << std::endl;
    p.showPath(5);
}

- (void)testShortestPath {
    SparseGraph g1(13, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG1Path = [currentBuldle pathForResource:@"testG3" ofType:@"txt"];
    ReadGraph<SparseGraph> readGraph1(g1,testG1Path.UTF8String);

    Playground::ShortestPath<SparseGraph> sp1(g1,0);
    std::cout << "path 0---12 : ";
    sp1.showPath(12);
    std::cout << std::endl;
    
    Playground::ShortestPath<SparseGraph> sp2(g1,5);
    std::cout << "path 5---12 : ";
    sp2.showPath(12);
    std::cout << std::endl;
}

- (void)testShortestPath_length {
    SparseGraph g1(13, false);
    NSBundle* currentBuldle = [NSBundle bundleForClass:PlayGroundTests.class];
    NSString* testG1Path = [currentBuldle pathForResource:@"testG3" ofType:@"txt"];
    ReadGraph<SparseGraph> readGraph1(g1,testG1Path.UTF8String);
    
    Playground::ShortestPath<SparseGraph> sp1(g1,0);
    XCTAssertEqual(sp1.length(11), 1);
    XCTAssertEqual(sp1.length(12), 2);
    XCTAssertEqual(sp1.length(9), 2);
//    std::cout << "path 0---12 : ";
//    sp1.showPath(12);
//    std::cout << std::endl;
    
    Playground::ShortestPath<SparseGraph> sp2(g1,5);
//    std::cout << "path 5---12 : ";
//    sp2.showPath(12);
//    std::cout << std::endl;


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
