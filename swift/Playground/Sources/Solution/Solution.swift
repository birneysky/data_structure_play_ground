import Foundation

public class Solution {
    public init() {}
    
    /// for https://leetcode-cn.com/explore/featured/card/top-interview-questions-easy/24/design/58/
    public init(_ nums: [Int]) {}
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
    /// - Returns: 由于 swift 现代简洁的语法特性，可以在转化失败后返回 nil，比 c 语言修改全局变量的方式更优雅
    public func myAtoi(_ str: String) -> Int?  {
        var isPositive: Bool = true
        var startIndex = str.startIndex
        let endIndex = str.endIndex
        var num: Int = 0
        let zero: Character = "0"
        /// 寻找首个有效字符
        while str[startIndex].isInvisibleASCII {
            startIndex = str.index(after: startIndex)
        }
        /// 处理 + -
        if str[startIndex].isPlusSign {
            startIndex = str.index(after: startIndex)
        } else if str[startIndex].isMinusSign {
            startIndex = str.index(after: startIndex)
            isPositive = false
        } else if !str[startIndex].isDigit {
            return nil
        }
        
        /// 计算
        while startIndex < endIndex {

            if str[startIndex].isDigit {
                num = num * 10 + Int(str[startIndex].asciiValue! - zero.asciiValue!)
                startIndex = str.index(after: startIndex)
            } else {
                break
            }
        }
        
        
        return isPositive ? num : -num
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
        var hIndex = haystack.startIndex
        let hEndIndex = haystack.endIndex
        var nIndex = needle.startIndex
        let nEndIndex = needle.endIndex
        var result = -1
        while hIndex < hEndIndex {
            if haystack[hIndex] == needle[nIndex] {
                nIndex = needle.index(after: nIndex)
            } else {
                nIndex = needle.startIndex
            }
            
            if nIndex == nEndIndex {
                let startIndex = haystack.index(hIndex, offsetBy: -needle.count)
                result = haystack.distance(from: startIndex, to: hIndex)
                break
            }
            hIndex = haystack.index(after: hIndex)
        }
        return result
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
    
    public func deleteNode(_ head: inout ListNode, target: Int) {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var curNode: ListNode? = head
        var preNode: ListNode? = dummyHead
        while curNode != nil {
            guard let value = curNode?.val else {
                fatalError()
            }
            if value == target {
                preNode?.next = curNode?.next
                curNode?.next = nil
                break;
            }
            preNode = curNode
            curNode = curNode?.next
        }
        if let finalHead = preNode?.next  {
            head = finalHead
        }
        
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
    public func  removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var frontNode = head
        var delNode = head
        var preNode: ListNode? = dummyHead
        var Nth = 0
        while frontNode != nil {
            frontNode = frontNode?.next
            Nth  = Nth + 1
            if Nth > n {
                delNode = delNode?.next
                preNode = preNode?.next
            }
        }
        
        preNode?.next = delNode?.next
        delNode?.next = nil
        
        return dummyHead.next
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
        var pre: ListNode? = nil
        var cur: ListNode? = head
        var nex: ListNode? = head?.next
        while cur != nil {
            cur?.next = pre
            pre = cur
            cur = nex
            nex = nex?.next
        }
        return pre
        
    }
    
    /// 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
    /// 示例：

    /// 输入：1->2->4, 1->3->4
    /// 输出：1->1->2->3->4->4
    public func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
                
        /// k 表示已合并的最后一个节点，k 之前的节点(包括k)，已经按照顺序合并好了
        /// k 初始时，不确定指向哪个节点
        var k: ListNode? = nil
        var head: ListNode? = nil
        var i: ListNode? = l1
        var j: ListNode? = l2
        while i != nil || j != nil {
            if let lVal = i?.val, let rVal = j?.val {
                if lVal <= rVal {
                    if k == nil {
                        head = i
                        k = i
                    } else {
                        k?.next = i
                        k = i
                    }
                    i = i?.next
                } else {
                    if k == nil {
                        head = j
                        k = j
                    } else {
                        k?.next = j
                        k = j
                    }
                    j = j?.next
                }
            } else {
                if i == nil {
                  k?.next = j
                } else {
                    k?.next = j
                }
                break
            }
   
        }
        return head
    }
    
