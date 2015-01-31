//
//  LayoutValue.swift
//  Layout+
//

public struct LayoutValue {
  let view: LayoutView
  let attribute: NSLayoutAttribute
  let multiplier: CGFloat
  let constant: CGFloat
  
  init(view: LayoutView, attribute: NSLayoutAttribute = .NotAnAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0) {
    self.view = view
    self.attribute = attribute
    self.multiplier = multiplier
    self.constant = constant
  }
  
  //MARK:- mathmatical operations
  
  func plus(addend: CGFloat) -> LayoutValue {
    let sum = constant + addend
    return value(constant: sum)
  }
  
  func minus(subtrahend: CGFloat) -> LayoutValue {
    let sum = constant - subtrahend
    return value(constant: sum)
  }
  
  func times(multiplier: CGFloat) -> LayoutValue {
    let product = self.multiplier * multiplier
    return value(multiplier: product)
  }
  
  func divide(divisor: CGFloat) -> LayoutValue {
    let dividend = self.multiplier / divisor
    return value(multiplier: dividend)
  }
  
  //MARK:- create constraints
  
  func constrainBy(relation: NSLayoutRelation, to otherConstant: CGFloat) -> NSLayoutConstraint {
    let combinedConstant = otherConstant - constant
    
    return NSLayoutConstraint(
      item:       view,
      attribute:  attribute,
      relatedBy:  relation,
      toItem:     nil,
      attribute:  .NotAnAttribute,
      multiplier: 1,
      constant:   combinedConstant)
  }
  
  func constrainBy(relation: NSLayoutRelation, to other: LayoutValue) -> NSLayoutConstraint {
    let combinedMultiplier = other.multiplier / multiplier
    let combinedConstant = other.constant - constant
    
    return NSLayoutConstraint(
      item:       view,
      attribute:  attribute,
      relatedBy:  relation,
      toItem:     other.view,
      attribute:  other.attribute,
      multiplier: combinedMultiplier,
      constant:   combinedConstant)
  }
  
  //MARK:- private
  
  private func value(
    view: LayoutView? = nil, attribute: NSLayoutAttribute? = nil, multiplier: CGFloat? = nil, constant: CGFloat? = nil) -> LayoutValue {
      return LayoutValue(
        view:       view ?? self.view,
        attribute:  attribute ?? self.attribute,
        multiplier: multiplier ?? self.multiplier,
        constant:   constant ?? self.constant)
  }
}
