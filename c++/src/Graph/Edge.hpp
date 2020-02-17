//
//  Edge.hpp
//  PlayGround
//
//  Created by birneysky on 2019/6/12.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef Edge_hpp
#define Edge_hpp

#include <cassert>

template <typename Weight>
class Edge {
private:
    /*
     * a 和 b 表示边的两个顶点, 这两顶点表示的边同时表示有向边，和无向边，对于有向边来说，方向是由a 指向 b 的
     */
    int a;
    int b;
    Weight weight; /// 边的权值
    
public:
    Edge(int a, int b, Weight weight) {
        this->a = a;
        this->b = b;
        this->weight = weight;
    }
    
    Edge() {}
    ~Edge() {}
    
    
    /**
     返回顶点a

     @return a
     */
    int v() {
        return a;
    }
    
    
    /**
     获取顶点b

     @return b
     */
    int w() {
        return b;
    }
    
    
    /**
     获取权值

     @return 返回权值
     */
    Weight wt() {
        return weight;
    }
    
    
    /**
     求一个边的另外一个顶点

     @param x 顶点
     @return 返回另一个顶点
     */
    int other(int x) {
        assert(x == a || x == b);
        return x == a ? b : a;
    }
    
    friend std::ostream& operator<<(std::ostream& os, Edge& edge) {
        os << edge.a << "-" << edge.b << ": " << edge.weight;
        return os;
    }
};

#endif /* Edge_hpp */
