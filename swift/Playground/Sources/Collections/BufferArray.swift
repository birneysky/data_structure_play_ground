//
//  BufferArray.swift
//  Collections
//
//  Created by birneysky on 2019/9/6.
//

import Foundation

public class BufferArray<Element: Comparable>: CustomStringConvertible {
    fileprivate var _buffer: UnsafeMutablePointer<Element>
    fileprivate var _capacity: Int
    fileprivate var _size: Int

    fileprivate static var defaultCapacity: Int {
        return 10
    }
    
    fileprivate func resize(_ newCapacity: Int) {
        let bufferCopy = _buffer
        _buffer = UnsafeMutablePointer<Element>.allocate(capacity: newCapacity)
        for i in 0 ..< _size {
            _buffer[i] = bufferCopy[i]
        }
        bufferCopy.deinitialize(count: _capacity)
        bufferCopy.deallocate()
        _capacity = newCapacity
    }
    
    // MARK: - Creating an Array
    public init(capacity c: Int) {
        _capacity = c
        _size = 0
        _buffer = UnsafeMutablePointer<Element>.allocate(capacity: c)
        //_buffer.initialize(repeating: E(), count: c)
    }
    
    public convenience init() {
        self.init(capacity: BufferArray<Element>.defaultCapacity)
    }
    
    init(repeating repeatedValue: Element, count: Int) {
        _capacity = count + 1
        _size = 0
        _buffer = UnsafeMutablePointer<Element>.allocate(capacity: count)
        _buffer.initialize(repeating: repeatedValue, count: count)
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
    public func insert(_ element: Element, at index: Int) {
        
        guard index >= 0 && index <= _size else {
            fatalError("AddLast failed. Require index >=0 and index <= _size .")
        }
        
        if _size == _capacity {
            resize( 2 * _size)
        }
        
        for i in stride(from: _size - 1, through: index, by: -1) {
            _buffer[i + 1] = _buffer[i]
        }
        
        _buffer[index] = element
        _size = _size + 1
    }
    
    public func append(_ element: Element) {
        insert(element, at: _size)
    }
    
    // MARK: - Removing Elements
    @discardableResult 
    public func remove(at index: Int) -> Element {
        guard index >= 0 && index < _size else {
            fatalError("remove failed, index is illegal")
        }
        
        let result = _buffer[index]
        for i in index + 1 ..< _size {
            _buffer[i - 1] = _buffer[i]
        }
        _size = _size - 1
        
        if _size == _capacity / 4 && _capacity / 2 != 0 {
            resize(_capacity / 2)
        }
        return result
    }
    
    @discardableResult
    public func removeFirst() -> Element {
        return remove(at: 0)
    }
    
    @discardableResult 
    public func removeLast() -> Element {
        return remove(at: _size - 1)
    }

    // MARK: - Accessing elements
    public subscript(index: Int) -> Element {
        get {
            guard index >= 0 && index < _size else {
                fatalError("Get failed, index is illegal")
            }
            
            return _buffer[index]
        }
        
        set {
            guard index >= 0 && index < _size else {
                fatalError("Set failed, index is illegal")
            }
            
            _buffer[index] = newValue
        }

    }
    
    // MARK: - Finding Elements
    public func contains(element: Element) -> Bool {
        for i in 0 ..< _size {
            if element == _buffer[i] {
                return true
            }
        }
        return false
    }
    
    public func firstIndex(of element: Element) -> Int? {
        for i in 0 ..< _size {
            if element == _buffer[i] {
                return i
            }
        }
        return nil
    }
    
    
}
