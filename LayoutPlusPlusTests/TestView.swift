//
//  TestView.swift
//  Layout++ Tests
//

#if os(iOS)
  import UIKit
  typealias TestView = UIView
#elseif os(OSX)
  import AppKit
  typealias TestView = NSView
#endif
