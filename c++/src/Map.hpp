//
//  Map.hpp
//  PlayGround
//
//  Created by birneysky on 2019/1/27.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef Map_hpp
#define Map_hpp

template<typename K,typename V>
class Map {
    virtual void add(K key, V value) = 0;
    virtual bool contains(K key) = 0;
    virtual  V get(K key) = 0;
    virtual void set(K key, V value) = 0;
    virtual V remove(K key) = 0;
    virtual int getSize() = 0;
    virtual bool isEmpty() = 0;
};

#endif /* Map_hpp */
