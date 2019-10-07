//
//  SQueue.swift
//  Collections
//
//  Created by birneysky on 2019/10/4.
//


protocol Queue {
    /// 元素类型
    associatedtype Element
    
    /// 是否为空
    var isEmpty: Bool { get }
    /// 队列大小
    var size: Int { get }
    
    /// 查看队首元素
    func peek() -> Element?
    
    /// 入队
    mutating func enqueue(_ newElement: Element)
    
    /// 出队
    mutating func dequeue() -> Element?
}


struct SQueue<T> : Queue {
    typealias Element = T
    
    private var left = [Element]()
    private var right = [Element]()
    
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    var size: Int {
        return left.count + right.count
    }
    
    func peek() -> T? {
        return left.isEmpty ? right.first : left.last
    }
    
    mutating func enqueue(_ newElement: T) {
        right.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
    
    
}
