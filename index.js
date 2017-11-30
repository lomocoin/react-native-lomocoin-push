'use strict';
import {
    NativeModules,
    DeviceEventEmitter,
    NativeEventEmitter
}
    from 'react-native';

const PushNotification = NativeModules.PushNotificationModule;


export default {
    
    setupPushConfig(){
        return PushNotification.setupPush();
    },
    setupPushNotification(kGtAppId, kGtAppKey, kGtAppSecret){
        return PushNotification.setupPushNotification(kGtAppId, kGtAppKey, kGtAppSecret);
    },
    registerDeviceToken(deviceToken){
        return PushNotification.registerDeviceToken(deviceToken);
    },
    setTags(array){
        return PushNotification.setTags(array);
    },
    bindAlias(alias, aSn){
        return PushNotification.bindAlias(alias, aSn);
    },
    unbindAlias(alias, aSn, isSelf){
        return PushNotification.unbindAlias(alias, aSn, isSelf);
    },
    setBadge(value){
        return PushNotification.setBadge(value);
    },
    resetBadge(){
        return PushNotification.resetBadge();
    },
};
