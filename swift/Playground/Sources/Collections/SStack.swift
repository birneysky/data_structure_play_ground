//
//  SStack.swift
//  Collections
//
//  Created by birneysky on 2019/10/4.
//

protocol Stack {
    /// 元素类型
    associatedtype Element

    /// 是否为空
    var isEmpty: Bool { get }
    
    /// 栈的大小
    var size: Int { get }
    
    ///栈顶元素
    var peek: Element? { get }

    /// 入栈
    mutating func push(_ newElement: Element)
    
    /// 出栈
    mutating func pop() -> Element?
}


struct SStack<T>: Stack {
    typealias Element = T

    private var data = [Element]()
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    var size: Int {
        return data.count
    }
    
    var peek: T? {
        return data.last
    }
    
    mutating func push(_ newElement: T) {
        data.append(newElement)
    }
    
    mutating func pop() -> T? {
        data.popLast()
    }
    
}
