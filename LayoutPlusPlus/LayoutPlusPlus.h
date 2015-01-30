//
//  LayoutPlusPlus.h
//  Layout++
//

#import <TargetConditionals.h>

#if TARGET_OS_IPHONE
  #import <UIKit/UIKit.h>
#else
  #import <AppKit/AppKit.h>
#endif

//! Project version number for LayoutPlusPlus-iOS.
FOUNDATION_EXPORT double LayoutPlusPlus_iOSVersionNumber;

//! Project version string for LayoutPlusPlus-iOS.
FOUNDATION_EXPORT const unsigned char LayoutPlusPlus_iOSVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <LayoutPlusPlus_iOS/PublicHeader.h>


