
open class CStack<T> {
    private var data: [T]
    open  var isEmpty: Bool {
        return data.isEmpty
    }

    public init() {
        data = [T]()
    }

    public func push(element: T) {
        data.append(element)
    }

    public func pop() -> T? {
        if(!isEmpty) {
            return data.removeLast()
        } else {
            return nil
        }
    }

    public func peek() -> T? {
        return data.last
    }
}


