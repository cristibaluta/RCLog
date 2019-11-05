import XCTest
@testable import RCLog

final class RCLogTests: XCTestCase {
    func testExample() {
        XCTAssertNotNil(RCLog("text"))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
