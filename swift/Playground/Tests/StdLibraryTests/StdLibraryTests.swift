import XCTest
import Foundation

final class StdLibraryTests: XCTestCase {

    // MARK: - c atoi
    func test_c_atoi() {
        let t1 = atoi("1234")
        XCTAssertEqual(t1, 1234)
        
        let t2 = atoi("        1234")
        XCTAssertEqual(t2, 1234)
        
        let t3 = atoi("\t        1234 abc")
        XCTAssertEqual(t3, 1234)
        
        /// 转化失败时，全局变量 errno 被置为 EINVAL
        let t4 = atoi("abc 1234")
        XCTAssertEqual(t4, 0)
        XCTAssertEqual(errno, EINVAL)
        
        let t6 = atoi("+1234bac")
        XCTAssertEqual(t6, 1234)
        
        let t7 = atoi("+1234b234")
        XCTAssertEqual(t7, 1234)
        
        let t8 = atoi("- 1234bac")
        XCTAssertEqual(t8, 0)
        XCTAssertEqual(errno, EINVAL)
        
        let t9 = atoi("-1+234bac")
        XCTAssertEqual(t9, -1)
    }
    
    // MARK: - String
    func test_swift_string_indices() {
        /// 遍历字符串
        let stra = "flower"
        for index in stra.indices {
            print("\(stra[index]) ",terminator:"")
        }
        print()
        
//        for index in stra.startIndex..<stra.endIndex {
//            print("\(stra[index]) ",terminator:"")
//        }
//        print()
    }
    
    func test_swift_string_index() {
        let stra = "flower"
        let first = stra.startIndex
        let last = stra.endIndex
        let dis = stra.distance(from: first, to: last)
        print(dis)
    }
    
    func test_c_string() {
        let stra = 0x41
        print(stra)
    }
    
    func test_swift_multiline_string() {
        let banner = """
          __,
         (           o  /) _/_
          `.  , , , ,  //  /
        (___)(_(_/_(_ //_ (__
                     /)
                    (/
        """
        
        print(banner)
    }
    
    func test_swift_string_index_position() {
        let stra = "abc"
        let first = stra.startIndex
        //let last = stra.endIndex
        print("test_swift_string_index_position first character:\(stra[first])")
        //print("test_swift_string_index_position last character:\(stra[last])")
    }
    
    func test_swift_string_unicode_represtation() {
        let cafe = "Cafe\u{301} du 🌍"
        print("cafe:\(cafe), count:\(cafe.count)")
        print("arrayCafe:\(Array(cafe))")
        
        print("cafe.unicodeScalars.count:\(cafe.unicodeScalars.count)")
        print("cafe.unicodeScalars.Array:\(Array(cafe.unicodeScalars))")
        print("cafe value array:\(cafe.unicodeScalars.map { $0.value })")
    }
    
    
    func test_swift_string_retrieve_first_world() {
        let name = "Marie Curie"
        let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
        let firstName = name[..<firstSpace]
        let lastName = name[firstSpace..<name.endIndex]
        print("fistName:\(firstName)")
        print("lastName:\(lastName)")
    }

    // MARK: - Optional
    func test_option(){
        struct Person {
            var name: String?
            var sex: Bool
            init?(name: String?, sex: Bool) {
                guard let name = name else {
                    return nil
                }
                self.name = name
                self.sex = sex
            }
        }
        
        let p = Person(name: nil, sex: true)
        let name = p?.name
        let sex = p?.sex
        if let ap = p {
            print("p:\(ap)")
        }
        print("x:\(name ?? "no name")")
        print("x:\(sex ?? false)")
    }
    
    
    // MARK: - for in stride
    func test_for_stride_through() {
        for i in stride(from: 10, through: 3, by: -1)  {
            print("stride index:\(i)")
        }
    }
    
    func test_for_stide_to() {
        for i in stride(from: 10, to: 3, by: -1) {
            print("stride index:\(i)")
        }
    }
   
    // MARK: - UnsafeMutablePointer
    func test_UnsafeMutablePointer() {
        let buffer = UnsafeMutablePointer<Int>.allocate(capacity: 10)
        //buffer.initialize(to: 0)
        buffer.initialize(repeating: 0, count: 10)
        buffer[9] = 10
        for i in 0..<10 {
            print("unsafe mutable pointer buffer[\(i)]:\(buffer[i])")
        }
        buffer.deinitialize(count: 10)
        buffer.deallocate()
    }
    
    func test_UnsafeMutablePointer_copy() {
        let buffer = UnsafeMutablePointer<Int>.allocate(capacity: 10)
        let bcopy = buffer
        //buffer.initialize(to: 0)
        buffer.initialize(repeating: 0, count: 10)
        buffer[9] = 10
        for i in 0..<10 {
            print("unsafe mutable pointer buffer[\(i)]:\(buffer[i])")
        }

//        buffer.deinitialize(count: 10)
//        buffer.deallocate()
        
        for i in 0..<10 {
            print("unsafe mutable pointer bcopy[\(i)]:\(bcopy[i])")
        }
        
        bcopy.deinitialize(count: 10)
        bcopy.deallocate()
    }
    
    func test_UnsafeMutablePointer_copy_reinit() {
        let buffer = UnsafeMutablePointer<Int>.allocate(capacity: 10)
        let bcopy = buffer
        //buffer.initialize(to: 0)
        buffer.initialize(repeating: 0, count: 10)
        buffer[9] = 10
        for i in 0..<10 {
            print("unsafe mutable pointer buffer[\(i)]:\(buffer[i])")
        }
        buffer.deinitialize(count: 10)
        buffer.deallocate()
        
        bcopy.initialize(repeating: 1000, count: 10)

        for i in 0..<10 {
            print("unsafe mutable pointer bcopy[\(i)]:\(bcopy[i])")
        }
    }
    
    func test_UnsafeMutablePointer_copy_reinit_2() {
            let buffer = UnsafeMutablePointer<Int>.allocate(capacity: 10)
            let bcopy = buffer
            //buffer.initialize(to: 0)
            buffer.initialize(repeating: 0, count: 10)
            buffer[9] = 10
            for i in 0..<10 {
                print("unsafe mutable pointer buffer[\(i)]:\(buffer[i])")
            }
            buffer.deinitialize(count: 10)
            buffer.deallocate()
            
            for i in 0 ..< 10 {
                bcopy[i] = i
            }
            /// dangerous   it's likely to crash
            for i in 0..<10 {
                print("unsafe mutable pointer bcopy[\(i)]:\(bcopy[i])")
            }
        }
}
