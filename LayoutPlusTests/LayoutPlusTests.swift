//
//  LayoutPlusTests.swift
//  Layout+ Tests
//

import XCTest
import LayoutPlus

class LayoutPlusTests: XCTestCase {
  
  let leftView = TestView()
  let rightView = TestView()
  let float: CGFloat = 2.0
  
  //MARK:- view compared to CGFloat
  
  func testAttributeEqualsFloatConstraint() {
    assertFixedConstraint(leftView.layout.height == float,
      expectedItem:      leftView,
      expectedAttribute: .Height,
      expectedRelation:  .Equal,
      expectedConstant:  float)
  }
  
  func testFloatEqualsAttributeConstraint() {
    assertFixedConstraint(float == rightView.layout.width,
      expectedItem:      rightView,
      expectedAttribute: .Width,
      expectedRelation:  .Equal,
      expectedConstant:  float)
  }
  
  func testAttributeGreaterThanOrEqualsFloatConstraint() {
    let c = leftView.layout.height >= float
    
    assertFixedConstraint(leftView.layout.height >= float,
      expectedItem:      leftView,
      expectedAttribute: .Height,
      expectedRelation:  .GreaterThanOrEqual,
      expectedConstant:  float)
  }
  
  func testFloatGreaterThanOrEqualsAttributeConstraint() {
    assertFixedConstraint(float >= rightView.layout.width,
      expectedItem:      rightView,
      expectedAttribute: .Width,
      expectedRelation:  .LessThanOrEqual,
      expectedConstant:  float)
  }
  
  func testAttributeLessThanOrEqualsFloatConstraint() {
    assertFixedConstraint(leftView.layout.height <= float,
      expectedItem:      leftView,
      expectedAttribute: .Height,
      expectedRelation:  .LessThanOrEqual,
      expectedConstant:  float)
  }
  
  func testFloatLessThanOrEqualsAttributeConstraint() {
    assertFixedConstraint(float <= rightView.layout.width,
      expectedItem:      rightView,
      expectedAttribute: .Width,
      expectedRelation:  .GreaterThanOrEqual,
      expectedConstant:  float)
  }
  
  //MARK:- view compared to view
  
  func testAttributeEqualsAttribute() {
    assertConstraint(leftView.layout.height == rightView.layout.width,
      expectedItem:      leftView,
      expectedAttribute: .Height,
      expectToRelateBy:  .Equal,
      toExpectedItem:    rightView,
      expectedAttribute: .Width)
  }
  
  func testAttributeGreaterThanOrEqualsAttribute() {
    assertConstraint(leftView.layout.height >= rightView.layout.width,
      expectedItem:      leftView,
      expectedAttribute: .Height,
      expectToRelateBy:  .GreaterThanOrEqual,
      toExpectedItem:    rightView,
      expectedAttribute: .Width)
  }
  
  func testAttributeLessThanOrEqualsAttribute() {
    assertConstraint(leftView.layout.height <= rightView.layout.width,
      expectedItem:      leftView,
      expectedAttribute: .Height,
      expectToRelateBy:  .LessThanOrEqual,
      toExpectedItem:    rightView,
      expectedAttribute: .Width)
  }
  
  //MARK: view compared to view with addition
  
  func testAttributeEqualsAttributePlusFloat() {
    assertConstraint(leftView.layout.left == rightView.layout.right + float,
      expectedItem:      leftView,
      expectedAttribute: .Left,
      expectToRelateBy:  .Equal,
      toExpectedItem:    rightView,
      expectedAttribute: .Right,
      expectedConstant:  float)
  }
  
  func testAttributePlusFloatEqualsAttribute() {
    assertConstraint(leftView.layout.left + float == rightView.layout.right,
      expectedItem:      leftView,
      expectedAttribute: .Left,
      expectToRelateBy:  .Equal,
      toExpectedItem:    rightView,
      expectedAttribute: .Right,
      expectedConstant:  -1 * float)
  }
  
