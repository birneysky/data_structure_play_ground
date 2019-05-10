import XCTest
import Solution

final class SolutionTests: XCTestCase {
    
    func testSolution_removeDuplicates() {
        var nums1 = [1,1,2]
        let solution = Solution()
        print("\t input->nums1:\(nums1)")
        let lenght1 = solution.removeDuplicates(&nums1)
        print("\t output->nums1:\(nums1),length:\(lenght1)")
        XCTAssertEqual(lenght1, 2)
        
        var nums2 = [0,0,1,1,1,2,2,3,3,4]
        print("\t input->nums2:\(nums2)")
        let length2 = solution.removeDuplicates(&nums2)
        print("\t output->nums2:\(nums2),length:\(length2)")
        XCTAssertEqual(length2, 5)
    }
}
