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
    
    func testSolution_maxProfit() {
        let s = Solution()
        let prices1 = [7,1,5,3,6,4]
        print("\t input->prices1:\(prices1)")
        let maxProfit1 =  s.maxProfit(prices1)
        print("\t output->maxProfix1: \(maxProfit1)")
        XCTAssertEqual(maxProfit1, 7)
        
        let prices2 = [1,2,3,4,5]
        print("\t input->prices2:\(prices2)")
        let maxProfit2 = s.maxProfit(prices2)
        print("\t output->maxProfit2: \(maxProfit2)")
        XCTAssertEqual(maxProfit2, 4)
        
        let prices3 = [7,6,4,3,1]
        print("\t input->prices3:\(prices3)")
        let maxProfit3 = s.maxProfit(prices3)
        print("\t output->maxProfit3: \(maxProfit3)")
        XCTAssertEqual(maxProfit3, 0)
    }
}
