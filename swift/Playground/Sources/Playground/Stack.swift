class Stack<T> {
    var data: [T]
    var isEmpty: Bool {
        return data.isEmpty
    }

    init() {
        data = [T]()
    }

    func push(element: T) {
        data.append(element)
    }

    func pop() -> T? {
        if(!isEmpty) {
            return data.removeLast()
        } else {
            return nil
        }
    }

    func peek() -> T? {
        return data.last
    }
}
