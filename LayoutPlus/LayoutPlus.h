//
//  LayoutPlus.h
//  Layout+
//

#import <TargetConditionals.h>

#if TARGET_OS_IPHONE
  #import <UIKit/UIKit.h>
#else
  #import <AppKit/AppKit.h>
#endif

//! Project version number for LayoutPlus.
FOUNDATION_EXPORT double LayoutPlus_iOSVersionNumber;

//! Project version string for LayoutPlus.
FOUNDATION_EXPORT const unsigned char LayoutPlus_iOSVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <LayoutPlus/PublicHeader.h>


