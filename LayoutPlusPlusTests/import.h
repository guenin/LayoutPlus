//
//  import.h
//  Layout++ Tests
//

#import <TargetConditionals.h>

#if TARGET_OS_IPHONE
  #import <UIKit/UIKit.h>
#else
  #import <AppKit/AppKit.h>
#endif