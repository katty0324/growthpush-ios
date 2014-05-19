//
//  UIApplication+GrowthPush.m
//  GrowthPushSample
//
//  Created by Kataoka Naoyuki on 2014/05/14.
//  Copyright (c) 2014年 SIROK, Inc. All rights reserved.
//

#import "UIApplication+GrowthPush.h"
#import <objc/runtime.h>
#import <GrowthPush/GrowthPush.h>

@interface GPAppDelegateWrapper : UIResponder <UIApplicationDelegate>

@end

@protocol GPLaunchViaPushNotificationAppDelegateWrapperDelegate <NSObject>

@optional

- (BOOL)willPerformApplication:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (BOOL)didPerformApplication:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (BOOL)willPerformApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (BOOL)didPerformApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)willPerformApplicationDidBecomeActive:(UIApplication *)application;
- (void)didPerformApplicationDidBecomeActive:(UIApplication *)application;
- (void)willPerformApplicationWillResignActive:(UIApplication *)application;
- (void)didPerformApplicationWillResignActive:(UIApplication *)application;
- (void)willPerformApplication:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (void)didPerformApplication:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (void)willPerformApplication:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
- (void)didPerformApplication:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
- (void)willPerformApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
- (void)didPerformApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
- (void)willPerformApplication:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification;
- (void)didPerformApplication:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification;
- (void)willPerformApplicationDidEnterBackground:(UIApplication *)application;
- (void)didPerformApplicationDidEnterBackground:(UIApplication *)application;
- (void)willPerformApplicationWillEnterForeground:(UIApplication *)application;
- (void)didPerformApplicationWillEnterForeground:(UIApplication *)application;

@end

@interface GPLaunchViaPushNotificationAppDelegateWrapper : UIResponder <UIApplicationDelegate> {
    
    id <GPLaunchViaPushNotificationAppDelegateWrapperDelegate> delegate;
    UIResponder <UIApplicationDelegate> *originalAppDelegate;
    
}

@property (nonatomic, assign) id <GPLaunchViaPushNotificationAppDelegateWrapperDelegate> delegate;
@property (nonatomic, retain) UIResponder <UIApplicationDelegate> *originalAppDelegate;

@end

@implementation GPLaunchViaPushNotificationAppDelegateWrapper

@synthesize delegate;
@synthesize originalAppDelegate;

- (void) forwardInvocation:(NSInvocation *)invocation {
    
    if (!originalAppDelegate) {
        return;
    }
    
    [invocation setTarget:originalAppDelegate];
    [invocation invoke];
    
}

- (NSMethodSignature *) methodSignatureForSelector:(SEL)sel {
    
    if (originalAppDelegate) {
        return [originalAppDelegate methodSignatureForSelector:sel];
    } else {
        return [super methodSignatureForSelector:sel];
    }
    
}

- (BOOL) respondsToSelector:(SEL)aSelector {
    
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    
    if ([originalAppDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    
    return NO;
    
}


- (BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BOOL returnValue = YES;
    
    if ([delegate respondsToSelector:@selector(willPerformApplication:willFinishLaunchingWithOptions:)]) {
        returnValue = [delegate willPerformApplication:application willFinishLaunchingWithOptions:launchOptions] && returnValue;
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(application:willFinishLaunchingWithOptions:)]) {
        returnValue = [originalAppDelegate application:application willFinishLaunchingWithOptions:launchOptions] && returnValue;
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplication:willFinishLaunchingWithOptions:)]) {
        returnValue = [delegate didPerformApplication:application willFinishLaunchingWithOptions:launchOptions] && returnValue;
    }
    
    return returnValue;
    
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BOOL returnValue = YES;
    
    if ([delegate respondsToSelector:@selector(willPerformApplication:didFinishLaunchingWithOptions:)]) {
        returnValue = [delegate willPerformApplication:application didFinishLaunchingWithOptions:launchOptions] && returnValue;
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
        returnValue = [originalAppDelegate application:application didFinishLaunchingWithOptions:launchOptions] && returnValue;
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplication:didFinishLaunchingWithOptions:)]) {
        returnValue = [delegate didPerformApplication:application didFinishLaunchingWithOptions:launchOptions] && returnValue;
    }
    
    return returnValue;
    
}

- (void) applicationDidBecomeActive:(UIApplication *)application {
    
    if ([delegate respondsToSelector:@selector(willPerformApplicationDidBecomeActive:)]) {
        [delegate willPerformApplicationDidBecomeActive:application];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(applicationDidBecomeActive:)]) {
        [originalAppDelegate applicationDidBecomeActive:application];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplicationDidBecomeActive:)]) {
        [delegate didPerformApplicationDidBecomeActive:application];
    }
    
}

- (void) applicationWillResignActive:(UIApplication *)application {
    
    if ([delegate respondsToSelector:@selector(willPerformApplicationWillResignActive:)]) {
        [delegate willPerformApplicationWillResignActive:application];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(applicationWillResignActive:)]) {
        [originalAppDelegate applicationWillResignActive:application];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplicationWillResignActive:)]) {
        [delegate didPerformApplicationWillResignActive:application];
    }
    
}

- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    if ([delegate respondsToSelector:@selector(willPerformApplication:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
        [delegate willPerformApplication:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
        [originalAppDelegate application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplication:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
        [delegate didPerformApplication:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    }
    
}

- (void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    if ([delegate respondsToSelector:@selector(willPerformApplication:didFailToRegisterForRemoteNotificationsWithError:)]) {
        [delegate willPerformApplication:application didFailToRegisterForRemoteNotificationsWithError:error];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]) {
        [originalAppDelegate application:application didFailToRegisterForRemoteNotificationsWithError:error];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplication:didFailToRegisterForRemoteNotificationsWithError:)]) {
        [delegate didPerformApplication:application didFailToRegisterForRemoteNotificationsWithError:error];
    }
    
}

- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    if ([delegate respondsToSelector:@selector(willPerformApplication:didReceiveRemoteNotification:)]) {
        [delegate willPerformApplication:application didReceiveRemoteNotification:userInfo];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(application:didReceiveRemoteNotification:)]) {
        [originalAppDelegate application:application didReceiveRemoteNotification:userInfo];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplication:didReceiveRemoteNotification:)]) {
        [delegate didPerformApplication:application didReceiveRemoteNotification:userInfo];
    }
    
}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    if ([delegate respondsToSelector:@selector(willPerformApplication:didReceiveLocalNotification:)]) {
        [delegate willPerformApplication:application didReceiveLocalNotification:notification];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(application:didReceiveLocalNotification:)]) {
        [originalAppDelegate application:application didReceiveLocalNotification:notification];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplication:didReceiveLocalNotification:)]) {
        [delegate didPerformApplication:application didReceiveLocalNotification:notification];
    }
    
}

- (void) applicationDidEnterBackground:(UIApplication *)application {
    
    if ([delegate respondsToSelector:@selector(willPerformApplicationDidEnterBackground:)]) {
        [delegate willPerformApplicationDidEnterBackground:application];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(applicationDidEnterBackground:)]) {
        [originalAppDelegate applicationDidEnterBackground:application];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplicationDidEnterBackground:)]) {
        [delegate didPerformApplicationDidEnterBackground:application];
    }
    
}

- (void) applicationWillEnterForeground:(UIApplication *)application {
    
    if ([delegate respondsToSelector:@selector(willPerformApplicationWillEnterForeground:)]) {
        [delegate willPerformApplicationWillEnterForeground:application];
    }
    
    if ([originalAppDelegate respondsToSelector:@selector(applicationWillEnterForeground:)]) {
        [originalAppDelegate applicationWillEnterForeground:application];
    }
    
    if ([delegate respondsToSelector:@selector(didPerformApplicationWillEnterForeground:)]) {
        [delegate didPerformApplicationWillEnterForeground:application];
    }
    
}

@end

@interface GPLaunchViaPushNotificationAppDelegateIntercepter : NSObject <GPLaunchViaPushNotificationAppDelegateWrapperDelegate>

@end

@implementation GPLaunchViaPushNotificationAppDelegateIntercepter

- (BOOL) didPerformApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self trackLaunchViaPushNotificationEvent:[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]];
    
    return YES;

}

- (void) didPerformApplication:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    if (application.applicationState == UIApplicationStateActive) {
        return;
    }
    
    [self trackLaunchViaPushNotificationEvent:userInfo];

}

- (void)trackLaunchViaPushNotificationEvent:(NSDictionary *)payload {
    
    if(payload == nil)
        return;
    
    NSDictionary *growthpushDictionary = [payload objectForKey:@"growthpush"];
    if(growthpushDictionary == nil)
        return;
    
    NSString *notificationId = [growthpushDictionary objectForKey:@"notificationId"];
    if(notificationId == nil)
        return;
    
    [GrowthPush trackEvent:[NSString stringWithFormat:@"Launch via push notification %@", notificationId] value:nil];
    
}

@end

@interface GPNothingToDoAppDelegateIntercepter : NSObject <GPLaunchViaPushNotificationAppDelegateWrapperDelegate>

@end

@implementation GPNothingToDoAppDelegateIntercepter

@end

@interface UIApplication ()

- (void) setDelegateWithWrapping:(id<UIApplicationDelegate>)delegate;

@end

@implementation UIApplication (GrowthPush)

+ (void) load {
    
    Method setDelegateMethod = class_getInstanceMethod(self, @selector(setDelegate:));
    IMP setDelegateWithWrappingImplementation = method_getImplementation(class_getInstanceMethod(self, @selector(setDelegateWithWrappingImplementation:)));

    class_addMethod(self, @selector(setDelegateWithWrapping:), setDelegateWithWrappingImplementation, method_getTypeEncoding(setDelegateMethod));
    method_exchangeImplementations(setDelegateMethod, class_getInstanceMethod(self, @selector(setDelegateWithWrapping:)));
    
}

- (void) setDelegateWithWrappingImplementation:(id<UIApplicationDelegate>)delegate {
    
    if ([delegate class] == [GPLaunchViaPushNotificationAppDelegateWrapper class]) {
        return;
    }
    
    GPLaunchViaPushNotificationAppDelegateWrapper *appDelegateWrapper = [[GPLaunchViaPushNotificationAppDelegateWrapper alloc] init];
    [appDelegateWrapper setOriginalAppDelegate:delegate];
    
    if([delegate class] == [GPAppDelegateWrapper class]) {
        [appDelegateWrapper setDelegate:[[GPNothingToDoAppDelegateIntercepter alloc] init]];
    }else{
        [appDelegateWrapper setDelegate:[[GPLaunchViaPushNotificationAppDelegateIntercepter alloc] init]];
    }
    
    [self setDelegateWithWrapping:appDelegateWrapper];
    
}

@end
