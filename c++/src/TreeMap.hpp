//
//  TreeMap.hpp
//  PlayGround
//
//  Created by birneysky on 2019/1/27.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef TreeMap_hpp
#define TreeMap_hpp
#include "Map.hpp"

template<typename K, typename V>
class TreeMap: public Map<K,V> {
private:
    BSTMap<K,V> m_bstMap;
public:
    virtual void add(K key, V value) {
        m_bstMap.add(key, value);
    }
    
    virtual bool contains(K key) {
        return m_bstMap.containts(key);
    }
    
    virtual  V get(K key) {
        return m_bstMap.find(key);
    }
    
    virtual void set(K key, V value) {
        m_bstMap.add(key, value);
    }
    
    virtual V remove(K key) {
        return m_bstMap.removeMax();
    }
    
    virtual int getSize() {
        return m_bstMap.getSize();
    }
    
    virtual bool isEmpty() {
        return m_bstMap.isEmpty();
    }
};

#endif /* TreeMap_hpp */
