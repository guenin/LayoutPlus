//
//  LayoutView.swift
//  Layout+
//

#if os(iOS)
  public typealias LayoutView = UIView
#elseif os(OSX)
  public typealias LayoutView = NSView
#endif

extension LayoutView {
  public var layout: LayoutAttributer {
    return LayoutAttributer(view: self)
  }
}