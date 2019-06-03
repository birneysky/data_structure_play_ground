//
//  Component.hpp
//  PlayGround
//
//  Created by birneysky on 2019/6/3.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef Component_hpp
#define Component_hpp

#include <iostream>
#include <cassert>

/**
 * 求图的连通分量
 */
template <typename Graph>
class Component {
private:
    Graph& g;
    bool* visited;///记录顶点是否被访问过
    int ccount; /// 记录连通分量的数量
public:
    Component(Graph& graph): g(graph) {
        this->visited = new bool[g.V()];
        this->ccount = 0;
        for (int i = 0; i < g.V(); i++) {
            this->visited[i] = false;
        }
        
        for (int i = 0; i < g.V(); i++) {
            if (!visited[i]) {
                dfs(i)
                this->ccount++;
            }
        }
    }
    
    ~Component() {
        delete[] visited;
    }
    
    int count() {
        return this->ccount;
    }
};

#endif /* Component_hpp */
