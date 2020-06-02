//
//  Path.hpp
//  PlayGround
//
//  Created by birneysky on 2019/6/5.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef Path_hpp
#define Path_hpp
#include <cassert>
#include <vector>
#include <stack>

namespace Playground {
/// 求图中任意两个节点的路径
template <typename Graph>
class Path {
private:
    Graph& g;
    int source; /// 路径起始节点的值
    bool* visited; /// 记录节点是否访问过
    int* from;/// 存储每个节点是从哪个节点遍历来的
private:
    
    /**
     从节点s 进行深度优先遍历

     @param s 顶点s
     */
    void dfs(int s) {
        this->visited[s] = true;
        typename Graph::adjIterator it(g,s);
        for( int i = it.begin(); !it.end(); i = it.next() ) {
            if (!visited[i]) {
                this->from[i] = s;
                dfs(i);
            }
        }
    }
public:
    
    /// 从某一个点 s 到任意其他店的路径
    /// @param graph 图对象
    /// @param s 源点
    Path(Graph& graph, int s): g(graph) {
        assert(s >= 0 && s < graph.V());
        visited = new bool[graph.V()];
        from = new int[graph.V()];
        for( int i = 0; i < graph.V(); i++ ) {
            visited[i] = false;
            from[i] = -1;
        }
        source = s;
        /// 寻路算法
        dfs(source);
    }
    
    ~Path() {
        delete[] visited;
        delete[] from;
    }
    
    
    /**
     从原点 source 到 w 是否有路径

     @param w 顶点值
     @return 存在返回 true，否则返回 false
     */
    bool hasPath(int w) {
        assert(w >= 0 && w < g.V());
        return this->visited[w];
    }
    
    
    /**
     原点到 w 的路径

     @param w 顶点 w
     @param vec 路径存储容器
     */
    void path(int w, std::vector<int>& vec) {
        std::stack<int> s;
        
        int p = w;
        while (p != -1) {
            s.push(p);
            p = this->from[p];
        }
        
        vec.clear();
        while ( !s.empty() ) {
            vec.push_back(s.top());
            s.pop();
        }
    }
    
    
    /**
     打印原点到w的路径

     @param w 顶点w
     */
    void showPath( int w) {
        std::vector<int> vec;
        path(w,vec);
        
        for( int i = 0; i < vec.size(); i++) {
            std::cout << vec[i];
            if (i == vec.size() -1) {
                std::cout << std::endl;
            } else {
                std::cout << " -> ";
            }
        }
    }
};

}
#endif /* Path_hpp */
