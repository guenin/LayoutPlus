//
//  operations.swift
//  Layout++
//

//MARK: math-ish operations

public func + (left: LayoutValue, right: CGFloat) -> LayoutValue {
  return left.plus(right)
}

public func + (left: CGFloat, right: LayoutValue) -> LayoutValue {
  return right.plus(left)
}

public func - (left: LayoutValue, right: CGFloat) -> LayoutValue {
  return left.minus(right)
}

public func - (left: CGFloat, right: LayoutValue) -> LayoutValue {
  return right.times(-1).plus(left)
}

public func * (left: LayoutValue, right: CGFloat) -> LayoutValue {
  return left.times(right)
}

public func * (left: CGFloat, right: LayoutValue) -> LayoutValue {
  return right.times(left)
}

public func / (left: LayoutValue, right: CGFloat) -> LayoutValue {
  return left.divide(right)
}

// there's no way to represent CGFloat / LayoutValue as an NSLayoutConstraint, so no:
// public func / (left: CGFloat, right: LayoutValue) -> LayoutValue {}

//MARK:- Compare two LayoutValues

public func == (left: LayoutValue, right: LayoutValue) -> NSLayoutConstraint {
  return left.constrainBy(.Equal, to: right)
}

public func >= (left: LayoutValue, right: LayoutValue) -> NSLayoutConstraint {
  return left.constrainBy(.GreaterThanOrEqual, to: right)
}

public func <= (left: LayoutValue, right: LayoutValue) -> NSLayoutConstraint {
  return left.constrainBy(.LessThanOrEqual, to: right)
}

//MARK:- Compare LayoutValue to CGFloat

public func == (left: LayoutValue, right: CGFloat) -> NSLayoutConstraint {
  return left.constrainBy(.Equal, to: right)
}

public func == (left: CGFloat, right: LayoutValue) -> NSLayoutConstraint {
  return right == left
}

public func >= (left: LayoutValue, right: CGFloat) -> NSLayoutConstraint {
  return left.constrainBy(.GreaterThanOrEqual, to: right)
}

public func >= (left: CGFloat, right: LayoutValue) -> NSLayoutConstraint {
  return right <= left
}

public func <= (left: LayoutValue, right: CGFloat) -> NSLayoutConstraint {
  return left.constrainBy(.LessThanOrEqual, to: right)
}

public func <= (left: CGFloat, right: LayoutValue) -> NSLayoutConstraint {
  return right >= left
}