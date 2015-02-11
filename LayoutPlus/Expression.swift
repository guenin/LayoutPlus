//
//  Expression.swift
//  Layout+
//

public struct Expression {
  let view: View
  let attribute: NSLayoutAttribute
  let multiplier: CGFloat
  let constant: CGFloat
  
  init(view: View, attribute: NSLayoutAttribute = .NotAnAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0) {
    self.view = view
    self.attribute = attribute
    self.multiplier = multiplier
    self.constant = constant
  }
  
  //MARK:- mathmatical operations
  
  func plus(addend: CGFloat) -> Expression {
    let sum = constant + addend
    return expression(constant: sum)
  }
  
  func minus(subtrahend: CGFloat) -> Expression {
    let sum = constant - subtrahend
    return expression(constant: sum)
  }
  
  func times(multiplier: CGFloat) -> Expression {
    let product = self.multiplier * multiplier
    return expression(multiplier: product)
  }
  
  func divide(divisor: CGFloat) -> Expression {
    let dividend = self.multiplier / divisor
    return expression(multiplier: dividend)
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
  
  func constrainBy(relation: NSLayoutRelation, to other: Expression) -> NSLayoutConstraint {
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
  
  private func expression(
    view: View? = nil, attribute: NSLayoutAttribute? = nil, multiplier: CGFloat? = nil, constant: CGFloat? = nil) -> Expression {
      return Expression(
        view:       view ?? self.view,
        attribute:  attribute ?? self.attribute,
        multiplier: multiplier ?? self.multiplier,
        constant:   constant ?? self.constant)
  }
}
