import XCTest
@testable import RCLog

final class RCLogTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RCLog().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
