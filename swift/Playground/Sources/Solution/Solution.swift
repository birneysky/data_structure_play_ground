import Foundation

public class Solution {
    public init() {}

    // MARK: - Basic
    
    /// 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
    /// 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
    /// eg1:
    ///     给定数组 nums = [1,1,2],
    ///     函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
    ///     你不需要考虑数组中超出新长度后面的元素。
    /// eg2:
    ///     给定 nums = [0,0,1,1,1,2,2,3,3,4],
    ///     函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
    ///     你不需要考虑数组中超出新长度后面的元素。
    ///
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
    ///
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
    /// eg1:
    ///     输入: [1,2,3,1]
    ///     输出: true
    /// eg2:
    ///     输入: [1,2,3,4]
    ///     输出: false
    /// eg3:
    ///     输入: [1,1,1,3,3,4,3,2,4,2]
    ///     输出: true
    ///
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
}
