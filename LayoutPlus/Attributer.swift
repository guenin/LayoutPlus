//
//  Attributer.swift
//  Layout+
//

public struct Attributer {
  let view: View
  
  init(view: View) {
    self.view = view
  }
  
  //MARK:- attribute properties (mirrors NSLayoutAttribute)
  
  public var left: Expression {
    return value(.Left)
  }
  
  public var right: Expression {
    return value(.Right)
  }
  
  public var top: Expression {
    return value(.Top)
  }
  
  public var bottom: Expression {
    return value(.Bottom)
  }
  
  public var leading: Expression {
    return value(.Leading)
  }
  
  public var trailing: Expression {
    return value(.Trailing)
  }
  
  public var height: Expression {
    return value(.Height)
  }
  
  public var width: Expression {
    return value(.Width)
  }
  
  public var centerX: Expression {
    return value(.CenterX)
  }
  
  public var centerY: Expression {
    return value(.CenterY)
  }
  
  public var baseline: Expression {
    return value(.Baseline)
  }
  
  //MARK:- private
  
  private func value(attribute: NSLayoutAttribute) -> Expression {
    return Expression(view: view, attribute: attribute)
  }

}

//MARK:- iOS-only attributes
#if os(iOS)
  
  extension Attributer {
    public var firstBaseline: Expression {
      return value(.FirstBaseline)
    }
    
    public var leftMargin: Expression {
      return value(.LeftMargin)
    }
    
    public var rightMargin: Expression {
      return value(.RightMargin)
    }
    
    public var topMargin: Expression {
      return value(.TopMargin)
    }
    
    public var bottomMargin: Expression {
      return value(.BottomMargin)
    }
    
    public var leadingMargin: Expression {
      return value(.LeadingMargin)
    }
    
    public var trailingMargin: Expression {
      return value(.TrailingMargin)
    }
    
    public var centerXWithinMargins: Expression {
      return value(.CenterXWithinMargins)
    }
    
    public var centerYWithinMargins: Expression {
      return value(.CenterYWithinMargins)
    }
  }
  
#endif
