//
//  ListNode.swift
//  Collections
//
//  Created by birneysky on 2019/8/30.
//

public class ListNode{
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init?(_ values:[Int]) {
        guard !values.isEmpty else {
            return nil
        }
        
        self.val = values[0]
        self.next = nil
        
        var cur: ListNode? = self
        for i in 1..<values.count  {
            cur?.next = ListNode(values[i])
            cur = cur?.next
        }
    }
}

// MARK: - Debug
extension ListNode: CustomStringConvertible {
    public var description: String {
        var cur: ListNode? = self
        var des: String = String()
        while let aCur = cur {
            des.append("\(aCur.val)-->")
            cur = cur?.next
        }
        des.append("Null")
        return des
    }
}
