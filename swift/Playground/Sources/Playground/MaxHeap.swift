import Foundation

class MaxHeap<T: Comparable>: CustomStringConvertible {

    private var data: [T] = []
    private var count: Int = 0

    func size() -> Int {
        return count
    }

    func isEmpty() -> Bool {
        return count == 0
    }

    func insert(element: T) {
        if data.count == 0 {
            data.append(contentsOf: [element,element])
        } else {
            data.append(element)
        }
        count = count + 1
        shiftUp(count)
    }

    private func shiftUp(_ k: Int) {
        var kIndex = k
        while kIndex > 1 && data[kIndex/2] < data[kIndex] {
            data.swapAt(kIndex,kIndex/2)
            kIndex = kIndex/2
        }
    }


    // MARK: - CustomStringConvertible
    var description: String {
        if count <= 1 {
            return "[]"
        } else {
            return data[1...count].description    
        }
    }
    

}
