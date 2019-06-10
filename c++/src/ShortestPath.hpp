//
//  ShortestPath.hpp
//  PlayGround
//
//  Created by birneysky on 2019/6/10.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef ShortestPath_hpp
#define ShortestPath_hpp
#include <cassert>

namespace Playground {

//// 求无权图的最短路径
    
template <typename Graph>
class ShortestPath {
private:
    Graph& g;
    int source; /// 路径起始节点的值
    bool* visited;  /// 记录节点是否访问过
    int* from;/// 存储每个节点是从哪个节点遍历来的
    int* order; /// 记录从原点 source 到每一个节点的最短距离是多少
public:
    ShortestPath(Graph& graph, int s) : g(graph) {
        assert(s >= 0 && s < graph.V());
        visited = new bool[graph.V()];
        from = new int[graph.V()];
        order = new int [graph.V()];
        
        for (int i = 0; i < graph.V(); i++) {
            visited[i] = false;
            from[i] = -1;
            order = -1;
        }
        
        this->source = s;
        
        /// 广度优先遍历
    }
    
    ~ShortestPath() {
        delete[] visited;
        delete[] from;
        delete[] order;
    }
    
    bool hasPath(int w) {
        return false;
    }
    
    void path(int w, std::vector<int>& vec) {
        
    }
    
    void showPath(int w) {
        
    }
    
    int length() {
        return 0;
    }
};

}

#endif /* ShortestPath_hpp */
