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
	return EXIT_SUCCESS;
}
