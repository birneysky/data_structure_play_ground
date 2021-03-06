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
    tester.test_absoluteValuationMethod();
    tester.test_moveZeroes();
    tester.test_removeDuplicates();
    tester.test_removeDuplicates_2();
    tester.test_removeElement();
    tester.test_merge();
    tester.test_findKthLargest();
    tester.test_sortColors();
    tester.test_twoSum_167();
    tester.test_isPalindrome();
    tester.test_lengthOfLongestSubstring1();
    tester.test_rotate();
	return EXIT_SUCCESS;
}
