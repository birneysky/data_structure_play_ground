//
//  FingerSolution.cpp
//  solutions
//
//  Created by birneysky on 2018/12/15.
//  Copyright © 2018 Grocery. All rights reserved.
//

#include "FingerSolution.hpp"


int FingerSolution::duplicate(int numbers[], int length) {
	for ( int i = 0; i < length;) {
		if (numbers[i] == i) {
            i++;
		} else if(numbers[i] != numbers[numbers[i]]){
            std::swap(numbers[i], numbers[numbers[i]]);
		} else {
			return numbers[i];
		}
	}
    return -1;
}
