print("Hello, world!")

  public func sayHello(_ name: String) {
       print("Hello, \(name) !")
  }


if CommandLine.arguments.count != 2 {
	print("Usage: hello NAME")
} else {
	let name = CommandLine.arguments[1]
	sayHello( name)
}