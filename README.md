
# react-native-lomocoin-push

基于个推的react-native 推送


### link

```
react-native link
```

### iOS config

需要在Setting -> Build Phases -> Link Binary With Libraries 中引用一下系统库：
- libc++.tbd
- libz.tbd
- libsqlite3.tbd
- UIKit.framework
- Foundation.framework
- Security.framework
- MobileCoreServices.framework
- SystemConfiguration.framework
- CoreTelephony.framework
- AVFoundation.framework
- CoreLocation.framework
- UserNotifications.framework (iOS 10 及以上需添加，使用 Optional 方式接入)
- AdSupport.framework   （如果使用无IDFA版本SDK，则需删除该 AdSupport 库）


同样需在此引用个推sdk
在 Add Other 中选择
node_modules -> react-native-lomocoin-push -> ios -> PushNotification ->
GtSdkLib -> GTSDK.framework 和 GTExtensionSDK.framework
