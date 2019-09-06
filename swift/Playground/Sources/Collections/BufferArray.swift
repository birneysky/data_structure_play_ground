//
//  BufferArray.swift
//  Collections
//
//  Created by birneysky on 2019/9/6.
//

import Foundation

public class BufferArray {
    fileprivate var _buffer: UnsafeMutablePointer<Int>
    fileprivate var _capacity: Int
    fileprivate var _size: Int
    fileprivate static let defaultCapacity = 10
    
    public var isEmpty: Bool  {
        return _size == 0
    }
    
    public var capacity: Int {
        return _capacity
    }
    
    public init(capacity c: Int) {
        _capacity = c
        _size = 0
        _buffer = UnsafeMutablePointer<Int>.allocate(capacity: c)
        _buffer.initialize(to: 0)
    }
    
    public convenience init() {
        self.init(capacity: BufferArray.defaultCapacity)
    }
    
    public func insert(_ element: Int, at index: Int) {
        guard _size < _capacity else {
            fatalError("AddLast failed. Array is full.")
        }
        
    }
    
    public func append(_ element: Int) {
        
    }
    
    
    public func addLast(e: Int) {
        guard _size < _capacity else {
            fatalError("AddLast failed. Array is full.")
        }
        _buffer[_size] = e
        _size = _size + 1
    }
    
}
