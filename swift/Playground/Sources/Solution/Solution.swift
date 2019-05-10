import Foundation

open class Solution {
    public init() {}

    
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
    
    

}
