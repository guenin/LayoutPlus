//
//  operations.swift
//  Layout+
//

//MARK: math-ish operations

public func + (left: Expression, right: Value) -> Expression {
  return left.plus(right)
}

public func + (left: Value, right: Expression) -> Expression {
  return right.plus(left)
}

public func - (left: Expression, right: Value) -> Expression {
  return left.minus(right)
}

public func - (left: Value, right: Expression) -> Expression {
  return right.times(-1).plus(left)
}

public func * (left: Expression, right: Value) -> Expression {
  return left.times(right)
}

public func * (left: Value, right: Expression) -> Expression {
  return right.times(left)
}

public func / (left: Expression, right: Value) -> Expression {
  return left.divide(right)
}

// there's no way to represent Value / Expression as an NSLayoutConstraint, so no:
// public func / (left: Value, right: Expression) -> Expression {}

//MARK:- Compare two Expressions

public func == (left: Expression, right: Expression) -> NSLayoutConstraint {
  return left.constrainBy(.Equal, to: right)
}

public func >= (left: Expression, right: Expression) -> NSLayoutConstraint {
  return left.constrainBy(.GreaterThanOrEqual, to: right)
}

public func <= (left: Expression, right: Expression) -> NSLayoutConstraint {
  return left.constrainBy(.LessThanOrEqual, to: right)
}

//MARK:- Compare Expression to Value

public func == (left: Expression, right: Value) -> NSLayoutConstraint {
  return left.constrainBy(.Equal, to: right)
}

public func == (left: Value, right: Expression) -> NSLayoutConstraint {
  return right == left
}

public func >= (left: Expression, right: Value) -> NSLayoutConstraint {
  return left.constrainBy(.GreaterThanOrEqual, to: right)
}

public func >= (left: Value, right: Expression) -> NSLayoutConstraint {
  return right <= left
}

public func <= (left: Expression, right: Value) -> NSLayoutConstraint {
  return left.constrainBy(.LessThanOrEqual, to: right)
}

public func <= (left: Value, right: Expression) -> NSLayoutConstraint {
  return right >= left
}