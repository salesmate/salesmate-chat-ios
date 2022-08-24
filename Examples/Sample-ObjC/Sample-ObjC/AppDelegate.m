//
//  AppDelegate.m
//  Sample-ObjC
//
//  Created by Vishal Nandoriya on 27/07/22.
//

#import "AppDelegate.h"
#import <SalesmateChatSDK/SalesmateChatSDK.h>

#define SALESMATE_CHAT_SDK_WORKSPACE_ID  @""
#define SALESMATE_CHAT_SDK_APP_KEY @""
#define SALESMATE_CHAT_SDK_API_TENANT_ID @""

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if( !error ) {
            // required to get the app to do anything at all about push notifications
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
            NSLog( @"Push registration success." );
        } else {
            NSLog( @"Push registration FAILED" );
            NSLog( @"ERROR: %@ - %@", error.localizedFailureReason, error.localizedDescription );
            NSLog( @"SUGGESTIONS: %@ - %@", error.localizedRecoveryOptions, error.localizedRecoverySuggestion );
        }
    }];

    
    
    // Chat Configuration
    [self configureSalesmateChatMessengerSDK: SALESMATE_CHAT_SDK_WORKSPACE_ID withAppkey: SALESMATE_CHAT_SDK_APP_KEY withTenatId: SALESMATE_CHAT_SDK_API_TENANT_ID];
    return YES;
}

- (void)configureSalesmateChatMessengerSDK:(NSString *)workspaceID withAppkey:(NSString *)appKey withTenatId:(NSString *)tenantID {
    
    // Note:- environments
    // 0 = Dev
    // 1 = Staging
    // 2 = Production
    
    Configuration *config = [[Configuration alloc] initWithWorkspaceID: workspaceID appKey: appKey tenantID: tenantID environment: 2];
    [SalesmateChat setSalesmateChatWithConfiguration: config];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *deviceTokenString = [[[[deviceToken description]
                                     stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                    stringByReplacingOccurrencesOfString: @">" withString: @""]
                                   stringByReplacingOccurrencesOfString: @" " withString: @""];
        
    [SalesmateChat sendDeviceTokenWith:deviceTokenString];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    
    NSDictionary *userInfo = notification.request.content.userInfo;
    
    if (userInfo != nil) {
        if ([SalesmateChat isSalesmateChatSDKPushNotificationWithUserInfo: userInfo]) {
            [SalesmateChat handlePushNotificationWithUserInfo: userInfo];
            return;
        }
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    
    if (userInfo != nil) {
        if ([SalesmateChat isSalesmateChatSDKPushNotificationWithUserInfo: userInfo]) {
            [SalesmateChat handlePushNotificationWithUserInfo: userInfo];
            return;
        }
    }
    
    completionHandler();
}

@end
