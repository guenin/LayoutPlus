//
//  LayoutView.swift
//  Layout++
//

#if os(iOS)
  typealias LayoutView = UIView
#elseif os(OSX)
  typealias LayoutView = NSView
#endif

extension LayoutView {
  public var layout: LayoutAttributer {
    return LayoutAttributer(view: self)
  }
}