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
#include <stack>
#include <queue>

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
            order[i] = -1;
        }
        
        source = s;
        
        /// 广度优先遍历
        std::queue<int> q;
        q.push(s);
        visited[s] = true;
        order[s] = 0;
        while(!q.empty()) {
            int v = q.front();
            q.pop();
            typename Graph::adjIterator it(g,v);
            for (int i = it.begin(); !it.end(); i = it.next()) {
                if (!visited[i]) {
                    q.push(i);
                    visited[i] = true;
                    from[i] = v;
                    order[i] = order[v] + 1;
                }
            }
        }
    }
    
    ~ShortestPath() {
        delete[] visited;
        delete[] from;
        delete[] order;
    }
    
    bool hasPath(int w) {
        assert( w >= 0 && w < g.V());
        return this->visited[w];
    }
    
    void path(int w, std::vector<int>& vec) {
        std::stack<int> s;
        
        int p = w;
        while (p!= -1) {
            s.push(p);
            p = this->from[p];
        }
        
        vec.clear();
        while(!s.empty()) {
            vec.push_back(s.top());
            s.pop();
        }
    }
    
    void showPath(int w) {
        std::vector<int> vec;
        path(w, vec);
        
        for(int i = 0; i < vec.size(); i++) {
            std::cout << vec[i];
            if (i == vec.size() - 1) {
                std::cout << std::endl;
            } else {
                std::cout  << " --> ";
            }
        }
    }
    
    int length( int w) {
        assert( w >= 0 && w < g.V());
        return 0;
    }
};

}

#endif /* ShortestPath_hpp */
