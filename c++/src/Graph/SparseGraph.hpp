//
//  SparseGraph.hpp
//  PlayGround
//
//  Created by birneysky on 2019/3/10.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef SparseGraph_hpp
#define SparseGraph_hpp

#include <iostream>
#include <vector>
#include <cassert>

namespace Playground {
/*
 * 邻接表实现稀疏图 sparse [spɑ:rs]
 */
class SparseGraph {
private:
    int n; /// 顶点个数
    int m; /// 边个数
    bool directed; /// 标示是有向图还是无向图，true 标示有向。
    std::vector<std::vector<int>> g;
public:
    SparseGraph(int n, bool directed) {
        this->n = n;
        this->m = 0;
        this->directed = directed;
        for (int i = 0; i < n; i ++) {
            g.push_back(std::vector<int>());
        }
    }
    
    ~SparseGraph() {
        
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
        
        g[v].push_back(w);
        if (v!=w && !directed) {
            g[w].push_back(v);
        }
        
        m++;
    }
    
    /**
     判断顶点v和顶点w之间是否有一条边
     
     0(n)
     
     @param v 顶点v
     @param w 顶点w
     @return 右边返回ture，否则返回false
     */
    bool hasEdge(int v, int w) {
        assert(v>=0 && v < n);
        assert(w>=0 && w < n);
        
        for (int i = 0; i < g[v].size(); i ++) {
            if (g[v][i] == w) {
                return true;
            }
        }
        
        return false;
    }
    
    friend std::ostream& operator<<(std::ostream& os,SparseGraph& grah) {
        for(int i = 0; i < grah.V(); i++) {
            os << "vertex " << i << ":\t";
            for (int j = 0; j < grah.g[i].size(); j++) {
                os << grah.g[i][j] << "\t";
            }
            os << std::endl;
        }
        return os;
    }
    
    class adjIterator {
    private:
        SparseGraph& G;
        int v;
        int index; /// 表示当前迭代到哪里了
    public:
        /**
         迭代器构造函数
         
         遍历与顶点v 相邻的顶点
         
         @param graph 图的引用
         @param v  表示图中顶点v
         */
        adjIterator(SparseGraph& graph, int v):G(graph) {
            this->v = v;
            this->index = 0;
        }
        
        int begin() {
            index = 0;
            if (G.g[v].size() > 0) {
                return G.g[v][index];
            }
            return -1;
        }
        
        int next() {
            index ++;
            if (index < G.g[v].size()) {
                return G.g[v][index];
            }
            return -1;
        }
        
        bool end() {
            return index >= G.g[v].size();
        }
    };
};

}
#endif /* SparseGraph_hpp */
