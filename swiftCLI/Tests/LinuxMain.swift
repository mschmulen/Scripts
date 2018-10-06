import XCTest

import swiftCLITests

var tests = [XCTestCaseEntry]()
tests += swiftCLITests.allTests()
XCTMain(tests)