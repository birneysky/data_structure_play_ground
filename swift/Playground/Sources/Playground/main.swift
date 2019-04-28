

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

print(heap)
