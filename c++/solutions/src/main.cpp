#include "solution.hpp"
#include <iostream>
#include <ostream>
#include <sstream>

template<typename T>
std::ostream& operator<<(std::ostream& out,std::vector<T> vec) {
	std::stringstream stream;
    typename std::vector<T>::iterator begin = vec.begin();
    typename std::vector<T>::iterator end = vec.end();
    if (begin != end) {
        stream << "[" << *begin;
        begin ++;
    } else {
        stream << "[";
    }
    
    std::for_each(begin, end, [&stream](T& value) {
        stream << "," << value;
    });
    stream << "]";
    out << stream.str();
    return out;
}

int main (int argc, char* argv[]) {
	int a[] = {2,7,11,15};
	int target = 9;
	std::vector<int> nums(a,a+sizeof(a)/sizeof(int));
	solution s;
	std::vector<int> resut =  s.twoSum(nums,target);
	std::cout << resut << std::endl;
	return EXIT_SUCCESS;
}
