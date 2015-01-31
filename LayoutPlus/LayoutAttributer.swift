//
//  LayoutAttributer.swift
//  Layout+
//

public struct LayoutAttributer {
  let view: LayoutView
  
  init(view: LayoutView) {
    self.view = view
  }
  
  //MARK:- attribute properties (mirrors NSLayoutAttribute)
  
  public var left: LayoutValue {
    return value(.Left)
  }
  
  public var right: LayoutValue {
    return value(.Right)
  }
  
  public var top: LayoutValue {
    return value(.Top)
  }
  
  public var bottom: LayoutValue {
    return value(.Bottom)
  }
  
  public var leading: LayoutValue {
    return value(.Leading)
  }
  
  public var trailing: LayoutValue {
    return value(.Trailing)
  }
  
  public var height: LayoutValue {
    return value(.Height)
  }
  
  public var width: LayoutValue {
    return value(.Width)
  }
  
  public var centerX: LayoutValue {
    return value(.CenterX)
  }
  
  public var centerY: LayoutValue {
    return value(.CenterY)
  }
  
  public var baseline: LayoutValue {
    return value(.Baseline)
  }
  
  //MARK:- private
  
  private func value(attribute: NSLayoutAttribute) -> LayoutValue {
    return LayoutValue(view: view, attribute: attribute)
  }

}

//MARK:- iOS-only attributes
#if os(iOS)
  
  extension LayoutAttributer {
    public var firstBaseline: LayoutValue {
      return value(.FirstBaseline)
    }
    
    public var leftMargin: LayoutValue {
      return value(.LeftMargin)
    }
    
    public var rightMargin: LayoutValue {
      return value(.RightMargin)
    }
    
    public var topMargin: LayoutValue {
      return value(.TopMargin)
    }
    
    public var bottomMargin: LayoutValue {
      return value(.BottomMargin)
    }
    
    public var leadingMargin: LayoutValue {
      return value(.LeadingMargin)
    }
    
    public var trailingMargin: LayoutValue {
      return value(.TrailingMargin)
    }
    
    public var centerXWithinMargins: LayoutValue {
      return value(.CenterXWithinMargins)
    }
    
    public var centerYWithinMargins: LayoutValue {
      return value(.CenterYWithinMargins)
    }
  }
  
#endif
