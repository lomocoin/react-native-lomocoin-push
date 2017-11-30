
# react-native-lomocoin-push

基于个推的react-native 推送


### link

`
react-native link
`

### iOS config

需要在Setting -> Build Phases -> Link Binary With Libraries 中引用一下系统库：
`
libc++.tbd \n
libz.tbd \n
libsqlite3.tbd \n
UIKit.framework \n
Foundation.framework \n
Security.framework \n
MobileCoreServices.framework \n
SystemConfiguration.framework \n
CoreTelephony.framework \n
AVFoundation.framework \n
CoreLocation.framework \n
UserNotifications.framework (iOS 10 及以上需添加，使用 Optional 方式接入) \n
AdSupport.framework   （如果使用无IDFA版本SDK，则需删除该 AdSupport 库） \n
`

同样需在此引用个推sdk \n
在 Add Other 中选择 \n
node_modules -> react-native-lomocoin-push -> ios -> PushNotification -> \n
GtSdkLib -> GTSDK.framework 和 GTExtensionSDK.framework