  func testAttributePlusFloatEqualsFloatPlusAttributePlusFloat() {
    assertConstraint(leftView.layout.left + float == float + rightView.layout.right + float,
      expectedItem:      leftView,
      expectedAttribute: .Left,
      expectToRelateBy:  .Equal,
      toExpectedItem:    rightView,
      expectedAttribute: .Right,
      expectedConstant:  float)
  }
  
  //MARK:- view compared to view with subtraction
  
  func testAttributeEqualsAttributeMinusFloat() {
    assertConstraint(leftView.layout.left == rightView.layout.right - float,
      expectedItem:      leftView,
      expectedAttribute: .Left,
      expectToRelateBy:  .Equal,
      toExpectedItem:    rightView,
      expectedAttribute: .Right,
      expectedConstant:  -1 * float)
  }
  
  func testAttributeEqualsFloatMinusAttribute() {
    assertConstraint(leftView.layout.left == float - rightView.layout.right,
      expectedItem:      leftView,
      expectedAttribute: .Left,
      expectToRelateBy:  .Equal,
      toExpectedItem:    rightView,
      expectedAttribute: .Right,
      expectedMultiplier: -1,
      expectedConstant:   float)
  }
  
  //MARK:- view compared to view with multiplication
  
  func testAttributeEqualsAttributeTimesFloat() {
    assertConstraint(leftView.layout.height == rightView.layout.width * float,
      expectedItem:       leftView,
      expectedAttribute:  .Height,
      expectToRelateBy:   .Equal,
      toExpectedItem:     rightView,
      expectedAttribute:  .Width,
      expectedMultiplier: float)
  }
  
  func testAttributeTimesFloatEqualsAttribute() {
    assertConstraint(leftView.layout.height * float == rightView.layout.width,
      expectedItem:       leftView,
      expectedAttribute:  .Height,
      expectToRelateBy:   .Equal,
      toExpectedItem:     rightView,
      expectedAttribute:  .Width,
      expectedMultiplier: 1 / float)
  }
  
  func testAttributeTimeFloatEqualsAttributeTimesFloat() {
    assertConstraint(leftView.layout.height * float == float * rightView.layout.width * float,
      expectedItem:       leftView,
      expectedAttribute:  .Height,
      expectToRelateBy:   .Equal,
      toExpectedItem:     rightView,
      expectedAttribute:  .Width,
      expectedMultiplier: float)
  }
  
  //MARK:- view compared to view with division
  
  func testAttributeEqualsAttributeDividedByFloat() {
    assertConstraint(leftView.layout.height == rightView.layout.width / float,
      expectedItem:       leftView,
      expectedAttribute:  .Height,
      expectToRelateBy:   .Equal,
      toExpectedItem:     rightView,
      expectedAttribute:  .Width,
      expectedMultiplier: 1 / float)
  }
  
  func testAttributeDividedByFloatEqualsAttribute() {
    assertConstraint(leftView.layout.height / float == rightView.layout.width,
      expectedItem:       leftView,
      expectedAttribute:  .Height,
      expectToRelateBy:   .Equal,
      toExpectedItem:     rightView,
      expectedAttribute:  .Width,
      expectedMultiplier: float)
  }
  
  func testAttributeDividedByFloatEqualsAttributeDividedByFloat() {
    assertConstraint(leftView.layout.height / (float * 2) == rightView.layout.width / float,
      expectedItem:       leftView,
      expectedAttribute:  .Height,
      expectToRelateBy:   .Equal,
      toExpectedItem:     rightView,
      expectedAttribute:  .Width,
      expectedMultiplier: 2)
  }
  
  //MARK:- omnitest
  func testComplexComparison() {
    assertConstraint(float * leftView.layout.height * float / float + float >= float * rightView.layout.width / float - float,
      expectedItem:       leftView,
      expectedAttribute:  .Height,
      expectToRelateBy:   .GreaterThanOrEqual,
      toExpectedItem:     rightView,
      expectedAttribute:  .Width,
      expectedMultiplier: (1 / float),
      expectedConstant:   -2 * float)
  }

}
