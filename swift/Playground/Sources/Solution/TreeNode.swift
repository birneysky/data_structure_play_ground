//
//  TreeNode.swift
//  Collections
//
//  Created by birneysky on 2019/8/30.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


extension TreeNode {
    public static  func createTree(with array: [Int?], from index: Int) -> TreeNode? {
        guard index < array.count else {
            return nil
        }
        
        guard let value = array[index] else {
            return nil
        }
        
        let node = TreeNode(value)
        node.left = createTree(with: array, from: 2 * index + 1)
        node.right = createTree(with: array, from: 2 * index + 2)
        
        return node
    }
}

// MARK: - Debug
extension TreeNode: CustomStringConvertible {
    public static func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        
        let leftMaxDepth = maxDepth(node.left)
        let rightMaxDepth = maxDepth(node.right)
        
        return max(leftMaxDepth, rightMaxDepth) + 1
    }
    
    private static func convert(_ root: TreeNode?,
                                curLevel: Int,
                                maxDepth: Int,
                                to array: inout [[Int?]]) {
        if curLevel == maxDepth {
            return
        }
        
        if curLevel >= array.count {
            array.append([Int?]())
        }
        
        if let node = root {
            array[curLevel].append(node.val)
            convert(node.left, curLevel: curLevel + 1, maxDepth: maxDepth, to: &array)
            convert(node.right, curLevel: curLevel + 1, maxDepth: maxDepth, to: &array)
        } else {
             array[curLevel].append(nil)
             convert(nil, curLevel: curLevel + 1, maxDepth: maxDepth, to: &array)
             convert(nil, curLevel: curLevel + 1, maxDepth: maxDepth, to: &array)
        }
    }
    
    public var description: String {
        var array = [[Int?]]()
        let maxDepath = TreeNode.maxDepth(self)
        TreeNode.convert(self, curLevel: 0, maxDepth: maxDepath, to: &array)
        var desc = String()
        for each in array {
            for item in each {
                if let aItem = item {
                    desc.append("\(aItem) ")
                } else {
                    desc.append("∅ ")
                }
            }
            desc.append("\n")
        }
        return desc
    }
}
