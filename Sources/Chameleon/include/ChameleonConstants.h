//
//  Constants.h
//  Chameleon
//
//  Created by Vicc Alexander on 6/4/15.
//  Copyright (c) 2015 Vicc Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  A contrasting status bar, intended for use on any backgrounds.
 *
 *  @since 2.0
 */
extern const UIStatusBarStyle UIStatusBarStyleContrast;

/**
 *  A dark content status bar for iOS 13+
 *
 *  @since 3.0
 */
API_AVAILABLE(ios(13.0))
extern const UIStatusBarStyle UIStatusBarStyleDarkContentCompat;

@interface ChameleonConstants : NSObject

@end