    /// 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
     /// 示例：

     /// 输入：1->2->4, 1->3->4
     /// 输出：1->1->2->3->4->4
    
    public func mergeLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let aL1 = l1,let aL2 = l2 else {
            return l1 != nil ? l1 : l2
        }
        
        var head: ListNode! = nil
        if aL1.val < aL2.val {
            head = aL1
            head.next = mergeLists(aL1.next, aL2)
        } else {
            head = aL2
            head.next = mergeLists(aL1, aL2.next);
        }
        
        return head
    }
    
    
    /// 请判断一个链表是否为回文链表。
    /// 示例 1:
    /// 示例 1:

    /// 输入: 1->2
    /// 输出: false
    /// 示例 2:

    /// 输入: 1->2->2->1
    /// 输出: true
    /// 进阶：
    /// 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
     public func isPalindrome(_ head: ListNode?) -> Bool {
        
        var front: ListNode? = head
        var back: ListNode? = head
        var count = 0
        while front != nil {
            if count == 2 {
                back = back?.next
                count = 0
            }
            front = front?.next
            count = count + 1
        }
        
        var left = head
        var righ =  reverseList(back?.next)
        var result: Bool = righ == nil ? false : true
        while righ != nil {
            guard let lVal = left?.val, let rVal = righ?.val else {
                fatalError()
            }
            
            if lVal != rVal {
                result = false
                break
            }
            left = left?.next
            righ = righ?.next
        }
        
        return result
    }
    
    /// 给定一个链表，判断链表中是否有环。
    /// 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
    /// 示例 1：
    /// 输入：head = [3,2,0,-4], pos = 1
    /// 输出：true
    /// 解释：链表中有一个环，其尾部连接到第二个节点。
    /// 3-->2-->0-->0-->-4
    ///    |__________|
    
    /// 示例 2：
    /// 输入：head = [1,2], pos = 0
    /// 输出：true
    /// 解释：链表中有一个环，其尾部连接到第一个节点。
    ///    1------>2
    ///    |______|
    ///  进阶：
    /// 你能用 O(1)（即，常量）内存解决此问题吗？
    
    public func hasCycle(_ head: ListNode?) -> Bool {
        return false
    }
    
    // MARK: - Basic Tree
    
    /// 给定一个二叉树，找出其最大深度
    /// 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
    /// - Parameter root: 根节点
    /// 说明: 叶子节点是指没有子节点的节点
    /// ```
    /// 给定二叉树 [3,9,20,null,null,15,7]，
    ///        3
    ///       / \
    ///      9  20
    ///        /  \
    ///       15   7
    ///
    /// 返回它的最大深度 3 。
    /// ```
    public func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        
        let leftMaxDepth = maxDepth(node.left)
        let rightMaxDepth = maxDepth(node.right)
        return max(leftMaxDepth, rightMaxDepth) + 1
    }

    /// 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
    /// 假设一个二叉搜索树具有如下特征：
    /// - 节点的左子树只包含小于当前节点的数。
    /// - 节点的右子树只包含大于当前节点的数。
    /// - 所有左子树和右子树自身必须也是二叉搜索树。
    /// - Parameter root: 根节点
    /// ```
    /// 示例 1:
    ///
    /// 输入:
    ///     2
    ///    / \
    ///   1   3
    /// 输出: true
    ///
    ///示例 2:
    ///
    ///输入:
    ///    5
    ///   / \
    ///  1   4
    ///     / \
    ///    3   6
    /// 输出: false
    /// 解释: 输入为: [5,1,4,null,null,3,6]。
    /// 根节点的值为 5 ，但是其右子节点值为 4 。
    /// ```
    public func isValidBST(_ root: TreeNode?) -> Bool {
        guard let node = root else {
            return true
        }
        
        if let left = node.left,
           left.val >= node.val {
           return false
        }
        
        if let right = node.right,
           right.val <= node.val {
            return false
        }
        
        return isValidBST(node.left) && isValidBST(node.right)
    }
    
    
    /// 给定一个二叉树，检查它是否是镜像对称的。
    /// - Parameter root: 根节点
    /// ```
    ///例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
    ///    1
    ///   / \
    ///  2   2
    /// / \ / \
    ///3  4 4  3
    ///
    ///但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
    ///   1
    ///  / \
    /// 2   2
    ///  \   \
    ///  3    3
    ///
    /// ```
    /// - 说明: 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
    public func isSymmetric(_ root: TreeNode?) -> Bool {
		guard let aNode = root else {
			return true
		}

		guard let aLeft = aNode.left,
			  let aRight = aNode.right else {
			return false
		}

		if aLeft.val != aRight.val {
			return false
		}
        return isSymmetric(aLeft, aRight)
    }
    
    private func isSymmetric(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        }
        
        guard let aNode1 = node1 else {
            return false
        }
    
        guard let aNode2 = node2 else {
            return false
        }
    
        if aNode1.val != aNode2.val {
            return false
        }

        return isSymmetric(aNode1.left, aNode2.right) && isSymmetric(aNode1.right, aNode2.left)
    }
    
    /// 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
    /// ```
    /// 例如:
    /// 给定二叉树: [3,9,20,null,null,15,7],
    ///   3
    ///  / \
    /// 9  20
    ///   /  \
    ///  15   7
    ///
    /// 返回其层次遍历结果：
    /// [
    ///  [3],
    ///  [9,20],
    ///  [15,7]
    /// ]
    /// ```
    public func levelOrder(_ root: TreeNode?) -> [[Int]] {
        return []
    }
    
    ///  将有序数组转换为二叉搜索树
    ///  将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
    ///  本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
    /// ```
    /// 示例:
    /// 给定有序数组: [-10,-3,0,5,9],
    /// 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：
    ///
    ///     0
    ///    / \
    ///  -3   9
    ///  /   /
    /// -10  5
    /// ```
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return nil
    }
    
    
    // MARK: - Basic sorted and search
    
    /// 合并两个有序数组
    /// 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
    ///
    /// 说明:
    /// - 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
    /// - 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
    /// ```
    /// 输入:
    /// nums1 = [1,2,3,0,0,0], m = 3
    /// nums2 = [2,5,6],       n = 3
    /// 输出: [1,2,2,3,5,6]
    /// ```
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
    }
    
    /// 你是产品经理，目前正在带领一个团队开发新的产品。不幸的是，你的产品的最新版本没有通过质量检测。由于每个版本都是基于之前的版本开发的，所以错误的版本之后的所有版本都是错的。
    /// 假设你有 n 个版本 [1, 2, ..., n]，你想找出导致之后所有版本出错的第一个错误的版本。
    /// 你可以通过调用 bool isBadVersion(version) 接口来判断版本号 version 是否在单元测试中出错。实现一个函数来查找第一个错误的版本。你应该尽量减少对调用 API 的次数。
    /// 示例:
    /// ```
    /// 给定 n = 5，并且 version = 4 是第一个错误的版本。
    ///
    /// 调用 isBadVersion(3) -> false
    /// 调用 isBadVersion(5) -> true
    /// 调用 isBadVersion(4) -> true

    /// 所以，4 是第一个错误的版本。
    /// ```
    
    // MARK: - Basic Dynamic Programming
    
    /// 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
    /// 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
    /// 注意：给定 n 是一个正整数。
    ///
    /// 示例 1：
    ///  ```
    /// 输入： 2
    /// 输出： 2
    /// 解释： 有两种方法可以爬到楼顶。
    /// 1.  1 阶 + 1 阶
    /// 2.  2 阶
    /// 示例 2：
    /// 输入： 3
    /// 输出： 3
    /// 解释： 有三种方法可以爬到楼顶。
    /// 1.  1 阶 + 1 阶 + 1 阶
    /// 2.  1 阶 + 2 阶
    /// 3.  2 阶 + 1 阶
    
    public func climbStairs(_ n: Int) -> Int {
        return 0
    }
    
    
    /// 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
    /// 如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
    /// 注意你不能在买入股票前卖出股票。
    /// ```
    /// 示例 1:

    /// 输入: [7,1,5,3,6,4]
    /// 输出: 5
    /// 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
    ///     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
    ///
    /// 示例 2:
    ///
    /// 输入: [7,6,4,3,1]
    /// 输出: 0
    /// 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
    /// ```
    
    public func maxProfit_1(_ prices: [Int]) -> Int {
        return 0
    }
    
    /// 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
    ///  ```
    /// 示例:
    /// 输入: [-2,1,-3,4,-1,2,1,-5,4],
    /// 输出: 6
    /// 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
    ///  ```
    public func maxSubArray(_ nums: [Int]) -> Int {
        return 0
    }
    
    /// 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
    /// 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
    /// ```
    /// 示例 1:
    /// 输入: [1,2,3,1]
    /// 输出: 4
    /// 解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
    ///      偷窃到的最高金额 = 1 + 3 = 4 。
    /// 示例 2:
    /// 输入: [2,7,9,3,1]
    /// 输出: 12
    /// 解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
    /// 偷窃到的最高金额 = 2 + 9 + 1 = 12 。
    /// ```
    public func rob(_ nums: [Int]) -> Int {
        return 0
    }
    
    
    // MARK: - Basic mathematics
    
    /// 写一个程序，输出从 1 到 n 数字的字符串表示。
    /// 1. 如果 n 是3的倍数，输出“Fizz”；
    /// 2. 如果 n 是5的倍数，输出“Buzz”；
    /// 3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。
    /// ```
    /// 示例：
    /// n = 15,
    /// 返回:
    /// [
    ///     "1",
    ///     "2",
    ///     "Fizz",
    ///     "4",
    ///     "Buzz",
    ///     "Fizz",
    ///     "7",
    ///     "8",
    ///     "Fizz",
    ///     "Buzz",
    ///     "11",
    ///     "Fizz",
    ///     "13",
    ///     "14",
    ///     "FizzBuzz"
    /// ]
    /// ```
    public func fizzBuzz(_ n: Int) -> [String] {
        return []
    }
    
    /// 统计所有小于非负整数 n 的质数的数量。
    /// ```
    /// 示例:
    /// 输入: 10
    /// 输出: 4
    /// 解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
    /// ```
     public func countPrimes(_ n: Int) -> Int {
        return 0
    }
}


