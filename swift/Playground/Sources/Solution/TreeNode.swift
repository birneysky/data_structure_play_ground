//
//  TreeNode.swift
//  Collections
//
//  Created by birneysky on 2019/8/30.
//

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
