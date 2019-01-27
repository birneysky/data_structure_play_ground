//
//  TreeSet.hpp
//  PlayGround
//
//  Created by birneysky on 2019/1/27.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef TreeSet_hpp
#define TreeSet_hpp

#include "Set.hpp"
#include "BST.hpp"

template<typename E>
class TreeSet : public Set<E> {
private:
    BST<E> bst;
public:
    void add(E e) {
        bst.add(e);
    }
    
    bool contains(E e){
        return bst.containts(e);
    }
    
    void remove(E e) {
        return bst.remove(e);
    }
    
    int getSize() {
        return bst.getSize();
    }
    
    bool isEmpty() {
        return bst.isEmpty();
    }
};
#endif /* TreeSet_hpp */
