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
namespace Playground {
    
template <typename Graph>
class Component {
private:
    Graph& g;
    bool* visited;///记录顶点是否被访问过
    int ccount; /// 记录连通分量的数量
    int* connected;
private:
    void dfs(int v){
        
        this->visited[v] = true;
        typename Graph::adjIterator it(g, v);
        for ( int vertex = it.begin(); !it.end(); vertex = it.next()) {
            if (!this->visited[vertex]) {
                dfs(vertex);
            }
        }
    }
public:
    Component(Graph& graph): g(graph) {
        this->visited = new bool[g.V()];
        this->connected = new int[g.V()];
        this->ccount = 0;
        for (int i = 0; i < g.V(); i++) {
            this->visited[i] = false;
        }
        
        for (int i = 0; i < g.V(); i++) {
            this->connected[i] = -1;
        }
        
        for (int i = 0; i < g.V(); i++) {
            if (!visited[i]) {
                dfs(i);
                this->ccount++;
            }
            this->connected[i] = this->ccount;
        }
    }
    
    ~Component() {
        delete[] visited;
        delete[] connected;
    }
    
    int count() {
        return this->ccount;
    }
    
    bool isConnected(int v, int w) {
        assert(v >= 0 && v < g.V());
        assert(w >= 0 && w < g.V());
        return this->connected[v] == this->connected[w];
    }
    
    friend std::ostream& operator<<(std::ostream& os,Component<Graph>& component) {
        std::cout << "count:" <<  component.ccount << std::endl;
        std::cout << "connected: ";
        for (int i = 0; i < component.g.V(); i++) {
            std::cout << i << ":" << component.connected[i] << '\t';
        }
        std::cout << std::endl;
        return os;
    }
};
    
}
#endif /* Component_hpp */
