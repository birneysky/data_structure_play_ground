#include "SolutionTest.hpp"
#include <iostream>
#include <ostream>
#include <sstream>






int main (int argc, char* argv[]) {
    SolutionTest tester;
    tester.test_twoSum();
    tester.test_addTwoNumbers();
    tester.test_addTwoNumbers2();
    tester.test_duplicate();
    tester.test_replaceBlank();
    tester.test_printListReversingly_Recursively();
    tester.test_printListReversingly_Iteratively();
    tester.test_constructBinaryTree();
    tester.test_printPermutations();
	return EXIT_SUCCESS;
}
