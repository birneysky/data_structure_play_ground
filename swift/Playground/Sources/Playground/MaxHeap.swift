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

	func extractMax() -> T? {
		guard count > 0 else {
			return nil
		}

		let ret = data[1]
		data.swapAt(1,count)
		data.removeLast()
		count = count - 1
		shiftDown(1)
		return ret
	}

    private func shiftUp(_ k: Int) {
        var kIndex = k
        while kIndex > 1 && data[kIndex/2] < data[kIndex] {
            data.swapAt(kIndex,kIndex/2)
            kIndex = kIndex/2
        }
    }


	private func shiftDown(_ k: Int) {
		var kIndex = k
		/// 先保证 索引 k 的节点有左子树
		while  2 * kIndex <= count {
			var j = 2 * kIndex
			/// 先使用 j 记录左孩子的索引，那么 j + 1就表示右孩子，如果节点 kIndex 有右孩子并且大于左孩子，让j 记录右孩子的索引
			if   j + 1 <=  count && data[j] < data[j+1] {
				j = j + 1
			}
			
			/// 到这里 j 这个索引记录了左右孩子值较大的那个节点的索引
			if data[kIndex] >=  data[j] {
				break
			}
			data.swapAt(kIndex,j)
			kIndex = j
		}
	}

    // MARK: - CustomStringConvertible
    var description: String {
        if count == 0 {
            return "[]"
        } else {
            return data[1...count].description    
        }
    }
    
}
