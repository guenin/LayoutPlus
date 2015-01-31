//
//  assertions.swift
//  Layout+ Tests
//

import XCTest

#if os(iOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

// verbose assertions for checking NSLayoutConstraints

func assertFixedConstraint(constraint: NSLayoutConstraint, expectedItem item: TestView, expectedAttribute attribute: NSLayoutAttribute, expectedRelation relation: NSLayoutRelation, expectedConstant constant: CGFloat, file: String = __FILE__, line: UInt = __LINE__) {
  
  XCTAssertEqual(constraint.firstItem as TestView, item, "Constraint should have correct firstItem", file: file, line: line)
  XCTAssertEqual(constraint.firstAttribute, attribute, "Constraint should have correct attribute",   file: file, line: line)
  
  XCTAssertEqual(constraint.relation, relation,        "Constraint should have correct relation",    file: file, line: line)
  
  XCTAssertNil(constraint.secondItem,                  "Constraint should have nil secondItem",      file: file, line: line)
  XCTAssertEqual(constraint.secondAttribute,
    NSLayoutAttribute.NotAnAttribute,                  "Constraint should have secondAttribute set to NotAnAttribute", file: file, line: line)
  
  XCTAssertEqual(constraint.multiplier, CGFloat(1.0),  "Constraint should have a multiplier of 1.0", file: file, line: line)
  XCTAssertEqual(constraint.constant, constant,        "Constraint should have correct constant",    file: file, line: line)
}

func assertConstraint(constraint: NSLayoutConstraint, expectedItem firstItem: TestView, expectedAttribute firstAttribute: NSLayoutAttribute, expectToRelateBy relation: NSLayoutRelation, toExpectedItem secondItem: TestView, expectedAttribute secondAttribute: NSLayoutAttribute, expectedMultiplier multiplier: CGFloat = 1.0, expectedConstant constant: CGFloat = 0.0, file: String = __FILE__, line: UInt = __LINE__) {
  
  XCTAssertEqual(constraint.firstItem as TestView, firstItem,   "Constraint should have correct firstItem",       file: file, line: line)
  XCTAssertEqual(constraint.firstAttribute, firstAttribute,     "Constraint should have correct firstAttribute",  file: file, line: line)
  
  XCTAssertEqual(constraint.relation, relation,                 "Constraint should have correct relation",        file: file, line: line)
  
  XCTAssertNotNil(constraint.secondItem,                        "Constraint should have non-nil secondItem",      file: file, line: line)
  XCTAssertEqual(constraint.secondItem as TestView, secondItem, "Constraint should have correct secondItem",      file: file, line: line)
  XCTAssertEqual(constraint.secondAttribute, secondAttribute,   "Constraint should have correct secondAttribute", file: file, line: line)
  
  XCTAssertEqual(constraint.multiplier, multiplier,             "Constraint should have a correct multiplier",    file: file, line: line)
  XCTAssertEqual(constraint.constant, constant,                 "Constraint should have correct constant",        file: file, line: line)
}
