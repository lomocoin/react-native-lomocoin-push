//
//  PushNotification.m
//  PushNotification
//
//  Created by SUN on 2017/11/8.
//  Copyright © 2017年 lomocoin. All rights reserved.
//

#import "PushNotification.h"

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

#import <GTSDK/GeTuiSdk.h>

@implementation PushNotification

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(PushNotificationModule)

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"receivePushNotification"];
}

RCT_EXPORT_METHOD(setupPush) {
    // if you add register notification in Appdelegate.m , don't need call this function
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        //iOS10
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                // user access push notifications permission
                [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                }];
            } else {
                // user reject push notifications permission
            }
        }];
    }
    else if ([application
              respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        //iOS 8 or later
        UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                                settingsForTypes:(UIUserNotificationTypeBadge |
                                                                  UIUserNotificationTypeSound |
                                                                  UIUserNotificationTypeAlert)
                                                categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    // register Notifications
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

/*!
 * 设置 个推 SDK
 */
RCT_EXPORT_METHOD(setupPushNotification:(NSString *)kGtAppId
                  appKey:(NSString *)kGtAppKey
                  appSecret:(NSString *)kGtAppSecret) {
    dispatch_async(dispatch_get_main_queue(), ^{
        // 通过个推平台分配的appId、 appKey 、appSecret 启动SDK，注：该方法需要在主线程中调用
        [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:self];
    });
}

/*!
 * 设置 deviceToken
 */
RCT_EXPORT_METHOD(registerDeviceToken:(NSString *)deviceToken) {
    [GeTuiSdk registerDeviceToken:deviceToken];
}

/*!
 * 设置 tags
 */
RCT_EXPORT_METHOD(setTags:(NSArray *)tags) {
    [GeTuiSdk setTags:tags];
}

/*!
 * 绑定 Alias 别名
 */
RCT_EXPORT_METHOD(bindAlias:(NSString *)alias sequenceNum:(NSString *)aSn) {
    // alias 别名          aSn 绑定序列码
    [GeTuiSdk bindAlias:alias andSequenceNum:aSn];
}

/*!
 * 取消绑定 Alias 别名
 */
RCT_EXPORT_METHOD(unbindAlias:(NSString *)alias sequenceNum:(NSString *)aSn isSelf:(BOOL)isSelf) {
    // alias 别名          aSn 绑定序列码     isSelf  是否只对当前cid有效，如果是true，只对当前cid做解绑；如果是false，对所有绑定该别名的cid列表做解绑
    [GeTuiSdk unbindAlias:alias andSequenceNum:aSn andIsSelf:isSelf];
}

/*!
 * 设置角标(到服务器)
 *
 * @param value 新的值. 会覆盖服务器上保存的值(这个用户)
 * 本接口用于配合 JPush 提供的服务器端角标功能.
 * 该功能解决的问题是, 服务器端推送 APNs 时, 并不知道客户端原来已经存在的角标是多少, 指定一个固定的数字不太合理.
 */
RCT_EXPORT_METHOD(setBadge:(NSInteger)value) {
    [GeTuiSdk setBadge:value]; //同步本地角标值到服务器
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge]; //APP 显示角标需开发者调用系统方法进行设置
}

/*!
 * 重置角标
 */
RCT_EXPORT_METHOD(resetBadge) {
    [GeTuiSdk resetBadge]; //重置角标计数
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0]; // APP 清空角标
}

@end
