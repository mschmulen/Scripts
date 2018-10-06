import XCTest

import gqueryTests

var tests = [XCTestCaseEntry]()
tests += gqueryTests.allTests()
XCTMain(tests)