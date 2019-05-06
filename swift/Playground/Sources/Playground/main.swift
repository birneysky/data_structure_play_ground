import Foundation

if CommandLine.arguments.count != 2 {
	print("Usage: hello NAME")
} else {
	let name = CommandLine.arguments[1]
    print(name)
}

let heap = MaxHeap<Int>()
let array = [8,9,10,2,4,5,6,3,21,100]
for item in array {
    heap.insert(element: item)
}
print("heap:\(heap),size:\(heap.size())")

for _ in 0...8 {
	guard let max = heap.extractMax()  else {
		print("heap is empty:\(heap.isEmpty())")
		throw NSError()
	}
	print("max:\(max), heap:\(heap),size:\(heap.size())")
}

let heap2 = MaxHeap<Int>()
let array2 = [3,4,2]
for item in array2 {
	heap2.insert(element: item)
}

print("heap2:\(heap2),size:\(heap2.size())")
for _ in 0..<heap2.size() {
	guard let max = heap2.extractMax() else {
		throw NSError()
	}
	print("max:\(max), heap2:\(heap2)")
}

let stack = Stack<Int>()
for item in array {
    stack.push(element: item)
}
