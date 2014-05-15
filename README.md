GrowthPush SDK for iOS
==================

GrowthPush is push notification and analysis platform for smart devices.

https://growthpush.com/

## Easy usage

```objc
[EasyGrowthPush setApplicationId:YOUR_APP_ID secret:@"YOUR_APP_SECRET" environment:kGrowthPushEnvironment debug:YES]; 
```

That's all. GrowthPush instance will get APNS device token, send it to server, track launching event and tag the device information. You can get the app ID and secret on web site of GrowthPush. 

You can get furthermore information on [GrowthPush documetations](https://growthpush.com/documents).

## How to track "Launch via push notification xxx"

1. Add UIApplication+GrowthPush.h and UIApplication+GrowthPush.m to your project
1. Disable ARC for UIApplication+GrowthPush.m by adding "-fno-objc-arc" flag. 

## Building GrowthPush.framework

[iOS-Universal-Framework](https://github.com/kstenerud/iOS-Universal-Framework) is required.

```shell
git clone https://github.com/kstenerud/iOS-Universal-Framework.git
cd ./iOS-Universal-Framework/Real\ Framework/
./install.sh
```

1. Set the build configuration of "Run" to Release.
2. Select the destination to "iOS device"
3. Build the framework
4. The framework will be generated under "Products"

## License

Licensed under the Apache License.
