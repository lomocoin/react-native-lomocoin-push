//
//  PushNotification.h
//  PushNotification
//
//  Created by SUN on 2017/11/8.
//  Copyright © 2017年 lomocoin. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#elif __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#elif __has_include("React/RCTBridgeModule.h")
#import "React/RCTBridgeModule.h"
#endif

@interface PushNotification : NSObject <RCTBridgeModule>

@end
