import XCTest

import auditTests

var tests = [XCTestCaseEntry]()
tests += auditTests.allTests()
XCTMain(tests)