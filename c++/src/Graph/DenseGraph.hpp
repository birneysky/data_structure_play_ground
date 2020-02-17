//
//  DenseGraph.hpp
//  PlayGround
//
//  Created by birney on 2019/3/9.
//  Copyright © 2019年 Grocery. All rights reserved.
//

#ifndef DenseGraph_hpp
#define DenseGraph_hpp

#include <iostream>
#include <vector>
#include <cassert>

namespace Playground {
/*
 * 使用邻接矩阵实现稠密图    dense [dɛns] 
 */
class DenseGraph {
private:
    int n; /// 顶点个数
    int m; /// 边个数
    bool directed; /// 标示是有向图还是无向图，true 标示有向。
    std::vector<std::vector<bool>> g; ///  邻接矩阵
public:
    DenseGraph(int n, bool directed) {
        this->n = n;
        this->m = 0;
        this->directed = directed;
        for(int i = 0; i < n; i++)  {
            g.push_back(std::vector<bool>(n, false));
        }
    }
    
    ~DenseGraph() {
        
    }
    
    /**
     获取图的顶点个数

     @return 返回顶点个数
     */
    int V() {
        return n;
    }
    
    
    /**
     获取图中边的个数

     @return 返回边的个数
     */
    int E() {
        return m;
    }
    
    
    /**
     在顶点v和w之间添加一条边

     @param v 顶点v
     @param w 顶点w
     */
    void addEdge(int v, int w) {
        assert(v>=0 && v < n);
        assert(w>=0 && w < n);
        
        if (hasEdge(v, w)) {
            return;
        }
        
        g[v][w] = true;
        if (!directed) {
            g[w][v] = true;
        }
        m++;
    }
    
    
    /**
     判断顶点v和顶点w之间是否有一条边

     @param v 顶点v
     @param w 顶点w
     @return 右边返回ture，否则返回false
     */
    bool hasEdge(int v, int w) {
        assert(v>=0 && v < n);
        assert(w>=0 && w < n);
        
        return g[v][w];
    }
    
    friend std::ostream& operator<<(std::ostream& os,DenseGraph& grah) {
        for(int i = 0; i < grah.V(); i++) {
            for (int j = 0; j < grah.V(); j++) {
                os << grah.g[i][j] << "\t";
            }
            os << std::endl;
        }
        return os;
    }
    
    class adjIterator {
    private:
        DenseGraph& G;
        int v;
        int index; /// 表示当前迭代到哪里了
    public:
        /**
         迭代器构造函数
         
         
         @param graph 图的引用
         @param v  表示图中顶点v相邻的边
         */
        adjIterator(DenseGraph& graph, int v):G(graph) {
            this->v = v;
            this->index = -1;
        }
        
        int begin() {
            index = -1;
            return next();
        }
        
        int next() {
            index ++;
            while (index < G.V()) {
                if (G.g[v][index]) {
                    return index;
                }
                index ++;
            }
            return -1;
        }
        
        bool end() {
            return index >= G.V();
        }
    };
};

}

#endif /* DenseGraph_hpp */