extension Character {
    /// 判断是否是英文字母
    var isEnglishLetter: Bool {
        return (self >= "A" && self <= "Z") ||
               (self >= "a" && self <= "z")
    }
    
    /// 判断是否是数字
    var isDigit: Bool {
        return self >= "0" && self <= "9"
    }
    
    /// 判断 是否是不可见的 ascii 字符
    var isInvisibleASCII: Bool {
        /// 确保是 ascii
        guard let assciiValue = self.asciiValue else {
            return false
        }
        
        return assciiValue >= 0 && assciiValue <= 32 || assciiValue == 127
    }
    
    /// 是否为 '+'
    var isPlusSign: Bool {
        return self == "+"
    }
    
    /// /// 是否为 '-'
    var isMinusSign: Bool {
        return self == "-"
    }
}


// MARK: - Basic Design
extension Solution {
    /// https://leetcode-cn.com/explore/featured/card/top-interview-questions-easy/24/design/58/
    /// 打乱一个没有重复元素的数组。
    /// ```
    /// 示例:

    /// // 以数字集合 1, 2 和 3 初始化数组。
    /// int[] nums = {1,2,3};
    /// Solution solution = new Solution(nums);

    // 打乱数组 [1,2,3] 并返回结果。任何 [1,2,3]的排列返回的概率应该相同。
    /// solution.shuffle();

    // 重设数组到它的初始状态[1,2,3]。
    /// solution.reset();

    // 随机返回数组[1,2,3]打乱后的结果。
    /// solution.shuffle();
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return []
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        return []
    }
}

/// 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

/// push(x) -- 将元素 x 推入栈中。
/// pop() -- 删除栈顶的元素。
/// top() -- 获取栈顶元素。
/// getMin() -- 检索栈中的最小元素。
///
/// ```
/// 示例:
///
/// MinStack minStack = new MinStack();
/// minStack.push(-2);
/// minStack.push(0);
/// minStack.push(-3);
/// minStack.getMin();   --> 返回 -3.
/// minStack.pop();
/// minStack.top();      --> 返回 0.
/// minStack.getMin();   --> 返回 -2.
/// ```

class MinStack {

    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        
    }
    
    func pop() {
        
    }
    
    func top() -> Int {
        return 0
    }
    
    func getMin() -> Int {
        return 0
    }
}
