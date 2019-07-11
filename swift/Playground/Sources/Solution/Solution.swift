import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class Solution {
    public init() {}

    // MARK: - Basic array
    
    /// 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
    /// 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
    /// ```
    /// eg1:
    ///     给定数组 nums = [1,1,2],
    ///     函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
    ///     你不需要考虑数组中超出新长度后面的元素。
    /// eg2:
    ///     给定 nums = [0,0,1,1,1,2,2,3,3,4],
    ///     函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
    ///     你不需要考虑数组中超出新长度后面的元素。
    /// ```
    /// - Parameter nums: 数组
    /// - Returns: 数组长度
    public func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var j = 0 /// 使用 j 记录当前最后一个重复元素的索引
        for i in 1..<nums.count {
            if nums[i] != nums[i-1] {
                j = j + 1;
                nums[j] = nums[i];
            }
        }
        return j+1;
    }
    
    
    /// 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
    /// 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
    /// 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
    /// ```
    /// eg1:
    ///     输入: [7,1,5,3,6,4]
    ///     输出: 7
    ///     解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
    ///         随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3
    /// eg2:
    ///     输入: [1,2,3,4,5]
    ///     输出: 4
    ///     解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
    ///           注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
    ///           因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
    /// eg3:
    ///     输入: [7,6,4,3,1]
    ///     输出: 0
    ///     解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
    /// ```
    /// - Parameter prices: prices array
    /// - Returns: return profit
    public func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        for i in 1 ..< prices.count {
            if prices[i] > prices[i-1] {
                maxProfit = maxProfit + prices[i] - prices[i-1]
            }
        }
        return maxProfit
    }
    
    
    
    /// 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
    /// ```
    ///eg1:
    ///     输入: [1,2,3,4,5,6,7] 和 k = 3
    ///     输出: [5,6,7,1,2,3,4]
    ///     解释:
    ///         向右旋转 1 步: [7,1,2,3,4,5,6]
    ///         向右旋转 2 步: [6,7,1,2,3,4,5]
    ///         向右旋转 3 步: [5,6,7,1,2,3,4]
    ///eg2:
    ///     输入: [-1,-100,3,99] 和 k = 2
    ///     输出: [3,99,-1,-100]
    ///     解释:
    ///         向右旋转 1 步: [99,-1,-100,3]
    ///         向右旋转 2 步: [3,99,-1,-100]
    /// ```
    /// 说明:
    ///     尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
    ///     要求使用空间复杂度为 O(1) 的原地算法。
    ///
    /// - Parameters:
    ///   - nums: nums
    ///   - k: k
    public func rotate(_ nums: inout [Int], _ k: Int) {
        let rotateCount = k % nums.count
        guard rotateCount != 0 else {
            return
        }
        var j = nums.count - rotateCount
        /// 注意最后一个元素，不需要处理
        for i in 0 ..< nums.count - 1 {
            nums.swapAt(i, j)
            j = j + 1
            if j >= nums.count {
                j = nums.count - rotateCount
            }
        }
    }
    
    
    
    ///给定一个整数数组，判断是否存在重复元素。
    /// 如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
    /// ```
    /// eg1:
    ///     输入: [1,2,3,1]
    ///     输出: true
    /// eg2:
    ///     输入: [1,2,3,4]
    ///     输出: false
    /// eg3:
    ///     输入: [1,1,1,3,3,4,3,2,4,2]
    ///     输出: true
    /// ```
    /// - Parameter nums: nums
    /// - Returns: return bool
    public func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>(minimumCapacity: nums.count)
        for i in 0 ..< nums.count {
            if set.contains(nums[i]) {
                return true
            } else {
                set.insert(nums[i])
            }
        }
        return false
    }
    
    
    /// 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
    ///
    /// 说明：
    ///     你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
    /// ```
    /// eg 1:
    ///     输入: [2,2,1]
    ///     输出: 1
    /// eg 2:
    ///     输入: [4,1,2,1,2]
    ///     输出: 4
    /// ```
    /// - Parameter nums: nums description
    /// - Returns: return value description
    /// - Solving: 可以先对数组进行一次排序，然后步长 2 遍历整个数组，如果nums[i] != nums[i-1] 那么i 就是那个只出现一次的元素的索引
    public func singleNumber(_ nums: [Int]) -> Int {
        var array = nums
        array.sort { (a, b) -> Bool in
            return a < b
        }
        var index = -1
        for i in stride(from: 1, to: array.count, by: 2) {
            if array[i] != array[i-1] {
                index = i-1
                break
            }
        }
        if index == -1 {
            index = array.count - 1
        }
        return array[index]
    }
    
    
    
    /// 给定两个数组，编写一个函数来计算它们的交集。
    /// ```
    /// eg 1:
    ///     输入: nums1 = [1,2,2,1], nums2 = [2,2]
    ///     输出: [2,2]
    /// eg 2:
    ///     输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
    ///     输出: [4,9]
    /// ```
    /// 说明：
    ///     输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
    ///     我们可以不考虑输出结果的顺序。
    /// 进阶:
    ///     如果给定的数组已经排好序呢？你将如何优化你的算法？
    ///     如果 nums1 的大小比 nums2 小很多，哪种方法更优？
    ///     如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
    /// - Parameters:
    ///   - nums1: nums1 description
    ///   - nums2: nums2 description
    /// - Returns: return value description
    public func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return []
    }
    
    
    /// 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
    /// 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
    /// 你可以假设除了整数 0 之外，这个整数不会以零开头。
    /// ```
    /// eg 1:
    ///     输入: [1,2,3]
    ///     输出: [1,2,4]
    /// 解释: 输入数组表示数字 123。
    /// eg 2:
    ///     输入: [4,3,2,1]
    ///     输出: [4,3,2,2]
    /// ```
    /// 解释: 输入数组表示数字 4321。
    ///
    /// - Parameter digits: digits description
    /// - Returns: return value description
    public func plusOne(_ digits: [Int]) -> [Int] {
        var nums = digits
        var i = nums.count - 1
        var takeOver = 1
        while i >= 0 {
            let result = nums[i] + takeOver
            if result <= 9  {
                nums[i] = result
                takeOver = 0
                break
            } else {
                takeOver = result % 9
                nums[i] = 0
            }
            i = i - 1
        }
        if takeOver > 0 {
            nums.insert(takeOver, at: 0)
        }
        return nums
    }
    
    
    /// 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
    /// ```
    /// eg
    ///     输入: [0,1,0,3,12]
    ///     输出: [1,3,12,0,0]
    /// ```
    /// 说明:
    ///     必须在原数组上操作，不能拷贝额外的数组。
    ///     尽量减少操作次数。
    ///
    /// - Parameter nums: nums description
    public func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                nums.swapAt(j, i)
                j = j + 1
            }
        }
    }
    
    
    
    /// 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
    /// 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
    /// ```
    /// eg:
    ///     给定 nums = [2, 7, 11, 15], target = 9
    ///     因为 nums[0] + nums[1] = 2 + 7 = 9
    ///     所以返回 [0, 1]
    /// ```
    /// - Parameters:
    ///   - nums: nums description
    ///   - target: target description
    /// - Returns: return value description
    public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        return []
    }
    
    
    
    /// 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
    ///     1.数字 1-9 在每一行只能出现一次。
    ///     2.数字 1-9 在每一列只能出现一次。
    ///     3.数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次
    ///     ![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)
    ///     [
    ///         ["5","3",".",".","7",".",".",".","."],
    ///         ["6",".",".","1","9","5",".",".","."],
    ///         [".","9","8",".",".",".",".","6","."],
    ///         ["8",".",".",".","6",".",".",".","3"],
    ///         ["4",".",".","8",".","3",".",".","1"],
    ///         ["7",".",".",".","2",".",".",".","6"],
    ///         [".","6",".",".",".",".","2","8","."],
    ///         [".",".",".","4","1","9",".",".","5"],
    ///         [".",".",".",".","8",".",".","7","9"]
    ///     ]
    /// 上图是一个部分填充的有效的数独。
    
    /// 数独部分空格内已填入了数字，空白格用 '.' 表示。
    /// ```
    /// eg 1:
    ///     输入:
    ///         [
    ///             ["5","3",".",".","7",".",".",".","."],
    ///             ["6",".",".","1","9","5",".",".","."],
    ///             [".","9","8",".",".",".",".","6","."],
    ///             ["8",".",".",".","6",".",".",".","3"],
    ///             ["4",".",".","8",".","3",".",".","1"],
    ///             ["7",".",".",".","2",".",".",".","6"],
    ///             [".","6",".",".",".",".","2","8","."],
    ///             [".",".",".","4","1","9",".",".","5"],
    ///             [".",".",".",".","8",".",".","7","9"]
    ///         ]
    ///     输出: true
    ///
    /// eg 2:
    ///     输入:
    ///         [
    ///             ["8","3",".",".","7",".",".",".","."],
    ///             ["6",".",".","1","9","5",".",".","."],
    ///             [".","9","8",".",".",".",".","6","."],
    ///             ["8",".",".",".","6",".",".",".","3"],
    ///             ["4",".",".","8",".","3",".",".","1"],
    ///             ["7",".",".",".","2",".",".",".","6"],
    ///             [".","6",".",".",".",".","2","8","."],
    ///             [".",".",".","4","1","9",".",".","5"],
    ///             [".",".",".",".","8",".",".","7","9"]
    ///         ]
    ///     输出: false
    /// ```
    /// 解释:
    ///     除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
    ///     但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
    /// 说明:
    ///     一个有效的数独（部分已被填充）不一定是可解的。
    ///     只需要根据以上规则，验证已经填入的数字是否有效即可。
    ///     给定数独序列只包含数字 1-9 和字符 '.' 。
    ///     给定数独永远是 9x9 形式的。
    ///
    /// - Parameter board: board description
    /// - Returns: return value description
    public func isValidSudoku(_ board: [[Character]]) -> Bool {
        return false
    }
    
    
    /// 给定一个 n × n 的二维矩阵表示一个图像。
    /// 将图像顺时针旋转 90 度。
    
    /// 说明：
    ///     你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
    
    /// eg1:
    ///     给定 matrix =
    ///                 [
    ///                     [1,2,3],
    ///                     [4,5,6],
    ///                     [7,8,9]
    ///                 ],
    
    ///     原地旋转输入矩阵，使其变为:
    ///             [
    ///                 [7,4,1],
    ///                 [8,5,2],
    ///                 [9,6,3]
    ///             ]
    /// eg2:
    
    ///     给定 matrix =
    ///     [
    ///         [ 5, 1, 9,11],
    ///         [ 2, 4, 8,10],
    ///         [13, 3, 6, 7],
    ///         [15,14,12,16]
    ///     ],
    
    ///     原地旋转输入矩阵，使其变为:
    ///         [
    ///             [15,13, 2, 5],
    ///             [14, 3, 4, 1],
    ///             [12, 6, 8, 9],
    ///             [16, 7,10,11]
    ///         ]
    ///
    /// - Parameter matrix: matrix description
    /// - Solving:
    /// ```
    ///  解决这个问题分两步，先沿着左下角至右上角的对角线交换元素(step1)，然后沿着从左到右的中线交换元素(step2)，最后得到结果
    ///  eg1:
    ///  [1,2,3]       step1      [9,6,3]    索引对应：   [0,0] ---> [2,2]
    ///  [4,5,6]      ------>     [8,5,2]               [0,1] ---> [1,2]  
    ///  [7,8,9]                  [7,4,1]               [1,0] ---> [2,1]               
    ///                                           
    ///  [9,6,3]      step2       [7,4,1]               [0,0] ---> [2,0] 
    ///  [8,5,2]     ------>      [8,5,2]               [0,1] ---> [2,1]
    ///  [7,4,1]                  [9,6,3]               [0,2] ---> [2,2]
    /// eg2:
    /// [5,  1,  9,  11]                       [16,  7,  10,  11]       index: [0,0] --> [3,3]
    /// [2,  4,  8,  10]        step1          [12,  6,   8,  9]               [0,1] --> [2,3]
    /// [13, 3,  6,  7 ]       ------>         [14,  3,   4,  1]               [0,2] --> [1,3]
    /// [15, 14, 12, 16]                       [15,  13,  2,  5]               [1,0] --> [3,2]
    ///                                                                        [1,1] --> [2,2]
    ///                                                                        [2,0] --> [3,1]
    ///
    /// [16,  7,  10,  11]                      [15,  13,  2,  5]      index:  [0,0] --> [3,0]
    /// [12,  6,   8,  9 ]     step2            [14,  3,   4,  1]              [0,1] --> [3,1]
    /// [14,  3,   4,  1 ]     ----->           [12,  6,   8,  9]              [0,2] --> [3,2]
    /// [15,  13,  2,  5 ]                      [16,  7,  10,  11]             [0,3] --> [3,3]
    ///                                                                        [1,0] --> [2,0]
    ///                                                                        [1,1] --> [2,1]
    ///                                                                        [1,2] --> [2,2]
    ///                                                                        [1,3] --> [2,3]
    ///```
    public func rotate(_ matrix: inout [[Int]]) {
        let row = matrix.count - 1
        let column = matrix[0].count - 1
        for i in 0 ..< row  {
            for j in 0 ..< column - i  {
                //(matrix[i][j] ,matrix[row-j][column-i])  = (matrix[row-j][column-i],matrix[i][j])
                let temp = matrix[i][j]
                matrix[i][j] = matrix[row-j][column-i]
                matrix[row-j][column-i] = temp
            }
        }
        
        for i in 0 ... row / 2 {
            for j in 0 ... column {
                let temp =  matrix[i][j]
                matrix[i][j] = matrix[row-i][j]
                matrix[row-i][j] = temp
            }
        }
    }
    
    // MARK: - Basic String
    /// 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
    /// 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
    /// 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
    /// ```
    /// eg 1：
    ///     输入：["h","e","l","l","o"]
    ///     输出：["o","l","l","e","h"]
    /// eg 2：
    ///     输入：["H","a","n","n","a","h"]
    ///     输出：["h","a","n","n","a","H"]
    /// ```
    /// - Parameter s: 字符数组
    public func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        while left < right {
            s.swapAt(left, right)
            left = left + 1
            right = right - 1
        }
    }
    
    
    /// 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
    ///```
    /// eg 1:
    ///     输入: 123
    ///     输出: 321
    /// eg 2:
    ///     输入: -123
    ///     输出: -321
    /// eg 3:
    ///     输入: 120
    ///     输出: 21
    /// ```
    /// 注意:
    /// 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
    /// - Parameter x: x description
    /// - Returns: return value description
    public func reverse(_ x: Int) -> Int {
        return 0
    }
    
    
    /// 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
    /// ```
    /// eg:
    /// s = "leetcode"
    /// 返回 0.
    /// s = "loveleetcode",
    /// 返回 2.
    /// 注意事项：您可以假定该字符串只包含小写字母。
    /// ```
    /// - Parameter s: 字符串
    /// - Returns: 返回 0
    public func firstUniqChar(_ s: String) -> Int {
        var freq: [Character:Int] = Dictionary(minimumCapacity: s.count)
        for item in s {
            if let q = freq[item] {
                freq[item] = q + 1
            } else {
                freq[item] = 1
            }
        }
        
        for index in s.indices {
            guard let q = freq[s[index]] else {
                return -1
            }
            if q == 1 {
                return s.distance(from: s.startIndex, to: index)
            }
        }
        return 0
    }

    
    /// 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。
    /// 两个单词如果包含相同的字母，次序不同，则称为字母易位词(anagram)。
    /// 例如，“silent”和“listen”是字母易位词，而“apple”和“aplee”不是易位词
    /// ```
    /// eg1:
    /// 输入: s = "anagram", t = "nagaram"
    /// 输出: true
    /// eg 2:
    /// 输入: s = "rat", t = "car"
    /// 输出: false
    /// 说明:
    /// 你可以假设字符串只包含小写字母。
    /// 进阶:
    /// 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
    /// ```
    ///
    /// - Parameters:
    ///   - s: s
    ///   - t: t
    /// - Returns: return value description
    public func isAnagram(_ s: String, _ t: String) -> Bool {
        return false
    }
    
    
    /// 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
    
    /// 说明：本题中，我们将空字符串定义为有效的回文串。
    /// ```
    /// eg 1:
    /// 输入: "A man, a plan, a canal: Panama"
    /// 输出: true
    /// eg 2:
    /// 输入: "race a car"
    /// 输出: false
    /// ```
    /// - Parameter s: s
    /// - Returns: return value description
    public func isPalindrome(_ s: String) -> Bool {
        /// swift String 的 endIndex 表示的是最后一个字符的后一个位置
        var left = s.startIndex
        var right = s.index(before: s.endIndex)
        var result = true
        while left < right {
            while !s[left].isEnglishLetter && left < s.endIndex  {
                left = s.index(after: left)
            }
            while !s[right].isEnglishLetter && right >= s.startIndex {
                right = s.index(before: right)
            }
            
            if left >= right {
                break
            }
            
            if s[left].lowercased() == s[right].lowercased() {
                left = s.index(after: left)
                right = s.index(before: right)
            } else {
                result = false
                break
            }
        }
        return result
    }
    
    
    /// 请你来实现一个 atoi 函数，使其能将字符串转换成整数。
    /// ```
    /// 首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。
    /// 当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。
    /// 该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。
    /// 注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。
    /// 在任何情况下，若函数不能进行有效的转换时，请返回 0。
    /// 说明：
    /// 假设我们的环境只能存储 32 位大小的有符号整数，那么其数值范围为 [−231,  231 − 1]。如果数值超过这个范围，qing返回  INT_MAX (231 − 1) 或 INT_MIN (−231) 。
    /// eg 1:
    /// 输入: "42"
    /// 输出: 42
    /// eg 2:
    /// 输入: "   -42"
    /// 输出: -42
    /// 解释: 第一个非空白字符为 '-', 它是一个负号。
    /// 我们尽可能将负号与后面所有连续出现的数字组合起来，最后得到 -42 。
    /// eg 3:
    /// 输入: "4193 with words"
    /// 输出: 4193
    /// 解释: 转换截止于数字 '3' ，因为它的下一个字符不为数字。
    /// eg 4:
    /// 输入: "words and 987"
    /// 输出: 0
    /// 解释: 第一个非空字符是 'w', 但它不是数字或正、负号。
    /// 因此无法执行有效的转换。
    /// eg 5:
    /// 输入: "-91283472332"
    /// 输出: -2147483648
    /// 解释: 数字 "-91283472332" 超过 32 位有符号整数范围。
    /// 因此返回 INT_MIN (−231) 。
    ///
    /// ```
    /// - Parameter str: str
    /// - Returns: return value description
    public func myAtoi(_ str: String) -> Int {
        var isPositive: Bool = true
        for index in str.indices {
            
        }
        return 0
    }

    
    /// 实现 strStr() 函数。
    
    /// 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
    /// ```
    /// 示例 1:
    /// 输入: haystack = "hello", needle = "ll"
    /// 输出: 2
    /// 示例 2:
    
    /// 输入: haystack = "aaaaa", needle = "bba"
    /// 输出: -1
    /// ```
    /// 说明:
    /// 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
    /// 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
    ///
    /// - Parameters:
    ///   - haystack: haystack description
    ///   - needle: needle description
    /// - Returns: return value description
    public func strStr(_ haystack: String, _ needle: String) -> Int {
        return 0
    }
    
    
    /// 报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
    /// 1.     1
    /// 2.     11
    /// 3.     21
    /// 4.     1211
    /// 5.     111221
    /// 1 被读作  "one 1"  ("一个一") , 即 11。
    /// 11 被读作 "two 1s" ("两个一"）, 即 21。
    /// 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
    /// 给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。
    /// 注意：整数顺序将表示为一个字符串。
    
    /// ```
    /// eg 1:
    /// 输入: 1
    /// 输出: "1"
    /// eg 2:
    /// 输入: 4
    /// 输出: "1211"
    /// ```
    /// - Parameter n: n description
    /// - Returns: return value description
    public func countAndSay(_ n: Int) -> String {
        return ""
    }
    
    
    /// 编写一个函数来查找字符串数组中的最长公共前缀。
    /// 如果不存在公共前缀，返回空字符串 ""。
    /// ```
    /// 示例 1:
    /// 输入: ["flower","flow","flight"]
    /// 输出: "fl"
    /// 示例 2:
    
    /// 输入: ["dog","racecar","car"]
    /// 输出: ""
    /// ```
    /// 解释: 输入不存在公共前缀。
    /// 说明:
    /// 所有输入只包含小写字母 a-z 。
    ///
    /// - Parameter strs: strs description
    /// - Returns: return value description
    public func longestCommonPrefix(_ strs: [String]) -> String {
        var commonPrefix: String = ""
        guard let first = strs.first else {
            return commonPrefix
        }
        
        for index in first.indices {
            var isEqual = false
            for item in strs {
                guard index < item.endIndex else {
                    return commonPrefix
                }
                isEqual =  item[index] == first[index]
                if !isEqual {
                    break
                }
            }
            
            if isEqual {
                commonPrefix.append(first[index])
            } else {
                break
            }
        }
        
        return commonPrefix
    }

    // MARK: - Basic list
    /// 请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点，你将只被给定要求被删除的节点。
    /// 现有一个链表 -- head = [4,5,1,9]，它可以表示为:
    /// 示例 1:
    /// 输入: head = [4,5,1,9], node = 5
    /// 输出: [4,1,9]
    /// 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
    /// 示例 2:
    /// 输入: head = [4,5,1,9], node = 1
    /// 输出: [4,5,9]
    /// 解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
    /// 说明:
    /// 链表至少包含两个节点。
    /// 链表中所有节点的值都是唯一的。
    /// 给定的节点为非末尾节点并且一定是链表中的一个有效节点。
    /// 不要从你的函数中返回任何结果。
    ///
    /// - Parameters:
    ///   - head: head description
    ///   - target: target description
    
    public func deleteNode(_ head: ListNode, target: Int) {
        
    }
    
    
    /// 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
    /// ```
    /// 示例：
    /// 给定一个链表: 1->2->3->4->5, 和 n = 2.
    /// 当删除了倒数第二个节点后，链表变为 1->2->3->5.
    /// ```
    /// 说明：
    /// 给定的 n 保证是有效的。
    /// 进阶：
    /// 你能尝试使用一趟扫描实现吗？
    ///
    /// - Parameters:
    ///   - head: head description
    ///   - n: n description
    /// - Returns: return value description
    public func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        return nil
    }
    
    
    /// 反转一个单链表。
    /// 示例:
    /// 输入: 1->2->3->4->5->NULL
    /// 输出: 5->4->3->2->1->NULL
    /// 进阶:
    /// 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
    ///
    /// - Parameter head: head description
    /// - Returns: return value description
    public func reverseList(_ head: ListNode?) -> ListNode? {
        return nil
        
    }
}


extension Character {
    var isEnglishLetter: Bool {
        return (self >= "A" && self <= "Z") ||
               (self >= "a" && self <= "z")
    }
    
    var isDigit: Bool {
        return self >= "0" && self <= "9"
    }
    
    var isInvisibleASCII: Bool {
        guard let assciiValue = self.asciiValue else {
            return false
        }
        
        return assciiValue >= 0 && assciiValue <= 32 || assciiValue == 127
    }
 
    var isPlusSign: Bool {
        return self == "+"
    }
    
    var isMinusSign: Bool {
        return self == "-"
    }
}
