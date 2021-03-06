import XCTest
import Solution

final class SolutionTests: XCTestCase {
    
    // MARK: - Array Test
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
    
    // MARK: - Sring Test
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
    
    func testSolution_myAtoi() {
        let s = Solution()
        print("\t input->string t1: 1234")
        let t1 = s.myAtoi("1234")
        print("\t output->t1:\(t1!)")
        XCTAssertEqual(t1, 1234)
        
        print("\t input->string t2: -483")
        let t2 = s.myAtoi("-483")
        print("\t output->t2:\(t2!)")
        XCTAssertEqual(t2, -483)
        
        print("\t input->string: a123")
        if let t3 = s.myAtoi("a123") {
            print("\t output->t3:\(t3)")
        } else {
            print("\t output->t3 is nil")
        }
        
        print("\t input->string t4: -  69879 abc")
        if let t4 = s.myAtoi("-  69879 abc") {
            print("\t output->t4:\(t4)")
        } else {
            print("\t output->t4 is nil")
        }
        
        
        print("\t input->string t5:      -69879 abc")
        if let t5 = s.myAtoi("      -69879 abc") {
            print("\t output->t4:\(t5)")
            XCTAssertEqual(t5, -69879)
        } else {
            print("\t output->t5 is nil")
        }
    }
    
    func testSolution_strStr() {
        let s = Solution()
        
        let haystack1 = "hello"
        let needle1 = "ll"
        print("\t input-> haystack1:\(haystack1) needle1:\(needle1)")
        let result1 = s.strStr(haystack1, needle1)
        print("\t output->result1: \(result1)")
        
        let haystack2 = "aaaaa"
        let needle2 = "bba"
        print("\t input-> haystack2:\(haystack2) needle2:\(needle2)")
        let result2 = s.strStr(haystack2, needle2)
        print("\t output->result1: \(result2)")
    }
    
    // MARK: - List test
    func testSolution_deleteNode() {
        let s = Solution()
        
        guard var list1 =  ListNode([4,5,1,9]) else {
            NSLog("list1 init failed")
            return
        }
        
        var target = 5
        NSLog("\t input list1:\(list1), delete target:\(target)")
        s.deleteNode(&list1, target: target)
        NSLog("\t output list1:\(list1)")
        
        
       guard var list2 =  ListNode([4,5,1,9]) else {
            NSLog("list1 init failed")
            return
        }
        
        target = 4
        NSLog("\t input list2:\(list2), delete target:\(target)")
        s.deleteNode(&list2, target: target)
        NSLog("\t output list2:\(list2)")
    }
    
    func testSolution_removeNthFromEnd() {
        let s = Solution()
        
        guard let list1 = ListNode([1, 2, 3, 4, 5]) else {
            NSLog("list1 init failed")
            return
        }
        
        var n = 5
        NSLog("remove the \(n)th of \"\(list1)\" from end")
        if let result1 = s.removeNthFromEnd(list1, n) {
            NSLog("ouput list \(result1)")
        } else {
            NSLog("out put is nil")
        }
        
        n = 2
        guard let list2 = ListNode([1, 2, 3, 4, 5]) else {
            NSLog("list1 init failed")
            return
        }
        NSLog("remove the \(n)th of \"\(list2)\" from end")
        if let result2 = s.removeNthFromEnd(list2, n) {
            NSLog("ouput list \(result2)")
        } else {
            NSLog("out put is nil")
        }
    }
    
    func testSolution_reverseList() {
        let s = Solution()
        
        guard let list1 = ListNode([1, 2, 3, 4, 5]) else {
            NSLog("list1 init failed")
            return
        }
        
        if let newHead = s.reverseList(list1) {
            NSLog("\(newHead)")
        }
        
        guard let list2 = ListNode([1]) else {
            NSLog("list1 init failed")
            return
        }
        
        if let newHead = s.reverseList(list2) {
            NSLog("\(newHead)")
        }
    }
    
    func testSolution_mergeTwoLists() {
        let s = Solution()
        
        if let list1 =  ListNode([1,2,4]),
           let list2 = ListNode([1,3,4]),
           let r1 = s.mergeTwoLists(list1, list2) {
            NSLog("\(r1)")
        }
        
        if let list3 = ListNode([1,2,8,9,10,12,13,14,16,17,18]),
           let list4 = ListNode([3,4,5,6,7,11,15,19,20,21]),
           let r2 = s.mergeTwoLists(list3, list4) {
            NSLog("\(r2)")
        }
    }
    
    
    func testSolution_mergeLists() {
        let s = Solution()
        
        if let list1 =  ListNode([1,2,4]),
           let list2 = ListNode([1,3,4]),
           let r1 = s.mergeLists(list1, list2) {
            NSLog("r1: \(r1)")
        }
        
        if let list3 = ListNode([1,2,8,9,10,12,13,14,16,17,18]),
           let list4 = ListNode([3,4,5,6,7,11,15,19,20,21]),
           let r2 = s.mergeLists(list3, list4) {
            NSLog("r2: \(r2)")
        }
        
        if let list5 =  ListNode([1,2,4]),
           let r3 = s.mergeLists(list5, nil) {
            NSLog("r3: \(r3)")
        }
        
        guard let _ = s.mergeLists(nil, nil) else {
            NSLog("r4: NULL")
            return
        }
    }
    
