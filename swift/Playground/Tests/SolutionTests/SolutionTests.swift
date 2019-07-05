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
    
    func testSolution_containsDuplicate() {
        /// eg1:
        ///     输入: [1,2,3,1]
        ///     输出: true
        /// eg2:
        ///     输入: [1,2,3,4]
        ///     输出: false
        /// eg3:
        ///     输入: [1,1,1,3,3,4,3,2,4,2]
        ///     输出: true
        let s = Solution()
        let nums1 =  [1,2,3,1];
        let result1 = s.containsDuplicate(nums1);
        XCTAssertEqual(result1, true)
        
        let nums2 = [1,2,3,4]
        let result2 = s.containsDuplicate(nums2)
        XCTAssertEqual(result2, false)
        
        let nums3 = [1,1,1,3,3,4,3,2,4,2]
        let result3 = s.containsDuplicate(nums3)
        XCTAssertEqual(result3, true)
    }
    
    func testSolution_rotate() {
        let s = Solution()
        var num1 = [1,2,3,4,5,6,7]
        let k1 = 3
        print("\t input->num1:\(num1)")
        s.rotate(&num1, k1)
        print("\t output->num1:\(num1)")
        
        var num2 = [-1,-100,3,99]
        let k2 = 2
        print("\t input->nums2:\(num2)")
        s.rotate(&num2, k2)
        print("\t output->num2:\(num2)")
        
        
        var num3 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        let k3 = 45
        print("\t input->nums3:\(num3)")
        s.rotate(&num3, k3)
        print("\t output->num3:\(num3)")
    }
    
    func testSolution_singleNumber() {
        let s = Solution()
        let nums1 = [2,2,1]
        
        let target1 =   s.singleNumber(nums1)
        XCTAssertEqual(target1, 1)
        
        let nums2 = [4,1,2,1,2]
        let target2 = s.singleNumber(nums2)
        XCTAssertEqual(target2, 4)
        
    }
    
    func testSolution_moveZeroes() {
        let s = Solution()
        var nums1 = [0,1,0,3,12]
        print("\t input->num1:\(nums1)")
        s.moveZeroes(&nums1)
        print("\t output->num1:\(nums1)")
        
        
        var nums2 = [0,0,0,3,4,5,6,7,0,8,0,9,10,0,11,0,12]
        print("\t input->num2:\(nums2)")
        s.moveZeroes(&nums2)
        print("\t output->num2:\(nums2)")
        
    }
    
    func testSolution_plusOne() {
        let s = Solution()
        
        
        let nums1 = [1,2,3]
        print("\t input->num1:\(nums1)")
        let res1 = s.plusOne(nums1)
        print("\t output->res1:\(res1)")
        
        let nums2 = [4,3,2,1]
        print("\t input->nums2:\(nums2)")
        let res2 = s.plusOne(nums2)
        print("\t output->res2:\(res2)")
        
        let nums3 = [4,9,8,9,9,9]
        print("\t input->nums2:\(nums3)")
        let res3 = s.plusOne(nums3)
        print("\t output->res3:\(res3)")

        
    }
    
    func testSolution_rotateMatrix() {
        let s = Solution()
        
        var maxtrix1  = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
        ]
        print("\t input->maxtrix1:\(maxtrix1)")
        s.rotate(&maxtrix1)
        print("\t output->maxtrix1:\(maxtrix1)")
        
        var matrix2 = [
            [ 5, 1, 9,11],
            [ 2, 4, 8,10],
            [13, 3, 6, 7],
            [15,14,12,16]
        ]
        
        print("\t input->matrix2:\(matrix2)")
        s.rotate(&matrix2)
        print("\t output->matrix2:\(matrix2)")
    }
    
    func testSolution_reverseString () {
        let s = Solution()
        
        var s1: [Character] = ["h","e","l","l","o"]
        print("\t input->S1:\(s1)")
        s.reverseString(&s1)
        print("\t output->S1:\(s1)")
        
        var s2: [Character] = ["H","a","n","n","a","h"]
        print("\t input->S2:\(s2)")
        s.reverseString(&s2)
        print("\t output->S2:\(s2)")
    }
    
    func testSolution_firstUniqChar() {
        let s = Solution()
        let str1 = "leetcode"
        print("\t input->str1:\(str1)")
        let index1 = s.firstUniqChar(str1)
        XCTAssertEqual(index1, 0)
        
        let str2 = "loveleetcode"
        print("\t input->str2:\(str2)")
        let index2 = s.firstUniqChar(str2)
        XCTAssertEqual(index2, 2)
    }
    
    func testSolution_isPalindrome() {
        let s = Solution()
        let str1 = "A man, a plan, a canal: Panama"
        print("\t input->str1:\(str1)")
        XCTAssertEqual(s.isPalindrome(str1), true)
        let str2 = "race a car"
        print("\t input->str2:\(str2)")
        XCTAssertEqual(s.isPalindrome(str2), false)
    }
    
    func testSolution_longestCommonPrefix() {
        let s = Solution()
        
        let strArray1 = ["flower","flow","flight"]
        print("\t input->strArray1:\(strArray1)")
        let resut1 = s.longestCommonPrefix(strArray1)
        print("\t output->result1: \(resut1)")
        XCTAssertEqual(resut1, "fl")
        
        let strArray2 = ["dog","racecar","car"]
        print("\t input->strArray2:\(strArray2)")
        let resut2 = s.longestCommonPrefix(strArray2)
        print("\t output->result2:\(resut2)")
        XCTAssertEqual(resut2, "")
        
        let strArray3 = ["solve","solution","solving"]
        print("\t input->strArray3:\(strArray3)")
        let resut3 = s.longestCommonPrefix(strArray3)
        print("\t output->result3:\(resut3)")
        XCTAssertEqual(resut3, "sol")
    }
    
}
