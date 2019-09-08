//
//  BufferArray.swift
//  Collections
//
//  Created by birneysky on 2019/9/6.
//

import Foundation

public class BufferArray: CustomStringConvertible {
    fileprivate var _buffer: UnsafeMutablePointer<Int>
    fileprivate var _capacity: Int
    fileprivate var _size: Int
    fileprivate static let defaultCapacity = 10
    
    // MARK: - Creating an Array
    public init(capacity c: Int) {
        _capacity = c
        _size = 0
        _buffer = UnsafeMutablePointer<Int>.allocate(capacity: c)
        _buffer.initialize(repeating: 0, count: c)
    }
    
    public convenience init() {
        self.init(capacity: BufferArray.defaultCapacity)
    }
    
    deinit {
        _buffer.deinitialize(count: _capacity)
        _buffer.deallocate()
    }
    
    // MARK: - Debug
    public var description: String {
        var des = String("Array: size = \(_size), capacity = \(_capacity) \n")
        des.append("[")
        for i in 0 ..< _size {
            des.append("\(_buffer[i])")
            if i != _size - 1 {
                des.append(",")
            }
        }
        des.append("]")
        return des
    }
    
    // MARK: - Inspecting an Array
    public var isEmpty: Bool  {
        return _size == 0
    }
    
    public var capacity: Int {
        return _capacity
    }

    
    // MARK: - Adding elements
    public func insert(_ element: Int, at index: Int) {
        guard _size < _capacity else {
            fatalError("AddLast failed. Array is full.")
        }
        
        guard index >= 0 && index <= _size else {
            fatalError("AddLast failed. Require index >=0 and index <= _size .")
        }
        
        for i in stride(from: _size - 1, through: index, by: -1) {
            _buffer[i + 1] = _buffer[i]
        }
        
        _buffer[index] = element
        _size = _size + 1
    }
    
    public func append(_ element: Int) {
        insert(element, at: _size)
    }

    // MARK: - Accessing elements
    public subscript(index: Int) -> Int {
        get {
            guard index >= 0 && index < _size else {
                fatalError("Get failed, index is illegal")
            }
            
            return _buffer[index]
        }
        
        set {
            guard index >= 0 && index < _size else {
                fatalError("Get failed, index is illegal")
            }
            
            _buffer[index] = newValue
        }

    }
}
