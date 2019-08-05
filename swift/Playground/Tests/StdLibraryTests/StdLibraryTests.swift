import XCTest
import Foundation

final class StdLibraryTests: XCTestCase {

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
    
    func test_swift_string_index_position() {
        let stra = "abc"
        let first = stra.startIndex
        let last = stra.endIndex
        print("test_swift_string_index_position first character:\(stra[first])")
        print("test_swift_string_index_position last character:\(stra[last])")
    }
}
