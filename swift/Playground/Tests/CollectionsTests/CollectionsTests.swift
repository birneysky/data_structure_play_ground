import XCTest
import Collections

final class CollectionsTests: XCTestCase {
    
    // MARK: - MaxHeap
    func testMaxHeapInsert() {
        let array = [8,9,10,2,4,5,6,3,21,100]
        print("\t input->array:\(array)")
        let heap = MaxHeap<Int>()
        for item in array {
            heap.insert(element: item)
        }
        print("\t output->heap:\(heap),size:\(heap.size())")
    }

    
    func testMaxHeapExtractMax() /*throws*/ {
        
        let array = [8,9,10,2,4,5,6,3,21,100]
        let heap = MaxHeap<Int>()
        for item in array {
            heap.insert(element: item)
        }
        print("\t input->heap:\(heap),size:\(heap.size())")
        for _ in 0...heap.size() {
            guard let max = heap.extractMax()  else {
                print("heap is empty:\(heap.isEmpty())")
                //throw NSError()
                return
            }
            print("\t max:\(max), heap:\(heap),size:\(heap.size())")
        }
    }
    
    func testMaxHeapHeapify() {
        let array = [8,9,10,2,4,5,6,3,21,100]
        print("\t input->array:\(array)")
        let heap = MaxHeap<Int>(array: array)
        print("\t output->heap:\(heap),size:\(heap.size())")
    }
    
    // MARK: - CStack
    func testCStack() {
        let stack = CStack<Int>()
        let array = [8,9,10,2,4,5,6,3,21,100]
        for item in array {
            stack.push(element: item)
        }

    }
    // MARK: - Buffer Array
    func testBufferArray_insert() {
        let array = BufferArray<Int>(capacity: 3)
        array.insert(1, at: 0)
        array.insert(2, at: 1)
        array.insert(3, at: 2)
        print(array)
    }
 
    func testBufferArray_append() {
        let array = BufferArray<Int>(capacity: 20)
        for i in 0...10 {
            array.append(i)
        }
        print(array)
        
        array.insert(100, at: 1)
        print(array)
    }
    
    func testBufferArray_subscript() {
        let array = BufferArray<Int>(capacity: 20)
        for i in 0...10 {
            array.append(i)
        }
        print(array)
        array.insert(100, at: 1)
        print(array[1])
        
        array[2] = 200
        print(array)
    }
    
    func testBufferArray_append_no_limit_capacity() {
        let array = BufferArray<Int>()
        for i in 0 ... 9 {
            array.append(i)
        }
        print(array)
        
        array.insert(100, at: 1)
        array.insert(-1, at: 0)
        print(array)
  
        array.removeLast()
        array.removeLast()
        array.remove(at: 0)
        
//        _ = array.removeLast()
//        _ = array.removeLast()
//        _ = array.remove(at: 0)
        print(array)
        
        
        var a  = [3,4,5,6]
        a.removeLast()
        print(a)
    }

}
