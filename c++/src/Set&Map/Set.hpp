//
//  Set.hpp
//  PlayGround
//
//  Created by birneysky on 2019/1/27.
//  Copyright © 2019 Grocery. All rights reserved.
//

#ifndef Set_hpp
#define Set_hpp

template<typename E>
class Set {
   virtual void add(E e) =0;
   virtual bool contains(E e) = 0;
   virtual void remove(E e) = 0;
   virtual int getSize() = 0;
   virtual bool isEmpty() = 0;
};

#endif /* Set_hpp */
