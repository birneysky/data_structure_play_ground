import XCTest
import Collections

final class CollectionsTests: XCTestCase {
    
    func testMaxHeapInsert() {
        let array = [8,9,10,2,4,5,6,3,21,100]
        print("\t input->array:\(array)")
        let heap = MaxHeap<Int>()
        for item in array {
            heap.insert(element: item)
        }
        print("\t output->heap:\(heap),size:\(heap.size())")
    }

    
    func testMaxHeapExtractMax() throws {
        
        let array = [8,9,10,2,4,5,6,3,21,100]
        let heap = MaxHeap<Int>()
        for item in array {
            heap.insert(element: item)
        }
        print("\t input->heap:\(heap),size:\(heap.size())")
        for _ in 0...heap.size() {
            guard let max = heap.extractMax()  else {
                print("heap is empty:\(heap.isEmpty())")
                throw NSError()
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
    
    
    func testStack() {
        let stack = Stack<Int>()
        let array = [8,9,10,2,4,5,6,3,21,100]
        for item in array {
            stack.push(element: item)
        }

    }
 
    

}