    func testSolution_list_isPalindrome() {
        let s = Solution()
        
        if let list1 = ListNode([1,2,2,1])  {
            XCTAssertEqual(s.isPalindrome(list1), true)
        }
        
        if let list2 = ListNode([1,2,3,2,1]) {
            XCTAssertEqual(s.isPalindrome(list2), true)
        }
        
        if let list3 = ListNode([1,2,3,2,3])  {
            XCTAssertEqual(s.isPalindrome(list3), false)
         }
    }
    
    // MARK: - Tree Test
    func testSolution_tree_maxDepth() {
        let s = Solution()
        
        if let root1 = TreeNode.createTree(with: [3, 9, 20, nil, nil, 15, 7], from: 0) {
            let depath1 = s.maxDepth(root1)
            XCTAssertEqual(depath1, 3)
        }
    }
    
    func testSolution_tree_isValidBST() {
        let s = Solution()
        
        if let root1 = TreeNode.createTree(with: [2,1,3], from: 0) {
            XCTAssertEqual(s.isValidBST(root1), true)
        }
        
        
        if let root2 = TreeNode.createTree(with: [5,1,4,nil,nil,3,6], from: 0) {
            XCTAssertEqual(s.isValidBST(root2), false)
        }
        
    }

	func testSolution_tree_isSymmetric() {
		let s = Solution()	

		if let tree1 = TreeNode.createTree(with: [1,2,2,3,4,4,3], from: 0)  {
            XCTAssertEqual(s.isSymmetric(tree1), true )
		}

		if let tree2 = TreeNode.createTree(with: [1,2,2,nil,3,nil,3], from: 0) {
			XCTAssertEqual(s.isSymmetric(tree2), false )
		}
	}
    
    func testSolution_tree_levelOrder() {
        let s = Solution()
        
        if let root1 = TreeNode.createTree(with: [3,9,20,nil,nil,15,7], from: 0) {
            let result1 = s.levelOrder(root1)
            print(result1)
        }
        
        let result = s.levelOrder(nil)
        print(result)
    }
    
    func testSolution_tree_sortedArrayToBST() {
        let s = Solution()
        
        let tree1 =  s.sortedArrayToBST([])
        XCTAssertNil(tree1)
        
            
        if let tree2 = s.sortedArrayToBST([-10,-3,0,5,9]) {
            print(tree2)
        }
        
        if let tree3 = s.sortedArrayToBST([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
            print(tree3)
        }
    }
    
    
    // MARK: - sorted and search
    func testSolution_merge() {
        let s = Solution()
        var nums1 = [1,2,3,0,0,0]
        let  m = 3
        var nums2 = [2,5,6]
        let  n = 3
        s.merge(&nums1, m, nums2, n)
        print(nums1)
        
        nums1 = [2, 3, 6, 9, 10, 20]
        nums2 = [1, 4, 5, 7, 11, 12, 13, 14, 15, 16, 22, 23, 24, 25]
        s.merge(&nums1, nums1.count, nums2, nums2.count)
        print(nums1)
        
        
        nums2 = [2, 3, 6, 9, 10, 20]
        nums1 = [1, 4, 5, 7, 11, 12, 13, 14, 15, 16, 22, 23, 24, 25]
        s.merge(&nums1, nums1.count, nums2, nums2.count)
        print(nums1)
    }
    
    // MARK: - Basic Dynamic Programming
    func testSolution_climbStairs() {
        let s = Solution()
        dumpMeasureInfo("climbStairs(3)" ) {
            XCTAssertEqual(s.climbStairs(3), 3)
        }
        
        dumpMeasureInfo("climbStairs(10)" ) {
            XCTAssertEqual(s.climbStairs(10), 89)
        }
        
        dumpMeasureInfo("climbStairs(20)" ) {
            XCTAssertEqual(s.climbStairs(20), 10946)
        }
        
        dumpMeasureInfo("climbStairs(40)" ) {
            XCTAssertEqual(s.climbStairs(40), 165580141)
        }
    }
    
    func testSolution_climbStairs1() {
        let s = Solution()
        dumpMeasureInfo("climbStairs(3)" ) {
            XCTAssertEqual(s.climbStairs1(3), 3)
        }
        
        dumpMeasureInfo("climbStairs(10)" ) {
            XCTAssertEqual(s.climbStairs1(10), 89)
        }
        
        dumpMeasureInfo("climbStairs(20)" ) {
            XCTAssertEqual(s.climbStairs1(20), 10946)
        }
        
        dumpMeasureInfo("climbStairs(40)" ) {
            XCTAssertEqual(s.climbStairs1(40), 165580141)
        }
        
        dumpMeasureInfo("climbStairs(91)" ) {
            XCTAssertEqual(s.climbStairs1(91), 7540113804746346429)
        }
    }
}
