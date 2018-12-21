//
//  FingerSolution.cpp
//  solutions
//
//  Created by birneysky on 2018/12/15.
//  Copyright © 2018 Grocery. All rights reserved.
//

#include "FingerSolution.hpp"


int FingerSolution::duplicate(int numbers[], int length) {
    if (!numbers || length <= 0) {
        return -1;
    }
    
    for (int i = 0; i < length; i++) {
        if (numbers[i] < 0 || numbers[i] > length -1) {
            return -1;
        }
    }
    
	for ( int i = 0; i < length;i++) {
        while (numbers[i] != i) {
            int v = numbers[i];
            if (v == numbers[v]) {
                return v;
            }
            std::swap(numbers[i], numbers[v]);
        }
	}
    return -1;
}

bool FingerSolution::find(int* matrix,int rows, int columns, int number) {
    if (!matrix && rows > 0 && columns > 0) {
        int row = 0;
        int column = columns -1;
        while (row < rows && column > 0) {
            int v = matrix[row*column+column];
            if (number > v) {
                row ++;
            } if (number < v) {
                column --;
            } else {
                return true;
            }
        }
    }
    return false;
}
