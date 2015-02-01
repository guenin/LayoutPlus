//
//  View.swift
//  Layout+
//

#if os(iOS)
  public typealias View = UIView
#elseif os(OSX)
  public typealias View = NSView
#endif

extension View {
  public var layout: Attributer {
    return Attributer(view: self)
  }
}