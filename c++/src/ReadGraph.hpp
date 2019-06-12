//
//  ReadGraph.hpp
//  PlayGround
//
//  Created by birneysky on 2019/3/10.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef ReadGraph_hpp
#define ReadGraph_hpp

#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <cassert>

namespace Playground {

template <typename Graph>
class ReadGraph {
public:
    ReadGraph(Graph& graph, const std::string& fileName) {
        std::ifstream file(fileName);
        std::string line;
        int v, e;
        assert(file.is_open());
        
        assert(std::getline(file, line));
        std::stringstream ss(line);
        ss >> v >> e;
        
        assert(v == graph.V());
        
        for (int i = 0; i < e; i++) {
            
            assert(std::getline(file, line));
            std::stringstream ss(line);
            int a,b;
            ss >> a >> b;
            assert(a >= 0 && a < v);
            assert(b >= 0 && b < v);
            graph.addEdge(a,b);
        }
        
    }
};

}

#endif /* ReadGraph_hpp */
